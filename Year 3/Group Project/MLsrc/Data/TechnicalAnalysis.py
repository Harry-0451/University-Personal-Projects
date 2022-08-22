# Authors: @vc244
# ----------------------------------------------------------------------------
# Imports
import pandas as pd
import pandas_datareader as web

def technical_analysis(stock, start, end):
    '''
    :return: Dataframe of float values including High, Low, Open, Close, RSI, SMA1 & SMA2.
    ----------------------------------------------------
    | High | Low  | Open  | Close | RSI  | SMA1 | SMA2 |
    ---------------------------------------------------
    | 56.3 | 55.3 | 55.6 | 55.9  | 21.4 | 55.2 | 55.3 |
    --------------------------------------------------
    High: Highest price of stock on a particular day
    Low: Lowest price of stock on a particular day
    Open: Opening price of stock in the start of a particular day
    Close: Closing price of stock in the end of a particular day
    RSI (Relative Strength Index): momentum indicator which measures the magnitude between the current price
                                   relative to the average high and low prices in a previous trading period
    SMA1 (Simple Moving Average): calculated by adding the price of a stock over 6 days and then dividing by 6 days.
    SMA2 (Simple Moving Average): calculated by adding the price of a stock over 3 days and then dividing by 3 days.
    '''
    ta_data = pd.DataFrame()
    ta_sma = pd.DataFrame()

    # Retrieve data
    ticker = web.get_data_yahoo(stock, start, end)
    ticker_col = ticker[['High', 'Low', 'Open', 'Close']]
    ticker_col = ticker_col.rename(columns={'Close':'ClosingPrice'})

    # RSI Calculation #
    # Period which the Exponential moving average will be calculated on
    window = 5

    #  Retrieves the difference in closing price for the ticker chosen between specified dates
    pricedif = ticker['Close'].diff()

    # Calculates the positive gains and negative gains in the period of time.
    up, down = pricedif.clip(lower=0), -1 * pricedif.clip(upper=0)

    # Calculates average gain based on Exponential Weighted Moving Average
    avg_gain = up.ewm(com=6, adjust=False).mean()
    avg_loss = down.ewm(com=6, adjust=False).mean()

    # Calculates average gain based on Simple Moving Average
    avg_gain2 = up.rolling(window).mean()
    avg_loss2 = down.abs().rolling(window).mean()

    # Calculates the first part of the RSI equation which is RS for Exponential Weighted Moving Average
    rs = avg_gain / avg_loss

    # Calculates the first part of the RSI2 equation which is RS for Simple Moving Average
    rs2 = avg_gain2 / avg_loss2

    # Calculates the RSI using the RS from EWA
    ticker['RSI'] = 100 - (100 / (1 + rs))
    rsi = ticker[['RSI', 'Close']]

    ta_data.append(rsi)
    ta_data = ta_data.append(rsi)
    ta_data = pd.merge(ticker_col, ta_data, how='outer', on='Date')

    # SMA Calculation and Addition to TA Data #

    sma1 = ticker['SMA1'] = ticker['Close'].rolling(6).mean()
    sma2 = ticker['SMA2'] = ticker['Close'].rolling(3).mean()
    ta_sma['SMA1'] = sma1
    ta_sma['SMA2'] = sma2
    ta_data = ta_data.join(ta_sma, on=['Date'])

    technical_set = ta_data.drop(['Close'], axis=1)
    technical_set = technical_set.rename(columns={'ClosingPrice': 'Close'})

    return technical_set