#Manipulating file locations.
import os

#Used for generating synonyms.
from PIL import Image
import packages.VQGAN_CLIP.CLIP.clip as clip
import torch
from torchvision.datasets import CIFAR100

#Used in selected synonyms
from nltk.corpus import wordnet
import random

#Runs the program when called upon.
def call():

    #Assigns either the GPU or CPU for the machine learning algorithm to use.
    if torch.cuda.is_available():
        device = "cuda"
    else :
        device = "cpu"

    #Loads clip with the assigned device.
    model, preprocess = clip.load('ViT-B/32', device)

    #Gets the dataset of the model.
    cifar100 = CIFAR100(root=os.path.expanduser("~/.cache"), download=True, train=False)

    #Prepares in inputs for evaluation.
    parent = os.path.dirname(os.path.abspath(__file__))
    current = parent + r'\results\generated_image.png'
    image_input = preprocess(Image.open(r'{}'.format(current))).unsqueeze(0).to(device)
    text_inputs = torch.cat([clip.tokenize(f"a photo of a {c}") for c in cifar100.classes]).to(device)

    #Calculates the featires of both the image and text.
    with torch.no_grad():
        image_features = model.encode_image(image_input)
        text_features = model.encode_text(text_inputs)

    #This picks the first 5 words that most corrolate to the image created.
    image_features /= image_features.norm(dim=-1, keepdim=True)
    text_features /= text_features.norm(dim=-1, keepdim=True)
    similarity = (100.0 * image_features @ text_features.T).softmax(dim=-1)
    values, indices = similarity[0].topk(5)

    words = []

    #Adds each word from highest accuracy to lowest to the words array.
    print("Predictions:")
    for value, index in zip(values, indices):
        print(f"{cifar100.classes[index]:>16s}: {100 * value.item():.2f}%")
        word = f"{cifar100.classes[index]:>16s}"
        words.append(word)

    #Takes the first & second word from the predicted assessment
    word1 = words[0].strip()
    word2 = words[1].strip()

    synonyms1 = []
    synonyms2 = []

    #Adds each synonym of the first & second word to their corrosponding array.
    for syn in wordnet.synsets(word1):
        for i in syn.lemmas():
            synonyms1.append(i.name())

    for syn in wordnet.synsets(word2):
        for i in syn.lemmas():
            synonyms2.append(i.name())

    #Chooses a random synonym and formats the output correctly.
    first_word = random.choice(synonyms1).replace("_", " ")
    second_word = random.choice(synonyms2).replace("_", " ")

    #Adds the two words together to form the title.
    title = first_word + " " + second_word

    #Returns the arts title to the main program.
    return title