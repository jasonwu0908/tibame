# x = 10
# y = 11
#
#
# def main():
#     x = 20
#     print(x)
#     print(y)
#
#
# main()
# print(x)
# print(y)

x = 10


def outer():
    x = 20

    def inner():
        x = 30
        print(x)
    inner()
    print(x)


outer()
print(x)
