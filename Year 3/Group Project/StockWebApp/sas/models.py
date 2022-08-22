# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models



class Stock(models.Model):
    stock_name = models.CharField(max_length=200)
    stock_ticker = models.CharField(max_length=10)
    stock_desc = models.CharField(max_length=1000)
    pred = models.CharField(max_length=10)
    sentiment = models.CharField(max_length=2000)


class Prediction(models.Model):
    stock_ticker = models.CharField(max_length=10)
    date = models.CharField(max_length=100)
    close = models.FloatField()

    def __str__(self):
        return self.stock_ticker
