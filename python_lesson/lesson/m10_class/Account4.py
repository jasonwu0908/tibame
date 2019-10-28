class Account:
    def __init__(self, number, name, balance=0):
        self.number = number
        self.name = name
        self.balance = balance

    def deposit(self, amount):
        try:
            if amount <= 0:
                raise ValueError
            else:
                self.balance += amount
        except ValueError:
            print("金額必須為正整數")

    def withdrow(self, amount):
        try:
            if amount <= self.balance:
                self.balance -= amount
            else:
                raise ValueError
        except ValueError:
            print("餘額不足")

    def __str__(self):
        return ('number: {0}\tname: {1}\tbalance: {2}'
                .format(self.number, self.name, self.balance))


# def main():
#
#     acc_jason = Account('F129307244', 'JASON WU', 100000)
#
#     print(acc_jason)
#     amount = int(input('輸入存款金額:'))
#     acc_jason.deposit(amount)
#     print(acc_jason)
#     amount = int(input('輸入取款金額:'))
#     acc_jason.withdrow(amount)
#     print(acc_jason)
#
#     acc_Tom = Account('a156843546', 'Tom Yun')
#
#     print(acc_Tom)
#
#     amount = int(input('輸入存款金額:'))
#
#     acc_Tom.deposit(amount)
#     print(acc_Tom)
#
#     amount = int(input('輸入取款金額:'))
#     acc_Tom.withdrow(amount)
#     print(acc_Tom)
#
#
# main()