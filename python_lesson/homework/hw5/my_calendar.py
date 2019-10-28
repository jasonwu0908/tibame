# 輸入一個正整數，列印出那一年的年曆。
# 輸入兩個整數，第一個數字代表那一年，第二個數字代表那一月，列印出那一年那一月的月曆。
import datetime
list_week = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
list_leapyear = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
list_not_leapyear = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]


def leapyear(year):
    if (year % 4000) == 0:
        return list_not_leapyear
    elif (year % 400) == 0:
        return list_leapyear
    elif (year % 100) == 0:
        return list_not_leapyear
    elif (year % 4) == 0:
        return list_leapyear
    else:
        return list_not_leapyear


def find_first_day(year, month):
    weekday_num = datetime.date.weekday(datetime.date(year, month, 1))
    return weekday_num


def print_title(year, month):
    print("\t", year, "年\t", month, "月\n")
    for i in range(len(list_week)):
        print(list_week[i], end="\t")
    print()


def print_month_num(year, month):

    list_month_days = leapyear(year)
    month_first_day = find_first_day(year, month)
    print('\t'*month_first_day, end='')
    for i in range(list_month_days[month]):
        print(i+1, end='\t')

        month_first_day += 1
        if month_first_day == 7:
            print()
            month_first_day = 0
    print()


def main():
    while True:
        yearmonth = eval(input("請輸入西元幾年幾月:"))
        if type(yearmonth) != tuple:
            year = yearmonth
            month = 0
        else:
            year = yearmonth[0]
            month = yearmonth[1]

        if month not in months:
            for month in months:
                print_title(year, month)
                print_month_num(year, month)
                print('\n===============================')
        else:
            print_title(year, month)
            print_month_num(year, month)


main()
