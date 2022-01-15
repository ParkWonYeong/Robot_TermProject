## 13458

# import sys를 이용했을때 143064KB, 916ms였고
# 이용하지 않았을 때 149440KB, 908ms였다. 결론은 안쓸때 더 빨리 처리된다.
import sys
input=sys.stdin.readline

# 첫째줄에 시험장의 개수N이 주어진다
N=int(input())

# 둘째줄에 각 시험장의 응시자 수 Ai가 주어진다
A=list(map(int, input().split()))

# 셋째줄에 B와 C가 주어진다
B,C=map(int,input().split())

# 한 시험장에 총감독관 한명씩부터 넣어주고 B만큼 A[i]의 인원을 빼준다.
total=0
for i in range(len(A)):     # 이녀석때문에 런타임에러가 계속 났다.(그냥 A로 줌)
    A[i] -= B
    total += 1
    if A[i]>0:      # 총감독관만으로 부족하면 부감독관을 투입한다.
        total += A[i]//C
        if A[i]%C != 0:
            total += 1

print(total)