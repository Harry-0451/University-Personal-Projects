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