# 图片二值化
from PIL import Image
import os
import time

pic_list = os.listdir('E:/PyETL/vgg16_test/done/big_table/all_pics/')
for pic in pic_list:
    img = Image.open('E:/PyETL/vgg16_test/done/big_table/all_pics/' + str(pic))

    # 模式L”为灰色图像，它的每个像素用8个bit表示，0表示黑，255表示白，其他数字表示不同的灰度。
    Img = img.convert('L')
    # Img.show()
    # time.sleep(0.5)

    # 自定义灰度界限，大于这个值为黑色，小于这个值为白色
    threshold = 254

    table = []
    for i in range(256):
        if i < threshold:
            table.append(0)
        else:
            table.append(1)

    # 图片二值化
    photo = Img.point(table, '1')
    # photo.show()
    # time.sleep(0.5)
    photo.save('E:/PyETL/vgg16_test/done/big_table/bw/' + str(pic))
