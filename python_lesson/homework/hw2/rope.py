# 若有一條繩子長3000公尺，每天剪去一半的長度，需多少天繩子的長度會短於5公尺。
rope_lenth = 3000
day = 0
while (rope_lenth >= 5):
    rope_lenth /= 2
    day += 1
    # print(rope_lenth)
print("day = ",day)
