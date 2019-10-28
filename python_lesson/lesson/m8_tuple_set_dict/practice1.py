def greet(*names):
    for name in names:
        print("Hello!", name)


# greet("tom", "jason", "marry", "john")
tuple1 = ("tom", "jason", "marry", "john")
greet(*tuple1)


def stu(**data):
    for key, value in data.items():
        print("{} is {}".format(key, value))


dict1 = {'name': "Tom", 'email': "tom@gmail.com", 'age': '30', 'mobile': '090909090909'}
stu(**dict1)
