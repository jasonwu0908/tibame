from m10_class.checkaccount import CheckingAccount

ca = CheckingAccount('111111111', 'JASON', 1000000)
ca.deposit(500000)
ca.withdrow(200000)
print(ca)

ca1 = CheckingAccount('222222222', 'MARY', 1000)
ca1.deposit(1000)
ca1.withdrow(3000)
print(ca1)