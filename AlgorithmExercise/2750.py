## 2750
import sys
input=sys.stdin.readline

N = int(input())    # 첫째줄에 수의 개수N

num=[]
# 둘째줄부터 N개의 줄에는 수가 주어진다.(중복없는 숫자)
for i in range(N):
    num.append(int(input()))

num.sort()

for i in range(N):
    print(num[i])