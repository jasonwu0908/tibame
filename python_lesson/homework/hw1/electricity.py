# 輸入何種用電和度數，計算出需繳之電費。
# 電力公司使用累計方式來計算電費，分工業用電及家庭用電。
#                    	   家庭用電        工業用電
#    240度(含)以下			0.15元			0.45元
#    240~540(含)度   		0.25元			0.45元
#    540度以上        	0.45元			0.45元

elect_home, elect_industry = eval(input("please enter 2 kind elect( home, industry ):"))

home_240 = 0.15
home_540 = 0.25
home_540up = 0.45

industry_240 = 0.45
industry_540 = 0.45
industry_540up = 0.45

elect_1_h = elect_home if elect_home <= 240 else 240
elect_3_h = (elect_home - 540) if elect_home > 540 else 0
if elect_home <= 240:
    elect_2_h = 0
elif elect_home >= 540:
    elect_2_h = 300
else:
    elect_2_h = elect_home - 240


elect_1_ind = elect_industry if elect_industry <= 240 else 240
elect_3_ind = (elect_industry - 540) if elect_industry > 540 else 0
if elect_industry <= 240:
    elect_2_ind = 0
elif elect_industry >= 540:
    elect_2_ind = 300
else:
    elect_2_ind = elect_industry - 240


elect_money1_h = elect_1_h * home_240
elect_money2_h = elect_2_h * home_540
elect_money3_h = elect_3_h * home_540up

elect_money1_ind = elect_1_ind * industry_240
elect_money2_ind = elect_2_ind * industry_540
elect_money3_ind = elect_3_ind * industry_540up


print('elect_1_h =' ,elect_1_h,'elect_2_h = ', elect_2_h, 'elect_3_h = ', elect_3_h)
print('elect_1_ind =' ,elect_1_ind,'elect_2_ind = ', elect_2_ind, 'elect_3_ind = ', elect_3_ind)
print("家用電 = ", (elect_money1_h + elect_money2_h + elect_money3_h),
      "工業用電 = ", (elect_money1_ind + elect_money2_ind + elect_money3_ind))

