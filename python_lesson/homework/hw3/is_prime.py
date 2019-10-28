# 寫一函數is_prime(n)用來判斷n是否為質數。
def is_prime(n):
    for i in range(2, n):
        if (n % i == 0):
            return '不是質數'
    return '是質數'


def main():
    n = eval(input("give me a number:"))
    print(n, is_prime(n))


main()