def square(x):
    return x * x


def total(a, b):
    return a + b


def factorial(number):
    ans = 1
    for i in range(1, number + 1):
        print(i)
        ans *= i
    return ans


def main():
    result = square(3)
    print(result)
    print(square(5))
    number = eval(input("give number:"))
    print(factorial(number))
    # print(total(a,b))


main()