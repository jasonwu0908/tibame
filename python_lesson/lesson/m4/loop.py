n = 1
total = 0
while n <= 10:
    total += n
    n += 1
print(total)


total = 0
for n in range(1,11):
    total += n
print(total)


for i in range(1,10):
    for j in range(1, 10):
        print(i,"*",j,"=",i*j,end='\t')
    print()