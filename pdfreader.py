from PIL import Image
import os
from pytesseract import image_to_string
from pdf2image import convert_from_path 

popplerpath='.\\poppler-0.67.0\\bin'
os.environ["PATH"] += os.pathsep + popplerpath
# print(os.environ)

pages = convert_from_path('1.pdf',500)

c=0 #counter
for page in pages:
	if c==1:
		page.save('pdfimg.jpg', 'JPEG')
	c+=1

text=image_to_string(Image.open('pdfimg.jpg'))
with open('outputText.txt','w') as fp:
	fp.write(text)
print (text)