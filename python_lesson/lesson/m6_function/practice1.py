def greet(*names):
    for name in names:
        print("Hello!", name)


names = ("tom", "jason", "marry", "john")
greet(*names)
# greet("tom", "jason", "marry", "john")


# def stu(**data):
#     for key, value in data.items():
#         print("{} is {}".format(key, value))
#
#
# data = {'name': "Tom", 'email': "tom@gmail.com", 'age': 30, 'mobile': '090909090909'}
# print(type(data))
# stu(name="Tom", email="tom@gmail.com", age=30, mobile='090909090909')

