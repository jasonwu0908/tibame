# 輸入在某商店購物應付金額與實付金額。
# 實付金額小於應付金額，則印出”金額不足”。
# 實付金額等於應付金額，則印出”不必找錢”。
# 實付金額大於應付金額，則輸出找回金額最少的鈔票數和錢幣數。

cost, paid = eval(input("輸入在某商店購物應付金額與實付金額:"))
diff_money = paid - cost
thousand = 1000
five_hundred = 500
hundred = 100
fifty = 50
ten = 10
five = 5
one = 1


if paid < cost:
    print("金額不足",abs(paid - cost),'元')
elif paid == cost:
    print("不必找錢")
else:
    print( diff_money // thousand, '張一千    ', (diff_money % thousand) // five_hundred, '張五百    ', \
    (diff_money % five_hundred) // hundred, '張一百    ', (diff_money % hundred) // fifty, '個五十    ', \
    (diff_money % fifty) // ten, '個十    ', (diff_money % ten) // five, '個五  ',\
    (diff_money % five) // one, '個一  ',sep='')
