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