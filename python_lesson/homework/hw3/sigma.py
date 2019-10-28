# 寫一函數my_fun(x, n)


def my_fun(x, n):
    Denominator = 1
    total = 0
    for i in range(1, n+1):
        Denominator *= i
        total += pow(x, i) / Denominator
    return total


def main():
    x, n = eval(input("give x & n:"))
    print(my_fun(x, n))


main()



