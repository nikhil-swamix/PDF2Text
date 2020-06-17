# PDF2Text

# Setup:

  if on linux:
  
    sudo apt install tesseract-ocr 
    
    sudo apt-get install tesseract-ocr
    
  IF on windows install this
  
    https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-v5.0.0-alpha.20200328.exe
    
    ans now add this to path "C:\Program Files\Tesseract-OCR" without this nothing will work!
    
    
  Now you need these Below commands to access these libraries, first pip install these:
  paste these in terminal:
  
    pip3 install PIL
    
    pip3 install pytesseract
    
    pip3 install pdf2image
  
  when all setup now just run the pdfreader.py
  
    what you will see is the text in the pdf printed in console/output
    that is done by -> image_to_string(Image.open('pdfimg.jpg') command



