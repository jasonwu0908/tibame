import mysql.connector
from mysql.connector import errorcode


cursor = None
conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')

    cursor = conn.cursor()
    ins = "INSERT INTO employee VALUES(%s, %s, %s, %s, %s, %s)"
    ins_data = (1009, '吳俊陞', '2019-09-08', 48000, 100, 'engineer')

    cursor.execute(ins, ins_data)
    conn.commit()
    print('insert', cursor.rowcount, "employees")
    query = "SELECT ename, hiredate, salary FROM employee"
    cursor.execute(query)

    for ename, hiredate, salary in cursor:
        print('name={}, hiredate={}, salary={}' .format(ename, hiredate, salary))
    print('total', cursor.rowcount, "employees")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print('USER or PASSWORD error!')
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("database doesn't exist")
    else:
        print(err)
finally:
    if cursor:
        cursor.close()
        print('cursor is closed!!!')
    if conn:
        conn.close()
        print('database is closed!!!')