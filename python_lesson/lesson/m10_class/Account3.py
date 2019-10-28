class Acount:
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


def main():

    acc_jason = Acount('F129307244', 'JASON WU', 100000)
    print(acc_jason)
    acc_jason.deposit(5000)

    print("================")
    print(acc_jason)
    acc_jason.withdrow(2000)

    print("================")
    print(acc_jason)

    print("================")
    acc_jason.name = 'jasper'
    print(acc_jason)


main() 