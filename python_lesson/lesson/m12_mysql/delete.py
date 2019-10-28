import mysql.connector
from mysql.connector import errorcode


cursor = None
conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')

    cursor = conn.cursor()
    del1 = "DELETE FROM employee WHERE empno = %s"
    data1 = (1011,)
    data2 = (1012,)
    data3 = (1013,)
    data4 = (1014,)
    data5 = (1015,)
    del_data = [data1, data2, data3, data4, data5]
    print(type(del_data))
    cursor.executemany(del1, del_data)
    conn.commit()
    # print('delete', cursor.rowcount, "employees")
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