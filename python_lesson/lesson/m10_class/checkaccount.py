from m10_class.Account4 import Account


class CheckingAccount(Account):
    def __init__(self, number, name, balance):
        super(CheckingAccount, self).__init__(number, name, balance)
        self.credit_limit = 10000

    def withdraw(self, amount):
        try:
            if amount <= self.balance + self.credit_limit:
                self.balance -= amount
            else:
                raise ValueError
        except ValueError:
            print("超過信用額度")

    def __str__(self):
        return (super(CheckingAccount, self). __str__() +
                '\ncredit_limit: {0}'.format(self.credit_limit))

