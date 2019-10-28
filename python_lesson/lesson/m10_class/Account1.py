class Acount:
    pass


def deposit(acc, amount):
    try:
        if amount <= 0:
            raise ValueError
        else:
            acc.balance += amount
    except ValueError:
        print("金額必須為正整數")


def withdrow(acc, amount):
    try:
        if amount <= acc.balance:
            acc.balance -= amount
        else:
            raise ValueError
    except ValueError:
        print("餘額不足")


def main():
    acc_jason = Acount()
    acc_jason.number = 'F129307244'
    acc_jason.name = 'JASON WU'
    acc_jason.balance = 10000

    print(acc_jason.number)
    print(acc_jason.name)
    print(acc_jason.balance)

    amount = int(input('輸入存款金額:'))
    deposit(acc_jason, amount)
    print(acc_jason.balance)

    amount = int(input('輸入取款金額:'))
    withdrow(acc_jason, amount)
    print(acc_jason.balance)


main()