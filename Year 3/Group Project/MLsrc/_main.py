# Authors: @sp773
# ----------------------------------------------------------------------------
# Imports
import keras.models
from MLsrc.Data.SentimentAnalysis import *
from MLsrc.Data.TechnicalAnalysis import *
from MLsrc.Features.BuildFeatures import *
from MLsrc.Models.Train import *
from MLsrc.Models.Predict import *
from MLsrc.Models.Recommend import *
from MLsrc.Visualisation.Visualise import *
import datetime
from datetime import timedelta, date
import os

# Globals
training_start = datetime.datetime.strptime("2021-3-15", "%Y-%m-%d")
training_end = datetime.datetime.strptime("2022-1-1", "%Y-%m-%d")
testing_start = datetime.datetime.strptime("2021-12-25", "%Y-%m-%d")
testing_end = datetime.datetime.strptime("2022-2-15", "%Y-%m-%d")
predictions_testing_start = datetime.datetime.strptime("2022-2-15", "%Y-%m-%d")

current = os.path.dirname(os.path.realpath(__file__))
parent = os.path.dirname(current)
mode = "predict"
stock = 'CSCO'

def run(stock, mode):
    modelSave = parent + '/MLsrc/Models/SavedModels/' + stock

    feature_columns = ['date', 'compound', 'SMA1', 'SMA2', 'RSI', 'High', 'Low', 'Open', 'Close']

    if mode.find("predict") != -1:
        # Recommendation Dates
        prediction_end = date.today()
        prediction_start = prediction_end - timedelta(days=21)
        present = date.today()
        days_future_recommend = 1

        # Preparing Recommendation Data
        headlines = get_news_rec(stock, prediction_start, prediction_end)
        technical_set = technical_analysis(stock, prediction_start, prediction_end)
        sentiment_set = sentiment_analysis(headlines)
        dataset, dataset_dates, dataset_compound_np = build_features(technical_set, sentiment_set, feature_columns)

        # Scale and Merge Recommendation Data
        dataset_scaled, scaler = scale_data(dataset)
        dataset_merged_np = merge_data(dataset_compound_np, dataset_scaled)

        # Transform Data Into Timeseries Format
        x = shape_recommendation_data(dataset_merged_np)

        # Load Model
        model = keras.models.load_model(modelSave)

        # Get Future Price Prediction
        forecast = predict(model, days_future_recommend, dataset_dates, dataset_scaled, x, scaler)
        past_prices = get_past_prices(stock, prediction_start, prediction_end)

        # Get Recommendation
        recommendation, results = recommend(stock, present, forecast, past_prices)
        results['Date'][16] = results['Date'][15] + timedelta(days=1)
        print(recommendation, results)

        return recommendation, results

    if mode.find("train") != -1:
        days_future_test = 20

        # Preparing Training Data
        headlines_train = pd.read_excel("Data/Headlines/" + stock + "-train-&-test-headlines.xlsx",
                                        index_col=0, dtype={'headline': str})
        sentiment_set_train = sentiment_analysis(headlines_train)
        technical_set_train = technical_analysis(stock, training_start, training_end)
        dataset_train, dataset_dates_train, dataset_compound_np_train = build_features(
                                        technical_set_train, sentiment_set_train, feature_columns)

        # Preparing Training Features
        dataset_scaled_train, scaler_train = scale_data(dataset_train)
        dataset_merged_np_train = merge_data(dataset_compound_np_train, dataset_scaled_train)
        x_train, y_train = shape_data(dataset_merged_np_train)

        # Preparing Testing Data
        headlines_test = pd.read_excel("Data/Headlines/" + stock + "-train-&-test-headlines.xlsx",
                                       index_col=0, dtype={'headline': str})
        sentiment_set_test = sentiment_analysis(headlines_test)
        technical_set_test = technical_analysis(stock, testing_start, testing_end)
        dataset_test, dataset_dates_test, dataset_compound_np_test = build_features(
                                        technical_set_test, sentiment_set_test, feature_columns)

        # Preparing Testing Features
        dataset_scaled_test, scaler_test = scale_data(dataset_test)
        dataset_merged_np_test = merge_data(dataset_compound_np_test, dataset_scaled_test)
        x_test, y_test = shape_data(dataset_merged_np_test)

        # Stock Handling
        history = model_loader(stock, x_train, x_test)
        model = keras.models.load_model(modelSave)
        plot_training(history)

        # Predictions of Testing Data
        test = predict(model, days_future_test, dataset_dates_test, dataset_scaled_test, x_test, scaler_test)
        results_test = get_close(test, stock, predictions_testing_start, days_future_test)

        return test, results_test

if __name__ == "__main__":
    pred = []
    list = []
    for i in list:
        pred += run(i, mode)
