import dash_table
import dash_bootstrap_components as dbc
import requests
from dash import html, Input, Output, dcc
import plotly.express as px
from dash.dependencies import Input, Output
import pandas as pd
import yfinance as yf
import datetime
import json

from django_plotly_dash import DjangoDash
from .models import Stock

tab_style = {'padding': '2px',
             'fontWeight': 'bold',
            }

app = DjangoDash(name='StockGraphs',external_stylesheets=[dbc.themes.BOOTSTRAP])
df = px.data.stocks()


app.css.append_css({'external_url': '/static/sas/dashcss.css'})
app.layout = html.Div(id='parent', children=[
    dcc.Store(id="store"),
    dcc.Store(id="storeTable"),
    dcc.Input(id='stocks', type='hidden', value="AAPL"),

    dbc.Tabs([
        dbc.Tab(label="StockHistory", tab_id="history", style=tab_style, children=[
            dcc.Textarea(id='text1', style={'width': '100%', 'height': 150, 'border': 'none'},
                value="""Simply put, a stock chart is a graph that shows you the price of a stock over a specific period of time – for example, five years. More advanced stock charts will show additional data, and by understanding the basics you can pull out a lot of information about a stock's historic, current, and expected performance."""),
                
            dcc.Dropdown( id = 'dropdown',style={"margin": "1%",},
                options = [
                    {'label':'1 Day', 'value':'1d' },
                    {'label':'5 Day', 'value':'5d' },
                    {'label':'1 Month', 'value':'1mo' },
                    {'label':'3 Month', 'value':'3mo' },
                    {'label':'6 Month', 'value':'6mo' },
                    {'label': '1 Year', 'value':'1y'},
                    {'label': 'Maximum', 'value':'max'},
                    ],value = 'max'), # Default Value That Gets Loaded In First
                ]),

        dbc.Tab(label="The Moving Average Convergence Divergence", tab_id="macd", style=tab_style, children=[
            dcc.Textarea(id='text', style={'width': '100%', 'height': 150, 'border': 'none'},
                value="""MACD, short for moving average convergence/divergence, is a trading indicator used in technical analysis of stock prices, created by Gerald Appel in the late 1970s. It is designed to reveal changes in the strength, direction, momentum, and duration of a trend in a stock's price. 

To put simply, when the signal line (red one) goes above the MACD line (blue) , it is time to sell. It's time to buy when the MACD (blue) line is above the signal line (red one). Notice that this is done on historical data and is no guarantee it will work in the future. While the results look pretty promising, it is not wise to make your investments solely on one indicator.""")
                ]),

        dbc.Tab(label="RSI", tab_id="rsi", style=tab_style, children=[
            dcc.Textarea(id='text', style={'width': '100%', 'height': 150, 'border': 'none'},
                value="""Simply put, the relative strength index (RSI) is a momentum indicator used in technical analysis that measures the magnitude of recent price changes to evaluate overbought or oversold conditions in the price of a stock or other asset. If the RSI reading is around 30 then that means the stock is over sold. Meaning it may increase in price and regulate itself. If the RSI is around 70 then that means the stock is over bought and maydecrease in price to regulate itself."""
            )]),

        dbc.Tab(label="Sentiment Table", tab_id="table",
            style=tab_style, children=[
            dcc.Textarea(id='text', style={'width': '100%', 'height': 70, 'border': 'none'},
                value="""The process of computationally identifying and categorizing opinions expressed in a piece of text, especially in order to determine whether the attitude towards a particular topic, product, etc. is positive, negative, or neutral."""),


            ]),
        ],
        active_tab="history",
        id="tabs",
    ),
    html.Div(id="tab-content", className="p-4"),
])

@app.callback(
    Output("tab-content", "children"),
    [Input("tabs", "active_tab"), Input("store", "data"), Input("storeTable", "data")],
)
def render_tab(active_tab, data, data2):
    """
    This callback takes the active tab and the stored data,
    and renders the content for the tab.
    """
    if active_tab and data is not None:
        if active_tab == "history":
            return dcc.Graph(figure=data["stock_history"])
        elif active_tab == "macd":
            return dcc.Graph(figure=data["MACD"])
        elif active_tab == "rsi":
            return dcc.Graph(figure=data["RSI"])
        elif active_tab == "table":
            return dbc.Table.from_dataframe(pd.DataFrame(data2), bordered=True, hover=True)
        elif active_tab == "text":
            return "Text"
        else:
            return "No tab selected"

@app.callback(Output(component_id='store', component_property='data'),
              [Input(component_id='stocks', component_property='value'),
              Input(component_id='dropdown', component_property= 'value')])
def graph_update2(stock_ticker, peri):
    """
    This callback takes the stock ticker and the dropdown value,
    and stores the data to be used in the tabs.
    """
    #Stock History
    if peri == '1d':
        ticker_Data = yf.Ticker(stock_ticker).history(period = peri, interval = "1m")
        stockhistory_Figure = px.line(ticker_Data, x=ticker_Data.index.get_level_values('Datetime'), y='Close', title='Share Prices over time')
    else:
        ticker_Data = yf.Ticker(stock_ticker).history(period = peri, interval = "1d")
        stockhistory_Figure = px.line(ticker_Data, x=ticker_Data.index.get_level_values('Date'), y='Close', title='Share Prices over time')
    
    stockhistory_Figure.update_layout(title="Stock's price over time", xaxis_title='Dates', yaxis_title='Prices')

    #RSI
    today = datetime.date.today()
    start_date = today - datetime.timedelta(days=39)

    ticker_Data = yf.download(stock_ticker,start_date,today)

    delta_Value = ticker_Data['Close'].diff()
    up_Value = delta_Value.clip(lower=0)
    down_Value = -1*delta_Value.clip(upper=0)
    up_EMA = up_Value.ewm(com=13, adjust=False).mean()
    down_EMA = down_Value.ewm(com=13, adjust=False).mean()
    relative_Strength = up_EMA/down_EMA

    ticker_Data['RSI'] = 100 - (100/(1 + relative_Strength))

    ticker_Data = ticker_Data.iloc[14:] # Skip first 14 days to have real values

    rsi_Figure = px.line(ticker_Data, x = ticker_Data.index.get_level_values('Date'), y = ticker_Data['RSI'], title="Stock's RSI")

    rsi_Figure.add_hline(y=30, line_color='green')
    rsi_Figure.add_hline(y=70, line_color='red')
    rsi_Figure.update_yaxes(range=[0, 100], row=1, col=1)

    #MACD
    macd_Dataframe = yf.Ticker(stock_ticker).history(period = "1y", interval = "1d")

    ema_12 = macd_Dataframe['Close'].ewm(span=12, adjust=False, min_periods=12).mean() # Get the 12-day EMA of the closing price
    ema_26 = macd_Dataframe['Close'].ewm(span=26, adjust=False, min_periods=26).mean() # Get the 26-day EMA of the closing price

    macd = ema_12 - ema_26 # Subtract the 26-day EMA from the 12-Day EMA to get the MACD
    macdSignal = macd.ewm(span=9, adjust=False, min_periods=9).mean() # Get the 9-Day EMA of the MACD for the Trigger line
    macd_h = macd - macdSignal # Calculate the difference between the MACD - Trigger for the Convergence/Divergence value

    # Add all of our new values for the MACD to the dataframe
    macd_Dataframe['macd'] = macd_Dataframe.index.map(macd)
    macd_Dataframe['macd_h'] = macd_Dataframe.index.map(macd_h)
    macd_Dataframe['macd_Signal'] = macd_Dataframe.index.map(macdSignal)
    # View our data
    pd.set_option("display.max_columns", None)

    moving_Figure = px.line(macd_Dataframe, x=macd_Dataframe.index.get_level_values('Date'), y=['macd','macd_Signal'], title='Share Prices over time')

    return {"stock_history": stockhistory_Figure, "RSI": rsi_Figure, "MACD": moving_Figure}

##Add a border around tabs, style works on tabs
##The stock history should show day, week, month year


@app.callback(Output(component_id='storeTable', component_property='data'),
              [Input(component_id='stocks', component_property='value')])
def grabnews(stock):
    """
    This callback takes the stock ticker,
    and stores the news data to be used in the tabs.
    """
    s = Stock.objects.get(stock_ticker=stock)
    if not s.sentiment.__contains__(str(datetime.date.today())):
        get_news(stock, datetime.date.today() - datetime.timedelta(days=7), datetime.date.today())

    news = json.loads(s.sentiment)
    date_ar = []
    title_ar = []
    article_ar = []

    for i in range(len(news)):
        title_ar.append(news[-i]['title'])
        date_ar.append(news[-i]['date'])
        link = news[-i]['link']
        article_ar.append(html.A(html.P("Full article"), href=news[-i]['link'], target='_blank'))

    d = {"Date": date_ar, "Title": title_ar, "Article": article_ar}
    dx = pd.DataFrame(d)
    data = dbc.Table.from_dataframe(dx)

    return d

@app.callback(Output(component_id='textarea-example2', component_property='value'),
              [Input(component_id='stocks', component_property='value')])
def txt_update(stock_ticker):
    # data = yf.Ticker(stock_ticker).info
    # stock = Stock.objects.get(stock_ticker=stock_ticker)
    today = datetime.date.today()
    daysprior = today - datetime.timedelta(days=10)
    data = yf.download(stock_ticker, start=daysprior.strftime("%Y-%m-%d"),
                       end=today.strftime("%Y-%m-%d"), group_by='tickers')

    return str(data)

def get_news(stock, start, end):
    ### EOD API Setup ###
    # 20 uses a day
    api_key = '624331972ba1f7.60805504'

    url = f'https://eodhistoricaldata.com/api/news?api_token={api_key}&s={stock}&limit={10}&from={start}&to={end}'
    news_json = requests.get(url).json()


    s = Stock.objects.filter(stock_ticker=stock)
    s.update(sentiment=json.dumps(news_json))
