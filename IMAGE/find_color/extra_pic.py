from clarifai.rest import Image as ClImage
from clarifai.rest import ClarifaiApp
import os
import pandas as pd
import json

def pic_list(dir_path):
    fs = []
    for f in os.listdir(dir_path):
        if os.path.isfile(os.path.join(dir_path, f)):
            if ".jpg" in f:
                fs.append(f)
    # print(fs)
    return fs

fp = 'E:/PyETL/skechers/men/'

df = pd.read_csv(fp + 'skechers_data_men_test.csv', sep=',')
pid_index = list(df["商品型號"] + '.jpg')
pics = pic_list(fp + 'pictures/')
num = 1
# print(pid_index)
# print(pics)

for pic in pid_index:
    if pic not in pics:
        print(num)
        print(pic)
        num += 1

# for pic in pics:
#     if pic not in pid_index:
#         print(pic)
#         print(num)
#         num += 1
