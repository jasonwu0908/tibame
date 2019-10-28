# 寫一函數is_mersenne_prime(n)用來判斷n是否為Mersenne質數。
# 撰寫一程式找出前5個Mersenne質數。
# 提示：若質數滿足2P-1=n (p為正整數)，則n為Mersenne Prime。
def check_Mersenne(n):
    i = 2
    while ((pow(2, i) - 1) < n):
        i += 1
    Mersenne = (pow(2, i) - 1)
    if (n != Mersenne):
        return False
    elif is_prime(n):
        return True


def is_prime(n):
    for i in range(2, n):
        if (n % i == 0):
            return False
    return True


def is_mersenne_prime(i):
    n = 5
    while (n > 0):
        if i < 0:
            print('end')
            break
        if check_Mersenne(i):
            n -= 1
            i -= 1
            print("Mersenne = ", i+1)
        else:
            i -= 1


def main():
    n = eval(input("give a number:"))
    if check_Mersenne(n):
        print(n, "is Mersenne")
    else:
        print(n, "is not Mersenne")
    print("======================================")
    is_mersenne_prime(n)


main()




