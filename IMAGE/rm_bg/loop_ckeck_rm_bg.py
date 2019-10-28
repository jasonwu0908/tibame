from __future__ import print_function
import numpy as np
import cv2
import PIL.Image as Image
import os
import opencv_test2
# 技術參考:
# https://blog.gtwang.org/programming/opencv-basic-image-read-and-write-tutorial/
# https://blog.csdn.net/qq_40878431/article/details/82941982
# https://www.itread01.com/p/518340.html

# 以第一个像素为准，相同色改为透明


def transparent_back(img, rgb_num):
    img = img.convert('RGBA')
    L, H = img.size
    # print(img.getpixel((0, 0)))
    # print(img.getcolors(L*H)[0])

    for h in range(H):
        for l in range(L):
            dot = (l, h)
            color_1 = img.getpixel(dot)
            if color_1[0] and color_1[1] and color_1[2] >= rgb_num:
                color_1 = color_1[:-1] + (0,)
                # print(color_1)
                img.putpixel(dot, color_1)
    return img


def pic_list(dir_path):
    fs = []
    for f in os.listdir(dir_path):
        if os.path.isfile(os.path.join(dir_path, f)):
            if ".jpg" in f:
                fs.append(f)
    # print(fs)
    return fs


def check_corners(img):
    L, H = img.size
    for x in range(5):
        for y in range(5):
            if img.getpixel((x, y))[3] == 255:
                return True

    for x in range(L-5, L):
        for y in range(5):
            if img.getpixel((x, y))[3] == 255:
                return True

    for x in range(5):
        for y in range(H-5, H):
            if img.getpixel((x, y))[3] == 255:
                return True

    for x in range(L-5, L):
        for y in range(H-5, H):
            if img.getpixel((x, y))[3] == 255:
                return True
    return False

# def check_corners(img):
#     for x in range(2):
#         for y in range(359):
#             if img.getpixel((x, y))[3] == 255:
#                 return True
#
#     for x in range(359):
#         for y in range(2):
#             if img.getpixel((x, y))[3] == 255:
#                 return True
#
#     for x in range(357, 359):
#         for y in range(359):
#             if img.getpixel((x, y))[3] == 255:
#                 return True
#
#     for x in range(359):
#         for y in range(357, 359):
#             if img.getpixel((x, y))[3] == 255:
#                 return True
#     return False


if __name__ == '__main__':
    # pics = []
    # 讀取檔名最後為 1.jpg 之檔案
    # pics = pic_list('E:/TEAM/rm_bg/rm_bg_pic/feature/')
    test_fp = 'E:/PyETL/test_shoe/NewBlance/Men/pictures/'
    fp_done = 'E:/PyETL/test_shoe/NewBlance/Men/pics_done/'
    # pics = pic_list('E:/TEAM/rm_bg/')
    pics = pic_list(test_fp)

    page = 1
    for pic in pics:
        print("第" + str(page) + "張")

        fn_done = str(pic)[:-4] + '.png'

        # 讀取檔案路徑
        # # fn_path = 'E:/TEAM/rm_bg/rm_bg_pic/feature/' + pic

        # fn_path = 'E:/TEAM/rm_bg/' + pic
        fn_path = test_fp + pic

        # 開啟圖檔
        print(fn_path)
        img = Image.open(fn_path)
        # img = img.resize((360, 360), Image.ANTIALIAS)
        # 背景處理
        num = 255
        # print(img.getpixel((0, 0)))
        img = transparent_back(img, rgb_num=num)
        # print(img.getpixel((0, 0))[3])

        # 檢查邊框是否為透明，若無則繼續
        while check_corners(img):
            img = transparent_back(img, rgb_num=num)
            num -= 1

        # print(img.getpixel((50, 50)))
        # img.show(img)
        # 將圖檔存到別的地方，順便轉png黨
        img.save(fp_done + fn_done)
        print('方法一: ' + str(pic)[:-4] + '.png: ', '存檔')
        page += 1

        print('透明度: ', img.getpixel((0, 0))[3])