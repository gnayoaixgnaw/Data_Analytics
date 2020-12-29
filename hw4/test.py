from PIL import Image
import numpy
from collections import Counter

img1 = Image.open('Chickens clean.png')
print(img1.size)
img2 = Image.open('Bug Final.png')
print(img2.size)
temp = img1.copy()
temp.paste(img2,(1000,1500))
temp.save('test3.png')