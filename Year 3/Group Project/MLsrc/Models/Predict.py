# Authors: @vc244, @sp773
# ----------------------------------------------------------------------------
# Imports
import pandas as pd
import pandas_datareader as web
import numpy as np
import datetime

def predict(model, days_future, data_dates, dataset_scaled, X, scaler):
    # Run dataset through model to predict future prices
    forecast = model.predict(X[-days_future:])
    forecast_shaped = np.repeat(forecast, dataset_scaled.shape[1], axis=-1)
    y_prediction = scaler.inverse_transform(forecast_shaped)[:, 0]
    prediction = pd.DataFrame({'ForecastedClose': y_prediction})

    return prediction

def get_close(prediction, stock, start_date, days_future):
    # Get past closing prices and merge with predicted for testing
    end_date = start_date + datetime.timedelta(days=days_future)
    ticker = web.get_data_yahoo(stock, start_date, end_date)
    close = ticker[['Close']]
    close = close.reset_index()
    results = close.merge(prediction, how='inner', left_index=True, right_index=True)

    return results

def get_past_prices(stock, start_date, end_date):
    # Get past closing prices
    ticker = web.get_data_yahoo(stock, start_date, end_date)
    close = ticker[['Close']]
    close = close.reset_index()

    return close
