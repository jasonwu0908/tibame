# 輸入一西元年，如2015。判斷此年份是否為任年。
# 提示：每四年一閏，每百年不閏，每四百年一閏，每四千年不閏。
year = eval(input("請輸入西元年:"))


def leapyear(year):
    if (year % 4000) == 0:
        return False
    elif (year % 400) == 0:
        return True
    elif (year % 100) == 0:
        return False
    elif (year % 4) == 0:
        return True
    else:
        return False


def main():
    print(leapyear(year))


main()
