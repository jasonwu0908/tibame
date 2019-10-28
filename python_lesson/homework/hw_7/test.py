# 將employee表格裡的所有資料dump至檔案中。
# 註：一筆資料一列，每個資料欄的資料以逗號(,)隔開
import mysql.connector
from mysql.connector import errorcode


cursor = None
conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')          #class

    cursor = conn.cursor()                                      #class

    query = "SELECT * FROM employee"
    cursor.execute(query)                                       # method , 回傳一值給 cursor
    emps = cursor.fetchall()

    for emp in emps:
        print(emp[0], emp[1], emp[2], emp[3], emp[4], emp[5], sep=',', file=open('employee.txt', 'a'))
    # with open('lang.txt', 'w') as f:
    #     f.write('Python\n')

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