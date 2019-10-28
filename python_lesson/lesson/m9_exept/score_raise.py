try:
    num = int(input('give a number:'))
    if num < 0 or num > 100:
        raise ValueError
    else:
        print('分數為 {}'.format(num))
except ValueError:
    print('請輸入介於0~100的數字:')