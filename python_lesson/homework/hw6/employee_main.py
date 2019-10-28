from hw6.employee import Staff, Secondary, Primary


def main():
    jason = Staff('JASON', '男', '2019-09-08', '0926217803', '123456798', 32000)
    print(jason)
    jason1 = Staff('JASON1', '男', '2019-09-08', '0926217803', '123456798', 32000, 10)
    print(jason1)
    fan = Secondary('FAN', '女', '2013-02-07', '0926262626', '987654321', 50000)
    print(fan)
    fan1 = Secondary('FAN1', '女', '2013-02-07', '0926262626', '987654321', 50000, 10)
    print(fan1)
    wendy = Primary('WENDY', '女', '2011-02-09', '0937934778', 'A45621684', 90000)
    print(wendy)
    wendy1 = Primary('WENDY1', '女', '2011-02-09', '0937934778', 'A45621684', 90000, 5)
    print(wendy1)


main()