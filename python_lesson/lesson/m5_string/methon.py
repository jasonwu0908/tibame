# s1 = 'abc'
# s2 = '123'
# s3 = 'abc123'
#
# print(s1.isalnum())
# print(s2.isalnum())
# print(s3.isalnum())
#
# print(s1.isalpha())
# print(s2.isalpha())
# print(s3.isalpha())
#
# print(s1.isdecimal())
# print(s2.isdecimal())
# print(s3.isdecimal())
#
# print('\n'.isspace())
# print('\t'.isspace())
# print('     '.isspace())
# print(''.isspace())
#
# s = "Hello world, welcome to Python world."
# print(s.startswith("Hello"))
# print(s.startswith("hello"))
# print(s.startswith('H'))
#
#
# s1 = "on.py"
# print(s1.endswith(".py"))
#
# print(s.find("world"))
# print(s.rfind("world"))

s2 = "hello world, welcome to Python world.hello world, welcome to Python world."

index = s2.find("world")
print(s2.find("world", index + 1))

print(s2.count("world"))

s3 = "hello world, welcome to Python world."

print(s2.capitalize())
print(s3.lower())
print(s3.upper())
print(s3.title())

print((s2.replace("Python", "Java")).upper())

s4 = "    Python    "
print(s4.lstrip())
print(s4.rstrip())
print(s4.strip())

print(s4.center(20))
print(s4.ljust(20))
print(s4.rjust(20))


