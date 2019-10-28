import mysql.connector
from mysql.connector import errorcode


cursor = None
conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')
    cursor = conn.cursor()
    print(type(cursor))
    query = "SELECT ename, hiredate, salary FROM employee WHERE empno = %s"
    empno = 1001
    cursor.execute(query, (empno,))
    emp = cursor.fetchone()

    if emp is not None:
        print('type(emp)= ', type(emp))
        print('name={}, hiredate={}, salary={}' .format(emp[0], emp[1], emp[2]))
    else:
        print("no data!!!!!!!")
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
    if conn:
        conn.close()