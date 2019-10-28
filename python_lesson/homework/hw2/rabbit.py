# 老王養了一群兔子，若三隻三隻一數，剩餘一隻；
# 若五隻五隻一數，剩餘三隻；若七隻七隻一數，剩餘二隻。試問兔子最少有幾隻。
rabbit = 0
while True:
    if (rabbit % 3 == 1 and rabbit % 5 == 3  and rabbit % 7 == 2):
        print("rabbit = ", rabbit)
        break
    rabbit += 1
