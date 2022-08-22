import dash_bootstrap_components as dbc
import pandas as pd
from dash import html, dcc
import plotly.express as px
from dash.dependencies import Input, Output
import yfinance as yf
import datetime
from .models import Prediction


from django_plotly_dash import DjangoDash


app = DjangoDash(name='RecomGraphs',external_stylesheets=[dbc.themes.BOOTSTRAP])
df = px.data.stocks()

app.css.append_css({'external_url': '/static/sas/dashcss.css'})
app.layout = html.Div(id='parent', children=[

    dcc.Input(id='stocks', type='hidden', value=[]),
    dcc.Graph(id='prediction', style={"width": "100%", "height": "20%"}),
    dcc.Textarea(id='text', style={"width": "100%", "height": 100, 'border': 'none'})
])


@app.callback(Output(component_id='prediction', component_property='figure'),
              Output(component_id='text', component_property='value'),
              [Input(component_id='stocks', component_property='value')])
def graph(pred):
    """
        This callback takes the prediciton,
        and returns the predictions graph and the text seen beneath it.
    """
    end_date = datetime.date.today()
    start_date = end_date - datetime.timedelta(days=28)
    da = pd.DataFrame(list(Prediction.objects.all().values()))
    # future = da['date'][15] + da['close'][15]

    if pred == 'Buy!':
        d = 'The recommendation for this stock is Buy. The algorithm has established that the stock has been mostly oversold based on the technical analysis. Therefore, the price is extremely likely to increase and regulate. The sentiment analysis points towards a positive polarity score in the recent month of headlines, which also indicates a price increase.'
    elif pred == 'Sell!':
        d = 'The recommendation for this stock is Sell. This is because our algorithm has established through the technical analysis that in the recent events this stock has been overbought. Therefore, the price is extremely likely to drop and regulate. The headlines in the sentiment analysis tells the algorithm that the news related to this stock in the past month have been leaning towards negative polarity scores, which indicates a price drop due to non-positive sentiment.'
    # data = yf.Ticker(stock).history(start=start_date.strftime("%Y-%m-%d"), end=end_date.strftime("%Y-%m-%d"))
    # data = data[:17]
    # da['future'] = da.index.map(future)
    p = da['close'][16]
    b = da['close'][:15]
    fig = px.line(da, x=da['date'], y=[da['close'].where(da.index<=15), da['close'].where(da.index>14)], title='Stock Prediction overview')
    newnames = {'wide_variable_0':'close', 'wide_variable_1': 'future close'}
    fig.for_each_trace(lambda t: t.update(name = newnames[t.name],
                                      legendgroup = newnames[t.name],
                                      hovertemplate = t.hovertemplate.replace(t.name, newnames[t.name])
                                      )
                   )
    annotation = [{"xref":"paper", "x":1, "y":da['close'][16],
          "xanchor":"right", "yanchor":"middle",
          "text":"Future Close:\n$"+("%.2f" % da['close'][16]),
          "font":dict(family='Arial', size=9, color="blue"),
          "showarrow":False}]
    fig.update_layout(title="Stock Prediction overview", xaxis_title='Dates', yaxis_title='Prices', annotations=annotation)


    return fig, d
