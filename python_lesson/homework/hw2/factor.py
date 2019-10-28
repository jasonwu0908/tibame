# 輸入一正整數，求其所有的因數。
# 說明：36的因數為1, 2, 3, 4, 6, 9, 12, 18, 36。
number = eval(input("輸入一正整數，求其所有的因數:"))

if (number < 1 ):
    print("error")
else:
    print(number,"的因數為:",end=' ')
    for i in range(1, number + 1):
        if (number % i == 0):
            print(i,end=' ')
    print("finish")