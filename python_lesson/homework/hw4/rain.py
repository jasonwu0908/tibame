# 輸入一字串，字串為”all” 表示計算60個月的總平均降雨量，”year”、”season”和”month”
# 分別表示計算某年、某季或某月的平均降雨量。若為後三者，再輸入一個正整數表示那一年、那一季或那一月。
# 說明：5年12個月的降雨量以三維陣列形式事先給好60個浮點數
# 需做誤錯處理：
# a.	輸入除了”all”、”year”、”season”和”month”以外的字串
# b.	若輸入”year”，而正整數輸入1至5以外的數字
# c.	若輸入”season”，而正整數輸入1至4以外的數字
# d.	若輸入”month”，而正整數輸入1至12以外的數字

import random
list_rain = []
list_order = ['all', 'year', 'season', 'month']


def give_rain_list():
    for i in range(5):
        list_rain.append([])
        for j in range(4):
            list_rain[i].append([])
            for k in range(3):
                list_rain[i][j].append(round(float(random.randint(0,1000)/random.randint(1,50)), 2))
    return list_rain


def give_order():
    try:
        str_order = str(input('請輸入:\tall, year, season, month:'))
        if str_order not in list_order:
            raise ValueError
        else:
            print(str_order)
            return str_order
    except ValueError:
        print('請輸入英文')
        return give_order()
    except NameError:
        print('英文拼錯')
        return give_order()
    except SyntaxError:
        print(SyntaxError)
        return give_order()


def avg_rain(commend):
    total = 0
    row = len(list_rain)
    col = len(list_rain[0])
    kon = len(list_rain[0][0])

    if commend == 'all':
        for i in range(row):
            for j in range(col):
                for k in range(kon):
                    total += list_rain[i][j][k]
        rain_avg = total / (row * col * kon)
        return round(rain_avg, 2)

    elif commend == 'year':
        try:
            year_num = int(input('請輸入1~5:'))
            if year_num > 5 or year_num < 1:
                raise IndexError
            else:
                for j in range(col):
                    for k in range(kon):
                        total += list_rain[year_num-1][j][k]
                rain_avg_year = (total / (col * kon))
                return rain_avg_year
        except ValueError:
            print('請勿給數字以外的字,請輸入數字1~5:')
            return avg_rain(commend)
        except IndexError:
            print('不再數字範圍內,請輸入數字1~5:')
            return avg_rain(commend)
    elif commend == 'season':
        try:
            season_num = int(input('請輸入1~4:'))
            if season_num > 4 or season_num < 1:
                raise IndexError
            else:
                for i in range(row):
                    for k in range(kon):
                        total += list_rain[i][season_num-1][k]
                    rain_avg_season = (total / row * kon)
                return round(rain_avg_season, 2)
        except ValueError:
            print('請勿給數字以外的字,請輸入數字1~4:')
            return avg_rain(commend)
        except IndexError:
            print('不再數字範圍內,請輸入數字1~4:')
            return avg_rain(commend)

    else:
        try:
            month_num = int(input('請輸入1~12:'))
            month = (month_num-1) % 3
            if month_num > 12 or month_num < 1:
                raise IndexError
            else:
                if 3 <= month_num <= 5:
                    col = 0
                elif 6 <= month_num <= 8:
                    col = 1
                elif 9 <= month_num <= 11:
                    col = 2
                else:
                    col = 3
                for i in range(row):
                    total += list_rain[i][col][month]
                rain_avg_month = (total / row)
                print(rain_avg_month)
                return round(rain_avg_month, 2)
        except ValueError:
            print('請勿給數字以外的字,請輸入數字1~12:')
            return avg_rain(commend)

        except IndexError:
            print('不再數字範圍內,請輸入數字1~12:')
            return avg_rain(commend)



def main():

        list_rain = give_rain_list()

        for i in range(5):
            print(list_rain[i])
        print()

        print('=' * 50)
        commend = give_order()
        print('=' * 50)
        x = avg_rain(commend)
        print(x)
        print('=' * 50)


main()
