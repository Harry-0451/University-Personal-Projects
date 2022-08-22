# Authors: @vc244
# ----------------------------------------------------------------------------
# Imports
import matplotlib.pyplot as plt

def plot_training(history):
    # Plot training and validation loss
    plt.plot(history.history['loss'], label='Training loss')
    plt.plot(history.history['val_loss'], label='Validation loss')
    plt.legend()
    plt.show()

