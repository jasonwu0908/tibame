# 輸入一整數，寫兩個函數分別為to_binary(n)和to_hexadecimal(n)
# 用來將n轉換成二進制和十六進制的值。(勿使用任何現成的函數)
def to_binary(n):
    list1 = []
    while (n>=1):
        list1.append(n % 2)
        n //= 2
    list1.reverse()
    return list1

def to_hexadecimal(n):
    list2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
             'A', 'B', 'C', 'D', 'E', 'F']
    list1 = []
    while (n>0):
        hex = n % 16
        list1.append(list2[hex])
        n //= 16
    list1.reverse()
    return list1


def main():
    n = eval(input('give me a number:'))
    print(to_binary(n))
    print(to_hexadecimal(n))


main()


