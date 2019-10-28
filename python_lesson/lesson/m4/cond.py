x, y = eval(input("please enter 2 numbers:"))
a = x if x > y else y
print(a)

score = eval(input("please enter score:"))
status = 'pass!' if score >= 60 else'failed'
print(status)