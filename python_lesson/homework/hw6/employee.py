# 有一小公司，其人事薪資的制度如下：
# 公司每個員工皆有姓名、性別、到職日、電話和住址等基本資料。
# 一般職員只有本薪；一級主管則另有本薪、午餐津貼、交通津貼和職務加給；二級主管則有本薪、午餐津貼和職務加給。
# 午餐津貼為1800元，交通津貼為2000元，職務加給一級主管為5000元，二級主管為3000元。
# 每個員工皆有可能加班，加班費為本薪除以240乘以1.5倍再乘以加班時數。
# 在main()中產生六個實例分別為一級主管、二級主管及一般職員且分有加班及無加班兩種(資料直接透過建構子hard code在程式中)，
# 並列印其基本資料及當月薪資。


class Staff(object):
    def __init__(self, name, sex, date, phone, address, base_salary, over_time=0):
        self.name = name
        self.sex = sex
        self.date = date
        self.phone = phone
        self.address = address
        self.base_salary = base_salary
        self.over_time = over_time
        self.salary = self.base_salary + self.base_salary / 240 * 1.5 * self.over_time

    def __str__(self):
        return 'name:{}\tsex:{}\tdate:{}\tphone:{}\taddress:{}\tsalary:{}'.format(self.name, self.sex,
                                                                                  self.date, self.phone,
                                                                                  self.address, self.salary)


class Secondary(Staff):
    def __init__(self, name, sex, date, phone, address, base_salary, over_time=0):
        super(Secondary, self).__init__(name, sex, date, phone, address, base_salary)
        self.lunch = 1800
        self.position = 3000
        self.over_time = over_time
        self.salary = self.base_salary + self.base_salary / 240 * 1.5 * self.over_time + self.lunch + self.position


class Primary(Staff):
    def __init__(self, name, sex, date, phone, address, base_salary, over_time=0):
        super(Primary, self).__init__(name, sex, date, phone, address, base_salary)
        self.position = 5000
        self.traffic = 2000
        self.lunch = 1800
        self.over_time = over_time
        self.salary = self.base_salary + (self.base_salary / 240 * 1.5 * self.over_time + self.lunch + self.position +
                                          self.traffic)


