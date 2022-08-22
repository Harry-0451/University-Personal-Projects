# Authors: @sp773
# ----------------------------------------------------------------------------
# Imports
import pandas_datareader as web

def recommend(stock, present, forecast, past):
    '''
    :param stock: stock
    :param present: today's date
    :param forecast: forecasted price
    :param past: past prices
    :return: String value of recommendation Buy or Sell, dataframe with date and past prices and prediction
    --------------------------
    |    date    |   Close   |
    -------------------------
    | 2022-03-30 |  55.97   |  <--- past prices row(s)
    ------------------------
    | 2022-04-30 |  55.61  |   <--- forecasted price row
    -----------------------
    '''
    buy = False
    sell = False
    recommendation = ""
    present_data = web.get_data_yahoo(stock, present, present)
    present_price = present_data[['Close']]
    forecast = forecast.rename(columns={'ForecastedClose':'Close'})
    present_price_var = present_price.values.tolist()
    forecast_recommend_var = forecast.values.tolist()

    # Append predicted prices to results for UI plotting
    results_for_plotting = past.append(forecast, ignore_index=True)

    if forecast_recommend_var[0] > present_price_var[0]:
        recommendation = "Buy!"
    elif forecast_recommend_var[0] < present_price_var[0]:
        recommendation = "Sell!"

    return recommendation, results_for_plotting




