with open('lang.txt', 'r') as f:
    line1 = f.readline()
    while line1 != '':
        print(line1, end='')
        line1 = f.readline()

print('====================================')

with open('lang.txt', 'rt') as f:
    line1 = f.readline()
    while line1 != '':
        print(repr(line1[:-1]))
        line1 = f.readline()


print('====================================')

with open('lang.txt') as f:
    data = f.read()
    print(data)
    print(data.split('\n')[:-1])
    print(repr(data.replace('\n', ',')[:-1]))


print('====================================')

with open('lang.txt') as f:
    print(f.read(10))
    print(f.read(12))

print('====================================')


with open('lang.txt') as f:
    print(f.readlines(8))
    print(f.readlines(2))

print('====================================')


with open('lang.txt') as f:
    print(f.read())
    f.seek(20)
    print(f.read())



