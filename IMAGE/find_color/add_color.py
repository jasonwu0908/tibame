from clarifai.rest import Image as ClImage
from clarifai.rest import ClarifaiApp
import os
import pandas as pd
import time
import json


# def pic_list(dir_path):
#     fs = []
#     for f in os.listdir(dir_path):
#         if os.path.isfile(os.path.join(dir_path, f)):
#             if ".png" in f:
#                 fs.append(f)
#     # print(fs)
#     return fs

cn = 'E:/PyETL/test_shoe/NewBlance/Women/'
df = pd.read_csv('E:/PyETL/vgg16_test/' + 'NewBlance_women_less_category.csv', sep=',')

# dn = "E:/PyETL/adidas/woman/pics_done/"
# if not os.path.exists(dn):
#     os.makedirs(dn)

# app = ClarifaiApp(api_key='0f82436fcad44c1cb8953ee52d563ef1')
# app = ClarifaiApp(api_key='f7492c0aab0e4f2eaca9d7d68ac2c4ae')
# app = ClarifaiApp(api_key='23f1c0943044480595eaa8f119892192')
# app = ClarifaiApp(api_key='6468e92948b74cb9baab159eeb8a9f25')
# app = ClarifaiApp(api_key='8a9a940883274384a57d4aafbbb57b3f')
app = ClarifaiApp(api_key='2ff7f19d333346cf88f7d6c9b382952c')

# model = app.public_models.general_model

model = app.models.get('color')

######################################
# pid_index = list(df["商品型號"] + '.png')
pid_index = []
for i in range(df.shape[0]):
    pid_index.append(str(df["商品型號"][i]) + '.png')
###########################################

dn = cn + 'pics_done/'
# dn = 'E:/PyETL/adidas/woman/pictures/'
# print(picnames)
num = 1

major_color_list = []
major_id_list = []
major_pa_list = []
second_color_list = []
second_id_list = []
second_pa_list = []
other_color_list = []
other_id_list = []
other_pa_list = []

for pics in pid_index:
    image = ClImage(filename=dn + pics)
    print("num= ", num)
    print(pics)
    color_list = model.predict([image])["outputs"][0]["data"]["colors"]
    time.sleep(0.5)
    # print(color_list)
    # comp_list = []
    color_dic = {
        "color_id": [],
        "color_name": [],
        "color_pa": []
    }
    for color in color_list:
        color_id = color["raw_hex"]
        color_pa = round(color["value"], 3)
        color_name = color["w3c"]["name"]

        color_dic["color_id"].append(color_id)
        color_dic["color_name"].append(color_name)
        color_dic["color_pa"].append(color_pa)

        print("color_data= ",  color_name, color_id + "\t", str(color_pa * 100)[:5] + "%")

    for i in range(len(color_dic["color_pa"]) - 1):
        for j in range(len(color_dic["color_pa"])-i-1):
            if color_dic["color_pa"][j] < color_dic["color_pa"][j+1]:
                color_dic["color_pa"][j], color_dic["color_pa"][j+1] = color_dic["color_pa"][j+1], color_dic["color_pa"][j]
                color_dic["color_name"][j], color_dic["color_name"][j+1] = color_dic["color_name"][j+1], color_dic["color_name"][j]
                color_dic["color_id"][j], color_dic["color_id"][j+1] = color_dic["color_id"][j+1], color_dic["color_id"][j]
    # for k in range(len(color_dic["color_id"])):

    major_color_list.append(color_dic["color_name"][0])
    major_id_list.append(color_dic["color_id"][0])
    major_pa_list.append(color_dic["color_pa"][0])
    try:
        second_color_list.append(color_dic["color_name"][1])
        second_id_list.append(color_dic["color_id"][1])
        second_pa_list.append(color_dic["color_pa"][1])
    except:
        second_color_list.append(None)
        second_id_list.append(None)
        second_pa_list.append(None)

    try:
        other_color_list.append(color_dic["color_name"][2])
        other_id_list.append(color_dic["color_id"][2])
        other_pa_list.append(color_dic["color_pa"][2])
    except:
        other_color_list.append(None)
        other_id_list.append(None)
        other_pa_list.append(None)

    num += 1
    print(color_dic)


df.insert(2, "其他顏色占比", other_pa_list, True)
df.insert(2, "其他顏色編號", other_id_list, True)
df.insert(2, "其他顏色名稱", other_color_list, True)
df.insert(2, "次要顏色占比", second_pa_list, True)
df.insert(2, "次要顏色編號", second_id_list, True)
df.insert(2, "次要顏色名稱", second_color_list, True)
df.insert(2, "主要顏色占比", major_pa_list, True)
df.insert(2, "主要顏色編號", major_id_list, True)
df.insert(2, "主要顏色名稱", major_color_list, True)
df.to_csv('E:/PyETL/vgg16_test/' + 'NewBlance_women_less_category_color.csv', sep=',', encoding='utf-8-sig', index=False)