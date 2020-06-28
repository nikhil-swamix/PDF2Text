from PIL import Image
import os
from pytesseract import image_to_string
from pdf2image import convert_from_path 

def newest(path):
    files = os.listdir(path)
    paths = [os.path.join(path, basename) for basename in files]
    return max(paths, key=os.path.getctime)

latest=newest('C:\\Users\\dell\\Downloads')

popplerpath='.\\poppler-0.67.0\\bin'
os.environ["PATH"] += os.pathsep + popplerpath
# print(os.environ)

text=image_to_string(Image.open(latest))
# with open('chapter10.sql','a') as fp:
# 	fp.write(text)
print (text)