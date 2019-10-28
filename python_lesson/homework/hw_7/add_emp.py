# 在emp.txt文字檔中設定五筆employee的資料，將之新增至資料庫中。
# 註1：一筆資料一列，每個資料欄的資料以逗號(,)隔開
# 註2：建議使用cursor.executemany(sql, seq_of_params)來實作
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

    list_data = []
    list_all_data = []
    with open('emp.txt', 'r', encoding='utf-8') as f:
        line_data = f.readline()[:-1]
        while line_data != '':
            list_data = tuple(line_data.split(','))
            list_all_data.append(list_data)
            line_data = f.readline()[:-1]
        print(list_all_data)

    cursor.executemany(ins, list_all_data)
    conn.commit()
    print('insert', cursor.rowcount, "employees")

    query = "SELECT * FROM employee"
    cursor.execute(query)

    emps = cursor.fetchall()

    for emp in emps:
        print(emp[0], emp[1], emp[2], emp[3], emp[4], emp[5], sep=',')
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