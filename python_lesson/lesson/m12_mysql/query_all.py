import mysql.connector
from mysql.connector import errorcode


cursor = None
conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')          #class

    cursor = conn.cursor()                                      #class

    print('type(conn)= ', type(conn))
    print('type(cursor)= ', type(cursor))

    print('=============================================================================')

    query = "SELECT ename, hiredate, salary FROM employee"

    cursor.execute(query)                                       # method , 回傳一值給 cursor
    print('cursor= ', cursor)
    print('type(cursor.execute)= ', type(cursor.execute))
    print('=============================================================================')

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