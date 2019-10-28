x = 10
y = x
z = x + 10
print(id(x), id(y), id(z))
a, b, c = 10, 20, 30
print(id(a), id(b), id(c))
y = 50
print(id(y))

import keyword
print(keyword.kwlist)