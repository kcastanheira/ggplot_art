from PIL import Image
import pandas as pd
import sys

if(len(sys.argv)<2):
	print("Error: please enter filepath")
	sys.exit()
try:
	filename = sys.argv[1]
	print("./images/"+filename)
	im = Image.open("./images/"+filename, 'r')
	width, height = im.size
except:
	print("Invalid image file")
	sys.exit()

pix_val = list(im.getdata())
df = pd.DataFrame.from_records(pix_val, columns=["R", "G", "B"])
size = pd.DataFrame.from_records([[width, height]], columns=["width", "height"])
try:
	df.to_csv("./imagedata/"+filename[:-3]+"csv", mode='a', index=False, na_rep="NA", header=True)
	size.to_csv("./imagedata/size_"+filename[:-3]+"csv", mode='a', index=False, na_rep="NA", header=True)
except:
	print("error saving data")
	sys.exit()
