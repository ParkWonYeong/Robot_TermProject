## 11399
n = int(input())        # 사람의 수

p=list(map(int, input().split()))    # 각 사람이 돈을 인출하는데 걸리는 시간. list로 받는다.
p.sort()  # 오름차순으로 정렬해준다.(필요한 시간의 합을 최소로 만든다.)
i=0
j=0
sum=0

for i in range(n):
    j += p[i]   # 한 사람마다 걸리는 시간을 누적한다.
    sum += j    # 최종 도출할 값을 만든다.
    i = i+1

print(sum)