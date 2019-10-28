def msg(name, age):
    print("{0} is {1} years old !" .format(name, age))


msg('tom', 30)
msg(name='tom', age=30)
msg(age=30, name='tom')
msg('tom', age=30)
# msg(name='tom, 30')    error

