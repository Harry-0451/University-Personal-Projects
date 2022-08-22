### Imports ###

# Sentiment Analysis #
#import lxml
import requests
from termcolor import colored as cl
from urllib.request import urlopen, Request
# Read and visualise data from FinViz
import nltk
from bs4 import BeautifulSoup
#import parsedatetime as pdt
import os
import matplotlib.pyplot as plt
# NLTK SA vader
from nltk.sentiment.vader import SentimentIntensityAnalyzer
# FinnHub
import finnhub
import statistics

# Technical Analysis #
import yahoo_fin as yf
import pandas_ta as pta
import pandas_datareader as web
import numpy as np

# Universal #
import datetime
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import yfinance as yfin
from datetime import date


# ML Model #
from sklearn.metrics import mean_absolute_error
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import MinMaxScaler
# Decision Tree Regressor
from sklearn.tree import DecisionTreeRegressor
from sklearn.model_selection import train_test_split
# Random Forest Regressor
from sklearn.ensemble import RandomForestRegressor
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.layers import Dense, LSTM, Dropout
from keras.models import Sequential
from tensorflow.keras import callbacks
from sklearn import preprocessing
from keras.layers import Conv1D,Flatten,MaxPooling1D,Bidirectional,LSTM,Dropout,TimeDistributed,MaxPool2D
from keras.layers import Dense,GlobalAveragePooling2D

#stocks = ['AAPL', 'AMZN', 'CSCO', 'GOOGL', 'NFLX', 'TSLA']
stocks = ['AAPL']
for stock_item in stocks:
    ### Data Filter for Stock, Start Date, End, Date
    stock = stock_item
    # start = '2021-06-05'
    # end = '9.1.2021'
    start= datetime.datetime.strptime("2017-06-01", "%Y-%m-%d")
    days = 517
    # end = start + datetime.timedelta(days=days)
    end = datetime.datetime.strptime("2021-06-01", "%Y-%m-%d")

    def getactualnews(stock, start, end):
        finnhub_client = finnhub.Client(api_key="c7u5odaad3ifisk2ik60")
        #list_headlines = finnhub_client.company_news('AAPL', _from="2020-06-01", to="2020-06-10")
        start_date = datetime.date(2021, 4, 1)
        final_date = datetime.date(2022, 2 , 25)
        delta = datetime.timedelta(days=5)
        headlines = pd.DataFrame(columns=['datetime', 'headline'])
        while start_date <= final_date:
            end_date = start_date + delta
            list_headlines = finnhub_client.company_news(stock, _from=start_date, to=end_date)
            temp_headlines = pd.DataFrame(list_headlines, columns=['datetime', 'headline'])
            headlines = headlines.append(temp_headlines, ignore_index=True)
            print(headlines)
            start_date += delta
        headlines['datetime'] = pd.to_datetime(headlines['datetime'], unit='s').dt.date
        headlines.sort_values(by='datetime', inplace=True, ascending=True)
        print("unique ", headlines.datetime.unique(), len(headlines))
        print("2 ", headlines)
        headlines = headlines.drop_duplicates('datetime', keep='last')
        print("3 ", headlines, len(headlines))
        return headlines
    #headlines = getactualnews(stock, start, end)

    # # Get headlines from excel file
    # apple_news_file = 'newsaapl.xlsx'
    # apple_news = pd.read_excel(apple_news_file,
    #                           sheet_name=0,
    #                           header=0,
    #                           index_col=False,
    #                           keep_default_na=True
    #                           )
    # print("aapl news head", apple_news)


    ### Sentiment Analysis Function ###
    def SentimentAnalysis(headlines):
        SIA = SentimentIntensityAnalyzer()
        # Adding frequently used words to lexicon to improve efficiency
        new_words = { 'gains' : 2.5, 'buy' : 3.0, 'thrive': 2.5, 'top' : 2.5, 'highlights': 2.0, 'missing out': 1.5,
                  'miss': -1.0, 'misses': -2.0, 'sink' : -1.0, 'sinked' : -2.0, 'sec': -1.5,
                  'high': 2.0, 'low': -1.5, 'rise': 2.0, 'rose': 1.5, 'beat' : 1.5, 'beats': 1.5,
                  'jump': 2.5, 'jumps': 2.5, 'jumping': 2.0, 'jumped': 2.0,
                  'surge': 3.0, 'surges': 3.0, 'surging': 3.0, 'surged': 2.0}
        SIA.lexicon.update(new_words)

        # Implementing Sentiment Analyser, adding scores to the df, storing all data in a dictionary
        polarity_scores = headlines['Headline'].apply(SIA.polarity_scores).tolist()
        scores = pd.DataFrame(polarity_scores)
        news = headlines.join(scores)
        print(scores)
        extracted_date = news['Date']
        scores = scores.join(extracted_date)
        #print("scores", scores)
        sa_compound = scores[['compound', 'Date']]
        return sa_compound


    ### Technical Analysis Function ###
    def TechnicalAnalysis(stock, start, end):
        ta_data = pd.DataFrame()
        ta_macd = pd.DataFrame()
        ta_sma = pd.DataFrame()
        ta_ema = pd.DataFrame()
        ta_stock_data = pd.DataFrame()
        # Retrieve data
        ticker = web.get_data_yahoo(stock, start, end)
        ticker_col = ticker[['High', 'Low', 'Open']]
        ta_stock_data = ta_stock_data.join(ticker_col)

        # RSI Calculation #
        # Period which the moving average will be calculated on
        window = 14

        #  Retrieves the difference in closing price for the ticker chosen between specified dates
        pricedif = ticker['Close'].diff()

        # Removes the first row since it will not have a value previously
        pricedif = pricedif[1:]

        # Skip first 14 days to have real values
        ticker = ticker.iloc[14:]

        # Calculates the positive gains and negative gains in the period of time.
        up, down = pricedif.clip(lower=0), -1*pricedif.clip(upper=0)

        # Calculates average gain based on Exponential Weighted Moving Average
        avg_gain = up.ewm(com=13, adjust=False).mean()
        avg_loss = down.ewm(com=13, adjust=False).mean()

        # Calculates average gain based on Simple Moving Average
        avg_gain2 = up.rolling(window).mean()

        avg_loss2 = down.abs().rolling(window).mean()

        # Calculates the first part of the RSI equation which is RS for Exponential Weighted Moving Average
        rs = avg_gain/avg_loss

        # Calculates the first part of the RSI equation which is RS for Simple Moving Average
        rs2 = avg_gain2/avg_loss2

        # Calculates the RSI using the RS from EWA
        ticker['RSI'] = 100 - (100/(1 + rs))

        # Calculates the RSI using the RS from SMA
        ticker['RSI2'] = 100 - (100/(1 + rs2))

        rsi = ticker[['RSI', 'RSI2', 'Close']]

        ta_data.append(rsi)
        # MACD Calculation #
        # Retrieve data

        # Calculates Exponential Moving Average for 12 and 26 days
        exp1 = ticker['Close'].ewm(span=12, adjust=False, min_periods=12).mean()
        exp2 = ticker['Close'].ewm(span=26, adjust=False, min_periods=26).mean()

        # Subtract 12 day EWM with 26 day
        macd = exp1 - exp2

        #Calculate 9 day EWM for the trigger line
        macd_trigger = macd.ewm(span=9, adjust=False, min_periods=9).mean()

        # Subtract macd with macd_trigger to get the Convergence/Divergence value
        macd_cd = macd - macd_trigger
        ta_macd['MACD'] = macd_cd
        print("ta macd", ta_macd)
        ta_data = pd.merge(ta_macd, rsi, how='outer', on='Date')
        ta_data = pd.merge(ticker_col, ta_data, how='outer', on='Date')

        print("ta after merge ", ta_data)
        ta_data.append(ta_macd)

        # SMA Calculation and Addition to TA Data #

        sma1 = ticker['SMA1'] = ticker['Close'].rolling(5).mean()
        sma2 = ticker['SMA2'] = ticker['Close'].rolling(3).mean()
        ta_sma['SMA1'] = sma1
        ta_sma['SMA2'] = sma2
        ta_data = ta_data.join(ta_sma, on=['Date'])

        #Exponential
        ema1 = ticker['Close'].ewm(span=5, adjust=False).mean()
        ta_ema['EMA'] = ema1
        ta_data = ta_data.join(ta_ema, on=['Date'])
        #print("TA Data ", ta_data)

        return ta_data

    def PredictionData(stock, start, end):
        ticker = web.get_data_yahoo(stock, start, end)
        ticker_col = ticker[['High', 'Low', 'Open','Close']]
        ticker['SMA1'] = ticker['Close'].rolling(5).mean()
        prediction_data = ticker

        return prediction_data

    present_date = date.today()
    start_date = present_date - datetime.timedelta(days=15)
    print("present ", present_date, " start ", start_date)
    prediction_data = PredictionData(stock, start_date, present_date)
    prediction_data = prediction_data.dropna()
    prediction_temp = prediction_data.reset_index()
    #print(prediction_temp)
    prediction_dates = prediction_temp['Date']
    #print(prediction_dates)

    ### Data Filter for Merge of SA & TA

    #sa = SentimentAnalysis(apple_news)
    ta = TechnicalAnalysis(stock, start, end)
    #sa.sort_values(by='Date')
    ta.sort_values(by='Date', inplace=True, ascending=True)
    ta.reset_index(inplace=True)
    ta['row_num'] = np.arange(len(ta))
    #ta = pd.merge(ta, apple_news, how='outer', on='Date')

    # sa['row_num'] = np.arange(len(sa))
    #print("Results of sa", sa)
    #print("Results of ta", ta)
    # ta.Date.astype('datetime64[ns]')

    #sa = sa.rename(columns={'datetime': 'Date'})
    #sa = sa.Date.astype('datetime64[ns]')
    # print(sa)

    #data_merged = ta.merge(sa, on='Date')
    #data_merged = data_merged.drop(columns='row_num')
    #print("merged ", data_merged)
    col = ['MACD', 'RSI', 'RSI2', 'High', 'Low', 'Open', 'Date', 'compound', 'Close']
    # data = data.reindex(columns=col)
    #print("Merged ", data_merged)
    # ta = ta.join(sa)
    # data = ta
    # data.to_excel("modeldata.xlsx")
    #print( "TA: ", ta)
    # print

    # Training and testing Features #
    # ta = ta.set_index(['row_num'], inplace=True)
    # print("ta wit date ", ta)

    data_features = ['SMA1', 'High', 'Low', 'Open', 'Close']
    dataset = ta[data_features]
    dataset = dataset.dropna()
    print(dataset)
    data_dates = ta['Date']
    dataset_head = dataset.head()
    scaler = StandardScaler()
    dataset_scaled = scaler.fit_transform(dataset)
    prediction_scaler = StandardScaler()
    prediction_set = prediction_scaler.fit_transform(prediction_data)
    print("X pred ", prediction_set)

    # Modify data for training
    prediction_past = 7
    prediction_future = 1

    # Shape data in timeseries order
    X, y = [], []
    for item in range(prediction_past, len(dataset_scaled) - prediction_future + 1):
        X.append(prediction_set[item - prediction_past:item, 0:dataset_scaled.shape[1]])
        y.append(dataset_scaled[item + prediction_future - 1:item + prediction_future, 0])
    X, y = np.array(X), np.array(y)
    print("x ", X)

    X_prediction = []
    for item in range(prediction_past, len(dataset_scaled) - prediction_future + 1):
        X_prediction.append(prediction_set[item - prediction_past:item, 0:prediction_set.shape[1]])
    X_prediction = np.array(X_prediction)
    ### Neural Networks ###

    ### LSTM Model for AAPL ###
    if stock == 'AAPL':
        def LstmModel(X, y):
            model = Sequential()
            model.add(LSTM(units=30, activation='relu', input_shape=(X.shape[1], X.shape[2]), return_sequences=True))
            model.add(LSTM(units=20, activation='relu', return_sequences=False))
            # model.add(LSTM(units=10, activation='relu', return_sequences=False))
            model.add(Dropout(0.2))
            model.add(Dense(y.shape[1]))
            model.compile(optimizer='adamax', loss='mse')
            print(model.summary())
            history = model.fit(X, y, epochs=20, batch_size=10, validation_split=0.2, verbose=1)
            model.save('C:/Users/valiv/PycharmProjects/co600/Data Analysis & ML Models/AppleModel')

            plt.plot(history.history['loss'], label='Training loss')
            plt.plot(history.history['val_loss'], label='Validation loss')
            plt.legend()
            plt.show()

            days_future = 20

            forecast_period = pd.date_range(list(data_dates)[-1], periods = days_future, freq = '1d').tolist()
            forecast = model.predict(X[-days_future:])
            print("forecast", forecast)

            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            print("copy", forecast_copy)
            y_prediction = scaler.inverse_transform(forecast_copy)[:,0]
            print("y pred", y_prediction)

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date':np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()
            df_forecast = df_forecast.drop(columns='Date')
            dates_temp = dates_temp.sort_index()
            df_forecast = df_forecast.reset_index(drop=True)
            df_forecast = df_forecast.join(dates_temp)

            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-06-21')
            original = get_original[['Close']]
            #df_forecast = df_forecast.set_index('Index')
            original = original.reset_index()
            #s = pd.Series = (range(20,33))
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()
            # sns.lineplot(original['Date'], original['Close'])
            # sns.lineplot(df_forecast['Date'], df_forecast['Close'])
            # plt.show()

       # LstmModel(X, y)
        def ApplePredict(X):
            model = keras.models.load_model('C:/Users/valiv/PycharmProjects/co600/Data Analysis & ML Models/AppleModel')
            model.compile(optimizer='adam', loss='mse')
            days_future = 20

            forecast_period = pd.date_range(list(data_dates)[-1], periods=days_future, freq='1d').tolist()
            test = X[-days_future:]
            forecast = model.predict(X[-days_future:])
            print("forecast", forecast)

            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            print("copy", forecast_copy)
            y_prediction = scaler.inverse_transform(forecast_copy)[:, 0]
            print("y pred", y_prediction)

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date': np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()
            df_forecast = df_forecast.drop(columns='Date')
            dates_temp = dates_temp.sort_index()
            df_forecast = df_forecast.reset_index(drop=True)
            df_forecast = df_forecast.join(dates_temp)

            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-06-21')
            original = get_original[['Close']]
            # df_forecast = df_forecast.set_index('Index')
            original = original.reset_index()
            # s = pd.Series = (range(20,33))
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()
        ApplePredict(X)

    if stock == 'AMZN':
        def AmznModel(X, y):
            model = Sequential()
            model.add(LSTM(units= 65, activation='relu', input_shape=(X.shape[1], X.shape[2]), return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units = 20, return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units=10, return_sequences=False))
            model.add(Dropout(0.1))
            model.add(Dense(y.shape[1]))
            model.compile(optimizer='adam', loss='mse')
            print(model.summary())
            history = model.fit(X, y, epochs=50, batch_size=32, validation_split=0.15, verbose=1)#
            model.save('C:/Users/valiv/PycharmProjects/co600/Data Analysis & ML Models/Models')

            plt.plot(history.history['loss'], label='Training loss')
            plt.plot(history.history['val_loss'], label='Validation loss')
            plt.legend()
            plt.show()

            days_future = 30

            forecast_period = pd.date_range(list(data_dates)[-1], periods = days_future, freq = '1d').tolist()
            forecast = model.predict(X[-days_future:])

            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            y_prediction = scaler.inverse_transform(forecast_copy)[:,0]

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date':np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()
            df_forecast = df_forecast.drop(columns='Date')
            dates_temp = dates_temp.sort_index()
            df_forecast = df_forecast.reset_index(drop=True)
            df_forecast = df_forecast.join(dates_temp)

            #Plotting
            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-06-30')
            original = get_original[['Close']]
            original = original.reset_index()
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()

        AmznModel(X, y)

        def AmznPredict(stock, model):
            days_future = 1

            forecast_period = pd.date_range(list(prediction_dates)[-1], periods=days_future, freq='1d').tolist()
            forecast = model.predict(prediction_data[-days_future:])

            forecast_copy = np.repeat(forecast, prediction_data.shape[1], axis=-1)
            y_prediction = scaler.inverse_transform(forecast_copy)[:, 0]

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date': np.array(prediction_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            print("df forecast", df_forecast)

        amzn = keras.models.load_model('C:/Users/valiv/PycharmProjects/co600/Data Analysis & ML Models/Models')
        AmznPredict(amzn)

    if stock == 'CSCO':
        def LstmModel(X, y):
            model = Sequential()
            model.add(LSTM(units= 65, activation='relu', input_shape=(X.shape[1], X.shape[2]), return_sequences=True))
            model.add(Dropout(0.2))
            model.add(LSTM(units = 30,  return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units=20,  return_sequences=False))
            model.add(Dropout(0.1))
            model.add(Dense(y.shape[1]))
            model.compile(optimizer='adamax', loss='mse')
            print(model.summary())
            history = model.fit(X, y, epochs=60, batch_size=32, validation_split=0.25, verbose=1)

            plt.plot(history.history['loss'], label='Training loss')
            plt.plot(history.history['val_loss'], label='Validation loss')
            plt.legend()
            plt.show()

            days_future = 40

            forecast_period = pd.date_range(list(data_dates)[-1], periods = days_future, freq = '1d').tolist()
            forecast = model.predict(X[-days_future:])
            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            y_prediction = scaler.inverse_transform(forecast_copy)[:,0]


            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date':np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()

            print("forecast before ", df_forecast)
            print(dates_temp.dtypes)
            df_forecast = df_forecast.drop(columns='Date')
            print("forecast after ", df_forecast)
            print("1 " ,dates_temp)
            print(dates_temp.dtypes)
            #dates_temp = pd.DataFrame(dates_temp, columns=['Date'])
            dates_temp = dates_temp.sort_index()
            print("dates sorted ", dates_temp)
            print("type ", type(dates_temp))
            df_forecast = df_forecast.reset_index(drop=True)
            print("reset index" , df_forecast)
            df_forecast = df_forecast.join(dates_temp)

            #Plotting
            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-07-10')
            original = get_original[['Close']]
            original = original.reset_index()
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()

        LstmModel(X, y)

    if stock == 'GOOGL':
        def ConvModel(X, y):
            model = Sequential()
            model.add(Conv1D(60, kernel_size=1, activation='relu', input_shape=(X.shape[1], X.shape[2])))
            model.add(MaxPooling1D(pool_size=2))
            model.add(Flatten())
            model.add(Dense(25, activation='relu'))
            model.add(Dense(1))
            model.compile(optimizer='adamax', loss='mse')
            print(model.summary())
            # model = Sequential()
            # model.add(TimeDistributed(Conv1D(128, kernel_size=1, activation='relu', input_shape=(None, X.shape[1], X.shape[2]))))
            # model.add(TimeDistributed(MaxPooling1D(2)))
            # model.add(TimeDistributed(Conv1D(256, kernel_size=1, activation='relu')))
            # model.add(TimeDistributed(MaxPooling1D(2)))
            # model.add(TimeDistributed(Conv1D(512, kernel_size=1, activation='relu')))
            # model.add(TimeDistributed(MaxPooling1D(2)))
            # model.add(TimeDistributed(Flatten()))
            # model.add(Bidirectional(LSTM(200, return_sequences=True)))
            # model.add(Dropout(0.25))
            # model.add(Bidirectional(LSTM(200, return_sequences=False)))
            # model.add(Dropout(0.5))
            # model.add(Dense(1, activation='linear'))
            # model.compile(optimizer='RMSprop', loss='mse')
            # model.build(input_shape=(None, X.shape[1], X.shape[2]))
            history = model.fit(X, y, epochs=90, batch_size=32, validation_split=0.12, shuffle=False)
            # print(model.summary())

            plt.plot(history.history['loss'], label='Training loss')
            plt.plot(history.history['val_loss'], label='Validation loss')
            plt.legend()
            plt.show()

            days_future = 25

            forecast_period = pd.date_range(list(data_dates)[-1], periods = days_future, freq = '1d').tolist()
            forecast = model.predict(X[-days_future:])
            #print("forecast", forecast)

            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            #print("copy", forecast_copy)
            y_prediction = scaler.inverse_transform(forecast_copy)[:,0]
            #print("y pred", y_prediction)

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date':np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()

            print("forecast before ", df_forecast)
            print(dates_temp.dtypes)
            df_forecast = df_forecast.drop(columns='Date')
            print("forecast after ", df_forecast)
            print("1 " ,dates_temp)
            print(dates_temp.dtypes)
            #dates_temp = pd.DataFrame(dates_temp, columns=['Date'])
            dates_temp = dates_temp.sort_index()
            print("dates sorted ", dates_temp)
            print("type ", type(dates_temp))
            df_forecast = df_forecast.reset_index(drop=True)
            print("reset index" , df_forecast)
            df_forecast = df_forecast.join(dates_temp)

            #Plotting
            #original = ta[['Date', 'Close']]
            #original['Date'] = pd.to_datetime(original['Date']).dt.strftime('%Y-%m-%d')
            #original = original.loc[original['Date'] >= '2021-1-1']
            #original = original.set_index('Index')
            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-06-27')
            original = get_original[['Close']]
            #df_forecast = df_forecast.set_index('Index')
            original = original.reset_index()
            #s = pd.Series = (range(20,33))
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()
            # sns.lineplot(original['Date'], original['Close'])
            # sns.lineplot(df_forecast['Date'], df_forecast['Close'])
            # plt.show()

        ConvModel(X, y)
        print("GOOGL if")

    if stock == 'NFLX':
        def LstmModel(X, y):
            model = Sequential()
            model.add(LSTM(units=65, activation='relu', input_shape=(X.shape[1], X.shape[2]), return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units=20, return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units=10, return_sequences=False))
            model.add(Dropout(0.1))
            model.add(Dense(y.shape[1]))
            model.compile(optimizer='adam', loss='mse')
            print(model.summary())
            history = model.fit(X, y, epochs=50, batch_size=32, validation_split=0.15, verbose=1)

            plt.plot(history.history['loss'], label='Training loss')
            plt.plot(history.history['val_loss'], label='Validation loss')
            plt.legend()
            plt.show()

            days_future = 30

            forecast_period = pd.date_range(list(data_dates)[-1], periods=days_future, freq='1d').tolist()
            forecast = model.predict(X[-days_future:])

            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            y_prediction = scaler.inverse_transform(forecast_copy)[:, 0]

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date': np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()
            df_forecast = df_forecast.drop(columns='Date')
            dates_temp = dates_temp.sort_index()
            df_forecast = df_forecast.reset_index(drop=True)
            df_forecast = df_forecast.join(dates_temp)

            # Plotting
            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-06-30')
            original = get_original[['Close']]
            original = original.reset_index()
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()


        LstmModel(X, y)

        print("NFLIX if")

    if stock == 'TSLA':
        def LstmModel(X, y):
            model = Sequential()
            model.add(LSTM(units=65, activation='relu', input_shape=(X.shape[1], X.shape[2]), return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units=20, return_sequences=True))
            model.add(Dropout(0.1))
            model.add(LSTM(units=10, return_sequences=False))
            model.add(Dropout(0.1))
            model.add(Dense(y.shape[1]))
            model.compile(optimizer='adamax', loss='mse')
            print(model.summary())
            history = model.fit(X, y, epochs=50, batch_size=32, validation_split=0.10, verbose=1)

            plt.plot(history.history['loss'], label='Training loss')
            plt.plot(history.history['val_loss'], label='Validation loss')
            plt.legend()
            plt.show()

            days_future = 30

            forecast_period = pd.date_range(list(data_dates)[-1], periods=days_future, freq='1d').tolist()
            forecast = model.predict(X[-days_future:])

            forecast_copy = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
            y_prediction = scaler.inverse_transform(forecast_copy)[:, 0]

            forecast_dates = []
            for item in forecast_period:
                forecast_dates.append(item.date())

            df_forecast = pd.DataFrame({'Date': np.array(forecast_dates), 'Close': y_prediction})
            df_forecast['Date'] = pd.to_datetime(df_forecast['Date']).dt.strftime('%Y-%m-%d')
            df_forecast.sort_values(by='Date', inplace=True, ascending=False)
            dates_temp = df_forecast[['Date']].copy()
            df_forecast = df_forecast.drop(columns='Date')
            dates_temp = dates_temp.sort_index()
            df_forecast = df_forecast.reset_index(drop=True)
            df_forecast = df_forecast.join(dates_temp)

            # Plotting
            get_original = web.get_data_yahoo(stock, '2021-06-01', '2021-06-30')
            original = get_original[['Close']]
            original = original.reset_index()
            print("0riginal ", original)
            print("forecast ", df_forecast)

            plt.plot(original['Close'], color='red', label='Actual Stock Price')
            plt.plot(df_forecast['Close'], color='blue', label='Predicted Stock Price')
            plt.title('Stock Price Prediction')
            plt.plot(original['Close'])
            plt.plot(df_forecast['Close'])
            plt.legend()
            plt.show()


        LstmModel(X, y)
        print("TSLA  if")


    def getnews(stock, n_news, start_date, end_date, api_key):
        url = f'https://eodhistoricaldata.com/api/news?api_token={api_key}&s={stock}&limit={n_news}&from={start_date}&to={end_date}'
        news_json = requests.get(url).json()

        news = []

        for i in range(len(news_json)):
            title = news_json[-i]['title']
            news.append(title)
            date = news_json[-i]['date']
            news.append((date))
            print(cl('{}. '.format(i + 1), attrs=['bold']), '{}'.format(title))
        return news

        # print(type(list_headlines))
        # print(list_headlines)
        # print("Headlines from Finnhub: ", headlines)


    #api_key = '61f7ffb392dd56.60891226'
    #newss = getnews(stock, 354, '2021-03-03', '2022-02-10', api_key)
    #print(type(newss))
    #news = pd.DataFrame(newss)
    #news.to_excel("newsaaapl.xlsx", index=False)

    start_date = datetime.datetime.strptime("2021-06-15", "%Y-%m-%d")
    end = 90
    end_date = start_date + datetime.timedelta(days=end)


    ### EOD API Setup ###
    #api_key = '61f7ffb392dd56.60891226'


    #news = getactualnews()

    # ta['Timestamp'] = ta.index
    # print("data ", ta)
    # news['Timestamp'] = news.index
    # news['Timestamp'] = pd.to_datetime(news['datetime'])
    # news = news.drop_duplicates('Timestamp', keep='first')
    # data_merged = pd.merge(ta, news, left_on='Timestamp', right_on='Timestamp', how='outer')
    # print(data_merged)
    # #print(data_merged)















