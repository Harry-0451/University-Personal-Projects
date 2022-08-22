# Authors: @sp773, @vc244, @hwh2, @asp34
# ----------------------------------------------------------------------------
# Imports
from tensorflow import keras
from tensorflow.keras.layers import Dense, LSTM, Dropout, BatchNormalization
from keras.models import Sequential
from keras.layers import LSTM, Dropout
from keras.layers import Dense
import os

current = os.path.dirname(os.path.realpath(__file__))
parent = os.path.dirname(current)

mse = keras.losses.MeanSquaredError()

modelsave = parent+'/Models/SavedModels/'

def model_loader(stock, x, y):
    # Load model based on stock passed
    if stock == 'AAPL':
        history = apple_model(x, y)

    elif stock == 'MCD':
        history = mcd_model(x, y)

    elif stock == 'MSFT':
        history = microsoft_model(x, y)

    elif stock == 'TGT':
        history = target_model(x, y)

    elif stock == 'AMZN':
        history = amazon_model(x, y)

    elif stock == 'CSCO':
        history = cisco_model(x, y)

    elif stock == 'GOOGL':
        history = google_model(x, y)

    elif stock == 'NFLX':
        history = netflix_model(x, y)

    elif stock == 'TSLA':
        history = tesla_model(x, y)

    elif stock == 'PFE':
        history = pfizer_model(x, y)

    elif stock == 'PM':
        history = pm_model(x, y)

    elif stock == 'DIS':
        history = dis_model(x, y)

    elif stock == 'NSRGY':
        history = nsrgy_model(x, y)

    return history


def mcd_model(x, y):
    # Neural Network for McDonald's
    model = Sequential()
    model.add(LSTM(units=150, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.7))
    model.add(LSTM(units=130, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=140, batch_size=64, validation_split=0.09, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'MCD')
    return history

def microsoft_model(x, y):
    # Neural Network for Microsoft
    model = Sequential()
    model.add(LSTM(units=20, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(LSTM(units=20,  return_sequences=True))
    model.add(LSTM(units=15, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=32, validation_split=0.2, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'MSFT')
    return history

def target_model(x, y):
    # Neural Network for Target
    model = Sequential()
    model.add(LSTM(units=10, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(LSTM(units=10, return_sequences=True))
    model.add(LSTM(units=7, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=16, validation_split=0.25, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'TGT')
    return history

def apple_model(x, y):
    # Neural Network for Apple
    model = Sequential()
    model.add(LSTM(units=150, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.8))
    model.add(LSTM(units=150, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=150, batch_size=8, validation_split=0.1, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'AAPL')
    return history


def amazon_model(x, y):
    # Neural Network for Amazon
    model = Sequential()
    model.add(LSTM(units=100, activation='relu', input_shape=(X.shape[1], X.shape[2]), return_sequences=True))
    model.add(Dropout(0.4))
    model.add(LSTM(units=80, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=250, batch_size=64, validation_split=0.13, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'AMZN')
    return history

def cisco_model(x, y):
    # Neural Network for Cisco
    model = Sequential()
    model.add(LSTM(units=100, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.5))
    model.add(LSTM(units=100, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=200, batch_size=16, validation_split=0.15, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'CSCO')
    return history

def google_model(x, y):
    # Neural Network for Google
    model = Sequential()
    model.add(LSTM(units=100, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.5))
    model.add(LSTM(units=60, activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=32, validation_split=0.1, shuffle=False)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'GOOGL')
    return history

def netflix_model(x, y):
    # Neural Network for Netflix
    model = Sequential()
    model.add(LSTM(units=45, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(LSTM(units=20, return_sequences=True))
    model.add(LSTM(units=15, return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=32, validation_split=0.1, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'NFLX')
    return history

def tesla_model(x, y):
    # Neural Network for Tesla
    model = Sequential()
    model.add(LSTM(units=150, activation='tanh', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.8))
    model.add(LSTM(units=120, return_sequences=True))
    model.add(Dropout(0.9))
    model.add(LSTM(units=120, return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=64, validation_split=0.14, verbose=1, shuffle=False)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'TSLA')
    return history

def pfizer_model(x, y):
    # Neural Network for Pfizer
    model = Sequential()
    model.add(LSTM(units=250, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.6))
    model.add(LSTM(units=200,  activation='sigmoid', return_sequences=False))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=32, validation_split=0.1, verbose=1, shuffle='False')
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(filepath=modelsave+'PFE', overwrite=True, save_traces=False, signatures=None)
    return history

def pm_model(x, y):
    # Neural Network for Philip Morris
    model = Sequential()
    model.add(LSTM(units=65, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.3))
    model.add(LSTM(units=30, return_sequences=True))
    model.add(Dropout(0.3))
    model.add(LSTM(units=10, return_sequences=False))
    model.add(Dropout(0.1))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse') # try adam too as optimised
    print(model.summary())
    history = model.fit(x, y, epochs=200, batch_size=16, validation_split=0.13, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'PM')
    return history

def nsrgy_model(x, y):
    # Neural Network for Nestle
    model = Sequential()
    model.add(LSTM(units=80, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.5))
    model.add(LSTM(units=80, activation='sigmoid', return_sequences=False))
    model.add(Dropout(0.3))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adam', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=16, validation_split=0.13, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'NSRGY')
    return history

def dis_model(x, y):
    # Neural Network for Disney
    model = Sequential()
    model.add(LSTM(units=65, activation='relu', input_shape=(x.shape[1], x.shape[2]), return_sequences=True))
    model.add(Dropout(0.1))
    model.add(LSTM(units=30, return_sequences=True))
    model.add(Dropout(0.1))
    model.add(LSTM(units=20, return_sequences=False))
    model.add(Dropout(0.1))
    model.add(Dense(y.shape[1]))
    model.compile(optimizer='adamax', loss='mse')
    print(model.summary())
    history = model.fit(x, y, epochs=100, batch_size=32, validation_split=0.07, verbose=1)
    results = model.evaluate(x, y, verbose=1)
    print("test loss", results)
    model.save(modelsave+'DIS')
    return history



















