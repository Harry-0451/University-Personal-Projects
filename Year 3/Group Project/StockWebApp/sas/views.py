# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import pandas as pd
from django.shortcuts import render
from django.http import HttpResponse
import yfinance as yf
from django.views.decorators.cache import cache_page
import sys
import os
current = os.path.dirname(os.path.realpath(__file__))
parent = os.path.dirname(current)
parents = os.path.dirname(parent)
sys.path.append(parents)
from MLsrc import _main
from .models import Stock
from .models import Prediction
predict = pd.DataFrame

# The home page
def home(request):
    stock = Stock.objects.order_by('stock_ticker')
    # returns the list of the different stocks which can be used for each of the stock buttons
    context = {
        'stock_list': stock
    }
    return render(request, 'sas/home.html', context)


# The different stock views (i.e Apple, Tesla)
# @cache_page(60*15)
def details(request, stock_ticker):

    try:
        stock = Stock.objects.get(stock_ticker=stock_ticker)
        y = yf.Ticker(stock_ticker).history("1d")
        context = {'stock_ticker': stock.stock_ticker, 'stock_name': stock.stock_name, 'stock_desc': stock.stock_desc,
                   'stock_img': 'sas/images/' + stock.stock_name + 'Logo.png'}
        # info from y finance to make a table to be used in the template
        table = {'open': ("%.3f" % (y['Open'][0])), 'high': ("%.3f" % (y['High'][0])), 'low': ("%.3f" % (y['Low'][0])), 'close': ("%.3f" % (y['Close'][0]))}

    except Stock.DoesNotExist:
        pass
        stock = Stock.objects.get(stock_ticker=stock_ticker)
    if stock.stock_desc == ".":
        try:
            s = Stock.objects.filter(stock_ticker=stock_ticker)
            summary = yf.Ticker(stock_ticker).info.get('longBusinessSummary')

            s.update(stock_desc='.'.join(summary.split('.')[:3]) + '.')

            # page.categories.get('business')page.summary
            # yf.Ticker(stock_ticker).info.get('longBusinessSummary')
        except Stock.DoesNotExist:
            pass
    # load_recommendation(stock_ticker)
    return render(request, 'sas/stock.html', {'data': context,
                                              'dash_context': {'stocks': {'value': stock.stock_ticker}},
                                              'data_table': table})

# The recommendation page
def recommendation(request, stock_ticker):
    try:
        stock = Stock.objects.get(stock_ticker=stock_ticker)
        context = {'stock_ticker': stock.stock_ticker, 'stock_name': stock.stock_name, 'stock_desc': stock.stock_desc}
        prediction = stock.pred

    except Stock.DoesNotExist:
        pass
    return render(request, 'sas/recommendation.html', {"d": context,
                                                       'dash_context': {'stocks': {'value': prediction}},
                                                       'prediction': prediction})


def load_recommendation(request, stock_ticker):
    Prediction.objects.all().delete()
    prediction = _main.run(stock_ticker, "predict")
    s = Stock.objects.filter(stock_ticker=stock_ticker)
    s.update(pred=prediction[0])
    predicts = prediction[1]
    for pre in predicts.itertuples():
        pre = Prediction.objects.create(stock_ticker=stock_ticker, date=pre.Date, close=pre.Close)
        pre.save()

    return HttpResponse()
