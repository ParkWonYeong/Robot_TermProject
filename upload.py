## 2839
sugar = input("숫자를 입력하세요: ")
kg = int(sugar)

bag = 0     # 포대의 개수는 처음에 0으로 시작
while kg >= 0:  # 받은 설탕의 무게가 0kg이 될때까지 반복한다.
    if kg % 5 == 0:     #5kg짜리로 모두 선택 가능한 경우
        bag += (kg // 5)
        print(bag)
        break
    kg -= 3             # 5kg짜리로 선택하고 남은 것은 3kg짜리로
    bag += 1            # 하나씩 추가해준다.
else:
    print(-1)

## 11047
N, K = input().split()   # N, K값을 받아온다.
n = int(N)
k = int(K)
m = []      # 배열 방을 만들어준다.
num = 0     # 최소 동전 개수를 프린트할때 쓴다.

for i in range(n):
        m.append(int(input()))

for i in reversed(range(n)):    # 오름차순으로 받으므로 끝(큰값)에서부터 불러온다.
    num += k // m[i]        # num 값에 K를 동전으로 나눈 몫을 더해준다.
    # 여기서 따로 최소값따위를 구하지 않는 이유는 m[i]가 k보다 크면 0이 나오기 때문.
    k = k%m[i]      # K는 동전으로 나눈 나머지로 계속 반복문을 돌린다.

print(num)

## 1012
import sys                  # recursion 깊이가 너무 적게 지정된 경우 발생할 수 있음.
sys.setrecursionlimit(10**6)    # 파이썬 기본 재귀 깊이 제한은 1000정도.

def dfs(x, y):      #깊이우선탐색(DFS)를 이용한다.
    if x<0 or x>=m or y<0 or y>=n:
        return False
    if mtx[y][x]==1:
        mtx[y][x] = 0   # 탐색한 1은 이후 중복을 방지하기 위해 0으로 바꾸어준다.
        # 상하좌우를 탐색한다.
        dfs(x-1,y)
        dfs(x+1,y)
        dfs(x,y-1)
        dfs(x,y+1)
        return True
    return False

t = int(input())        # 첫째: 테스트 케이스의 개수 받기
for testcase in range(t):

    m,n,k = map(int, input().split()) # 둘째: 가로,세로,배추위치의 개수
    mtx = [[0]*m for i in range(n)]
    
    for row in range(k):      # 셋째: 배추의 위치값을 받는다.
        x, y = map(int, input().split())
        mtx[y][x]=1
    # main
    count = 0
    for i in range(m):
        for j in range(n):
            if dfs(i,j)==True:
                count += 1
    print(count)

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