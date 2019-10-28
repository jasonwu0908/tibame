import mysql.connector
from mysql.connector import errorcode


cursor = None
conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')

    cursor = conn.cursor()
    upd = "UPDATE employee SET salary = %s WHERE empno = %s"
    upd_data = (50000, 1009)

    cursor.execute(upd, upd_data)
    conn.commit()
    print('update', cursor.rowcount, "employees")
    query = "SELECT ename, hiredate, salary FROM employee WHERE empno = %s"
    empno = 1009
    cursor.execute(query, (empno,))
    emp = cursor.fetchone()

    if emp is not None:
        print('name={}, hiredate={}, salary={}'.format(emp[0], emp[1], emp[2]))
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