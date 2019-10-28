# 產生一個class名為Stack，有一個成員變數為一串列(用以存放資料)；
# 有兩個成員方法push()和pop()，分別用來放資料和取資料。
# 產生一個exception class名為StackEmptyError繼承Exception，用來處理Stack空的狀況。
# 提示：Stack以先進後出(First In Last Out)的方式存取資料。


class StackEmptyError(Exception):
    def __init__(self, cause, message):
        self.cause = cause
        self.message = message

    def __str__(self):
        return self.cause + ': ' + self.message


class Stack(object):
    def __init__(self):
        self.list1 = []

    def push(self, given_data):
        self.list1.append(given_data)

    def pop(self):
        try:
            self.list1.pop()
        except:
            print(StackEmptyError('Index', 'error'))
            print('沒有東西可取囉')

    def __str__(self):
        return '{}'.format(self.list1)

