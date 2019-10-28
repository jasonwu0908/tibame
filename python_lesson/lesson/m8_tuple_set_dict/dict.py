dict1 = {}
dict1 = {'name': 'Jason', 'age': 24, 'mobile': '0926217803'}
print(dict1)
print(dict1['name'])
print(dict1.get('age'))

print("=======================")

for key in dict1:
    print('{}: {}' .format(key, dict1[key]))

print("=======================")

for key, value in dict1.items():
    print('{}: {}' .format(key, value))

print("=======================")


dict1['email'] = 'jw840908@gmail.com'
print(dict1)
del dict1['email']
print(dict1)
print(dict1.pop('age'))
print(dict1)
print(dict1.popitem())
print(dict1)
dict1.clear()
print(dict1)

