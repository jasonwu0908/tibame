# num = int(input('give a number:'))
# print('{} is {}' .format(num, 'odd' if num % 2 else 'even'))


try:
    num = int(input('give a number:'))
    print('{} is {}'.format(num, 'odd' if num % 2 else 'even'))
except ValueError as e:
    print(e)


# try:
#     num = int(input('give a number:'))
#     print('{} is {}'.format(num, 'odd' if num % 2 else 'even'))
# except ValueError as e:
#     print('請輸入數字')