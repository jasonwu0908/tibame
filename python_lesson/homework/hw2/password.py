# 出現”請輸入密碼”的提示，使用者有最多三次輸入的機會。
# # 若輸入正確，則印出”密碼輸入正確，歡迎使用本系統！”。
# # 若輸入不正確，再次出現”請輸入密碼”的提示。
# # 若三次輸入不正確，則印出”密碼輸入超過三次！”，並結束程式的執行。
try_time = 1
passwd_usr = "840908"
while (try_time <= 3):
    passwd = str(input("請輸入密碼:"))
    if (passwd != passwd_usr):
        try_time += 1
        continue
    else:
        print("密碼輸入正確，歡迎使用本系統！")
        break
if (try_time > 3):
    print("密碼輸入超過三次！")
else:
    print("====correct====")
