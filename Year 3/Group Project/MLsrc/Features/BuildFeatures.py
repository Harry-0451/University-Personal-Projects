# Authors: @vc244, @sp773
# ----------------------------------------------------------------------------
# Imports
import numpy as np
from sklearn.preprocessing import MinMaxScaler
import pandas as pd

def build_features(technical_set, sentiment_set, feature_columns):
    '''
    Reformatting inputs in the appropriate data format before scaling
    :param technical_set: technical analysis dataset
    :param sentiment_set: sentiment analysis dataset
    :param feature_columns: features
    :return: dataset - dataframe of feature columns 'compound', 'SMA1', 'SMA2', 'RSI', 'High', 'Low', 'Open', 'Close'
             dataset_dates - dataframe of extracted dates (we do not want to scale dates)
             dataset_compound_np - numpy array of extracted compound values (we do not want to scale compound)
    '''
    dataset = pd.merge(sentiment_set, technical_set, left_on='date', right_index=True)
    dataset = dataset[feature_columns]
    dataset = dataset.dropna()
    # Save dates and drop from main dataset
    dataset_dates = dataset['date']
    dataset = dataset.drop(['date'], axis=1)
    # Save compound and drop from main dataset
    dataset_compound = dataset['compound']
    dataset_compound = dataset_compound.reset_index(drop=True)
    dataset = dataset.drop(['compound'], axis=1)
    # Convert to numpy
    dataset_compound_np = dataset_compound.to_numpy()
    dataset_compound_np = dataset_compound_np.reshape([dataset_compound_np.shape[0], 1])
    return dataset, dataset_dates, dataset_compound_np

def scale_data(dataset):
    '''
    Scale the dataset in a range between -1,1 so all features share the same scale to avoid loss in model accuracy.
    If all features are not in the same range, some variables will have an advantage over others during training.
    The min-max values were chosen because sentiment compound has the same range and data manipulation is easier
    '''
    scaler = MinMaxScaler(feature_range = (-1, 1))
    dataset_scaled = scaler.fit_transform(dataset)

    return dataset_scaled, scaler

def merge_data(dataset_compound_np, dataset_scaled):
    # Merge compound and scaled dataset
    dataset_compound_pd = pd.DataFrame(dataset_compound_np, columns=['compound'])
    dataset_scaled_pd = pd.DataFrame(dataset_scaled,
                                     columns=['SMA1', 'SMA2', 'RSI', 'High', 'Low', 'Open', 'Close'])
    dataset_merged = pd.merge(dataset_compound_pd, dataset_scaled_pd, left_index=True, right_index=True)
    dataset_merged_np = dataset_merged.to_numpy()

    return dataset_merged_np


def shape_data(dataset_scaled):
    prediction_past = 7
    prediction_future = 1
    x, y = [], []

    # Shape into 7+1 days
    for item in range(prediction_past, len(dataset_scaled) - prediction_future + 1):
        x.append(dataset_scaled[item - prediction_past:item, 0:dataset_scaled.shape[1]])
        y.append(dataset_scaled[item + prediction_future - 1:item + prediction_future, 6])
    x, y = np.array(x), np.array(y)

    return x, y

def shape_recommendation_data(dataset_recommend_scaled):
    prediction_past = 7
    x = []

    # Shape into 7 days' format for predictions
    for item in range(prediction_past, len(dataset_recommend_scaled)):
         x.append(dataset_recommend_scaled[item - prediction_past:item, 0:dataset_recommend_scaled.shape[1]])
    x = np.array(x)

    return x

