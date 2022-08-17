#Modules for UI.
import tkinter as tk  
from tkinter import * 
from PIL import ImageTk 
from PIL import * 

#Manipulating file locations.
import os

#Self made functions.
from assist import * 
import title_generator 

#Runs whenever the generate button is clicked.
def program_update():

    #The user's prompt for what the program should generate.
    user_input = input_box.get("1.0",END)

    #Generating an image with users input.
    generateImage(user_input)

    #Selects the location of the generated image to be used by the program.
    global generated_file, generated_image
    generated_file = r"results\generated_image.png" #input file  
    display_generated_img = Image.open(generated_file).resize((256,256), Image.ANTIALIAS)
    generated_image = ImageTk.PhotoImage(display_generated_img)
    generated_canvas.config(image=generated_image)

    #Selects the location of the style's image to be used by the program.
    global style_selection, style_image
    selected_style = style_dropdown_menu_variable.get()
    style_selection = styleSelectedImage(selected_style)

    global finished_img_loc, final_image
    if style_selection == no_style:

        #Assigns the newly updated empty image for the user to see.
        display_style_img = Image.open(style_selection).resize((256,256), Image.ANTIALIAS)
        style_image = ImageTk.PhotoImage(display_style_img)     
        style_canvas.config(image=style_image)

        #Assigns the newly updated finished image for the user to see.
        display_final_img = Image.open(generated_file).resize((256,256), Image.ANTIALIAS)
        final_image = ImageTk.PhotoImage(display_final_img)     
        final_canvas.config(image=generated_image)
    else:

        #Assigns the newly updated style image for the user to see.
        display_style_img = Image.open(style_selection).resize((256,256), Image.ANTIALIAS)
        style_image = ImageTk.PhotoImage(display_style_img)     
        style_canvas.config(image=style_image)

        #Applies the style to the image.
        style(style_selection)

        #Assigns the newly updated finished image for the user to see.
        finished_img_loc = r'results\final_image.png'
        display_final_img = Image.open(finished_img_loc).resize((256,256), Image.ANTIALIAS)
        final_image = ImageTk.PhotoImage(display_final_img)     
        final_canvas.config(image=final_image)

    #Changes the styled image label to include the title of the generated artwork.
    final_lbl['text'] = "Styled Image: " + title_generator.call()

#Empty/nonexistant style.
source = os.path.dirname(os.path.abspath(__file__))
no_style = source + r'\Style_Images\None.jpg'

#Creates application's window.
app_window = tk.Tk()
app_window.geometry("785x335")
content = tk.Frame(app_window)
frame = tk.Frame(content, borderwidth=5, relief="ridge")

#Settings for columns & rows for placing labels & canvases.
app_window.rowconfigure(0, minsize=1, weight=0)
app_window.columnconfigure([1, 1, 1], minsize=0)

#Text box prompt for generating user's desired input.
prompt_lbl = tk.Label(master=app_window, text="Please enter scene:")
prompt_lbl.grid(row=0, column=0)
input_box = tk.Text(app_window, height = 1, width = 60)
input_box.grid(row=0, column=1, columnspan=2)

#Drop down menu for user to select the style they want to be applied to the generated image.
select_lbl = tk.Label(master=app_window, text="Please select a style")
select_lbl.grid(row=1, column=0)
style_dropdown_menu_variable = StringVar(app_window)
style_dropdown_menu_variable.set("None") # default value
style_dropdown_menu = OptionMenu(app_window, style_dropdown_menu_variable,"None", "Post-Impressionism","Abstract", "Classicism", "Cubism","Pop",)
style_dropdown_menu.grid(row=1, column=1)

#Kicks off the generation & updating of images.
run_program = tk.Button(master=app_window, text="Create image.",command=lambda: program_update())
run_program.grid(row=1, column=2)

#Creates a label and canvas for the user to see the generated image produced by the generate function.
display_generated_img = (Image.open(no_style).resize((256,256), Image.ANTIALIAS))
generated_image = ImageTk.PhotoImage(display_generated_img)
generated_canvas = Label(app_window, image=generated_image, bg="white")
generated_canvas.grid(row=2, column=0)
generated_lbl = tk.Label(master=app_window, text="Created Image")
generated_lbl.grid(row=3, column=0)

#Creates a label and canvas for the user to see the style image.
display_style_img = (Image.open(no_style)).resize((256,256), Image.ANTIALIAS)
style_image = ImageTk.PhotoImage(display_style_img)
style_canvas = Label(app_window, image=style_image, bg="white")
style_canvas.grid(row=2, column=1)
style_lbl = tk.Label(master=app_window, text="Style Source")
style_lbl.grid(row=3, column=1)

#Creates a label and canvas for the user to see the final image produced by the style function.
display_final_img = (Image.open(no_style)).resize((256,256), Image.ANTIALIAS)
final_image = ImageTk.PhotoImage(display_final_img)
final_canvas = Label(app_window, image=final_image, bg="white")
final_canvas.grid(row=2, column=2)
final_lbl = tk.Label(master=app_window, text="Styled Image: ")
final_lbl.grid(row=3, column=2)

#Listens for button clicks.
app_window.mainloop()