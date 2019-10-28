try:
    n1, n2 = eval(input('give 2 numbers:'))
    div = n1 / n2
    print('{} / {} = {}' .format(n1, n2, div))


# except ValueError:
#     print('ValueError')
except ZeroDivisionError:
    print('ZeroDivisionError')
except SyntaxError:
    print('SyntaxError')
except:
    print('something wrong')
else:
    print('NO EXCEPTION')
finally:
    print('MUST DO')
