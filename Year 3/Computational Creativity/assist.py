#Manipulating file locations.
import os

#Handles images.
import numpy as np
import tensorflow as tenflo
import PIL

#Runs generation program with inputted prompt.
def generateImage(prompt):
    parent = os.path.dirname(os.path.abspath(__file__))
    current = parent + r'\packages\VQGAN_CLIP\generate.py -p "{}"'.format(prompt)
    os.system(current)

#Finds the style's file selected by the user.
def styleSelectedImage(style):
    parent = os.path.dirname(os.path.abspath(__file__))
    current = parent + r'\Style_Images'

    if style == "None":#
        current = current + r"\None.jpg"
        return current
    elif style == "Post-Impressionism":#
        current = current + r"\Post-Impressionism.jpg"
        return current
    elif style == "Abstract":#
        current = current + r"\Abstract.jpg"
        return current
    elif style == "Classicism":#
        current = current + r"\Classicism.jpg"
        return current
    elif style == "Cubism":#
        current = current + r"\Cubism.jpg"
        return current
    elif style == "Pop":
        current = current + r"\Pop.jpg"
        return current

#Runs stylising program that uses the selected style and generated image.
def style(style):
    parent = os.path.dirname(os.path.abspath(__file__))
    current = parent + r'\style.py "{}"'.format(style)
    os.system(current)

#Takes an image splits into 3 layers for style to be applied.
def load_image(image_path):
    split_image = tenflo.io.decode_image(tenflo.io.read_file(image_path),channels=3, dtype=tenflo.float32)[tenflo.newaxis, ...]
    scaled_image = tenflo.image.resize(split_image, (256, 256), preserve_aspect_ratio=True)
    return scaled_image

#Takes an image and makes it the correct size to then be saved.
def export_image(image):
    scaled_image = np.array((image*255), dtype=np.uint8)
    if np.ndim(scaled_image)>3:
        assert scaled_image.shape[0] == 1
        new_img = scaled_image[0]
    return PIL.Image.fromarray(new_img)