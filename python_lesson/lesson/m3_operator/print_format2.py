a = 123
b = 12345.678
c = 'python'

print('/'+format(a,'d')+'/')
print('/'+format(a,'5d')+'/')
print('/'+format(a,'05d')+'/')
print('/'+format(a,'2d')+'/')
print('/'+format(a,'<5d')+'/')

print('/'+format(a,'x')+'/')
print('/'+format(a,'X')+'/')

print('/'+format(a,'#x')+'/')
print('/'+format(a,'#X')+'/')

print('/'+format(a,'o')+'/')
print('/'+format(a,'#o')+'/')
print('/'+format(a,'+d')+'/')

a = -123
print('/''%+d' % a + '/')

a = 12345.678

print('/'+format(a,',.2f')+'/')
print('/'+format(a,'f')+'/')
print('/'+format(a,'.2f')+'/')
print('/'+format(a,'.1f')+'/')
print('/'+format(a,'10.1f')+'/')
print('/'+format(a,'010.1f')+'/')
#
print('/'+format(a,'-010.1f')+'/')
print('/'+format(a,'e')+'/')
print('/'+format(a,'E')+'/')
print('/'+format(a,'.2E')+'/')
print('/'+format(a,'10.2E')+'/')



a = 'python'
print('/'+format(a,'s') + '/')
print('/'+format(a,'10s') + '/')
print('/'+format(a,'>10s') + '/')
# print('/''%r' % a + '/')
print('/'+format(a,'*^10s') + '/')


# print('%10s %10s %10s' % ('python','python','python'))
print(format('python','10s'),sep='',end='')
print(format('python','10s'),sep='',end='')
print(format('python','10s'))
print(3*(format('JAVA','10s')))

print('{0} {1} {2}' .format('Python', 'Python', 'Python'))










