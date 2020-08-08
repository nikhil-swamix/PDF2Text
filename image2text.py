from PIL import Image
from PIL import ImageGrab
import os
from pytesseract import image_to_string
from pdf2image import convert_from_path 

def newest(path):
    files = os.listdir(path)
    paths = [os.path.join(path, basename) for basename in files]
    return max(paths, key=os.path.getctime)

latest=newest('C:\\Users\\dell\\Downloads')

im = ImageGrab.grab(bbox=(500, 500, 600, 700))

# text=image_to_string(Image.open(latest))
# print (text)