## 1931

# 가장 많은 회의의 수를 알기 위해서는 빨리 끝나는 회의 순서대로 정렬
# 무작정 빨리 시작하는 순서대로만 정렬하면, 오히려 늦게 끝날 수 있다.
# 끝나는 시간이 같은 경우에 빨리 시작하는 순서대로 정렬한다.
# 빨리 끝날수록 뒤에서 고려해볼 회의가 많아진다.


import sys  # stdin.readline()을 이용하여 시간초과 방지

N = int(input())   # 회의의 수
time=[[0]*2 for i in range(N)]
for i in range(N):      # 회의시간 정보(시작과 끝)
    s,e=map(int, sys.stdin.readline().split())
    time[i][0]=s
    time[i][1]=e
time.sort(key=lambda x:(x[1],x[0]))
# 끝나는 시간이 빠른 순서로 정렬한 뒤 같은 경우에는 시작시간 빠른순

count=1     # 가능한 회의 개수(맨 처음의 회의를 count하여 1로 시작)
end_time = time[0][1]
for i in range(1,N):
    if time[i][0] >= end_time:  # 끝나는 시간보다 해당 시작시간이 빠른 경우
        count += 1
        end_time=time[i][1]     # 선택된 회의시간이 끝나는 시간을 end_time으로 변경

print(count)

import sys
N = int(sys.stdin.readline())
time=[[0]*2 for _ in range(N)]
for i in range(N):
    s,e=map(int,sys.stdin.readline().split())
    time[i][0]=s
    time[i][1]=e
time.sort(key=lambda x:(x[1],x[0]))
cnt =1
end_time=time[0][1]
for i in range(1,N):
    if time[i][0]>=end_time:
        cnt+=1
        end_time=time[i][1]
print(cnt)