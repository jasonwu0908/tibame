class OtherError(Exception):
    def __init__(self, cause, message):
        super(Exception, self).__init__(cause, message)
        self.cause = cause
        self.message = message

    def __str__(self):
        return self.cause + ': ' + self.message


try:
    raise OtherError('raise actively', 'user-defined exception example')
except OtherError as e:
    print(e)
    print(e.cause + "> " + e.message)
    print(e.args[0] + ">> " + e.args[1])
