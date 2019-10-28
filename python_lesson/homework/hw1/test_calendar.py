import datetime
list_week = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
list_leapyear = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
list_not_leapyear = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


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


def main():
    year, month = eval(input("請輸入西元幾年幾月:"))
    print(month)
    print(find_first_day(year, month))
    print_title(year, month)
    print_month_num(year, month)


main()
