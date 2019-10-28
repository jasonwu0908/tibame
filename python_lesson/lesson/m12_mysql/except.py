import mysql.connector
from mysql.connector import errorcode

conn = None
try:
    conn = mysql.connector.connect(database='db01',
                                   user='root',
                                   password='math100')
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print('USER or PASSWORD error!')
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("database doesn't exist")
    else:
        print(err)
finally:
    if conn:
        print('database is closed!!!')
        conn.close()
    else:
        print('還敢打錯啊?')