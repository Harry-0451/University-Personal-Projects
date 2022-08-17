#Manipulating file locations.
import os

#Handles images.
import tensorflow as tf
import tensorflow_hub as tf_hub
import sys
#Self made functions.
from assist import * 

#Loads locations of needed files into assigned variables.
parent = os.path.dirname(os.path.abspath(__file__))
original_image = load_image(parent + r"\results\generated_image.png")
style_image = load_image(sys.argv[1])
stylise_model = tf_hub.load(r'packages\tf_model')

#Applies the model to style the generated image.
style_image = tf.nn.avg_pool(style_image, ksize=[3,3], strides=[1,1], padding='VALID')
results = stylise_model(tf.constant(original_image), 
tf.constant(style_image))
stylized_photo = results[0]

#Exports the image and saves it to a file to be accessed by the main program.
export_image(stylized_photo).save(r"results\final_image.png")