from hw6.stack import Stack

aaa = Stack()
print(aaa)
for i in range(10):
    aaa.push(i)
    print(aaa)
aaa.push(10)
print(aaa)


for i in range(11):
    aaa.pop()
    print(aaa)
aaa.pop()
