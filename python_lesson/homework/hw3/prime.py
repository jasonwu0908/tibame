# 寫一函數get_prime (n)用來找出第n個質數。

def is_prime(n):
    for i in range(2, n):
        if (n % i == 0):
            return 0
    return 1

def get_prime(n):
    i = 2
    while (n > 0):
        if (is_prime(i)):
            n -= 1
            print(i)
        i += 1


def main():
    n = eval(input('give me position:'))
    get_prime(n)


main()

