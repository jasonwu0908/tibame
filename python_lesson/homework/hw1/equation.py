# 一元二次方程式ax2+bx+c=0。輸入a, b, c三值，並計算方程式的根。
# b2-4ac > 0，有兩個不相等的實根。
# b2-4ac = 0，有兩個相等的實根。
# b2-4ac < 0，則印出”沒有實根”。
import math
a,b,c = eval(input("輸入a, b, c三值，並計算方程式的根:"))

judge = math.pow(b,2) - 4 * a * c
print("judge = ", judge)
if judge > 0:
    ans1 = (-b + math.sqrt( math.pow(b,2) - 4 * a * c)) / 2 * a
    ans2 = (-b - math.sqrt( math.pow(b, 2) - 4 * a * c)) / 2 * a
    print("ans1 = ", ans1, "ans2 = ", ans2)
elif judge == 0:
    ans = -b / 2 * a
    print("ans = ", ans)
else:
    print("沒有實根")
