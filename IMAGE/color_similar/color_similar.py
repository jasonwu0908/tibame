import numpy

Max = 441.6729559300637

# 白色
hex_color1 ='#ffffff'
# 轉10進制
rgb_color1 = tuple(int(hex_color1[i:i+2], 16) for i in (1, 3, 5))

# 黑色
hex_color2 ='#000000'
# 轉10進制
rgb_color2 = tuple(int(hex_color2[i:i+2], 16) for i in (1, 3, 5))


vec1=rgb_color1
vec2=rgb_color2
vec1=numpy.array(vec1)
vec2=numpy.array(vec2)
print(vec1)
print(vec2)

# 算歐式距離
dist = numpy.sqrt(numpy.sum(numpy.square(vec1 - vec2)))
# 轉成百分比
c_per = str(dist/Max * 100)+'%'
print(dist)
print(c_per)
# numpy.linalg.norm(vec1-vec2)



