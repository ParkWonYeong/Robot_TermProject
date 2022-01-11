## 2583

# 눈금간격(1)에 맞춰 K개의 직사각형 그리기
# 내부를 제외한 나머지 부분이 몇개의 분리된 영역으로 나눠짐
# 주어지는 것은 크기 MxN의 M, N 값, 빗금칠한 좌표 K값
# K개의 빗금칠된 직사각형 내부를 제외한 나머지 부분이 몇개의 분리영역으로
# 나뉘었는지, 그리고 분리된 각 영역 넓이가 얼마인지 구하여 출력하기

import sys
sys.setrecursionlimit(10**6)

def dfs(x,y):
    global count
    if x<0 or x>=M or y<0 or y>=N:
        return 0
    if mtx[x][y]==1:
        return 0
    mtx[x][y]=1
    count += 1
    # 상하좌우를 탐색한다.
    dfs(x-1,y)
    dfs(x+1,y)
    dfs(x,y-1)
    dfs(x,y+1)
    return count

# M, N, K가 빈칸을 두고 차레로 주어진다.
M,N,K = map(int, input().split())
count=0

mtx=[[0]*N for i in range(M)]
for _ in range(K):
    x1, y1, x2, y2 = map(int,input().split())
    for i in range(y1,y2):        # 빗금이 그어진 위치값을 받는다.
        for j in range(x1,x2):
            mtx[i][j]=1             # 그 값을 1로 둔다.

# main
res=[]
for i in range(M):
    for j in range(N):
        cnt=dfs(i,j)
        if dfs(cnt):
            res.append(cnt)
            count = 0

res.sort()
print(len(res))
for i in res:
    print(i, end=' ')

# 위와같이 시도해보았으나 에러가 발생하였다.
# 결국 BFS 문제로 두고 풀이를 찾아보았다.

from collections import deque

M,N,K = map(int, input().split())
count=0

mtx=[[0]*N for i in range(M)]
for _ in range(K):
    x1, y1, x2, y2 = map(int,input().split())
    for i in range(y1,y2):        # 빗금이 그어진 위치값을 받는다.
        for j in range(x1,x2):
            mtx[i][j]=1             # 그 값을 1로 둔다.

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

def bfs(x,y):
    global answer
    queue=deque()
    queue.append((x,y))
    mtx[x][y]=1
    size=1
    while queue:
        x,y=queue.popleft()
        for i in range(4):      # 상하좌우 탐색
            nx = x+dx[i]
            ny = y+dy[i]
            if 0<=nx<M and 0<=ny<N and mtx[nx][ny] == 0:    # 빗금없는 경우
                mtx[nx][ny]=1   # 해당 영역의 좌표를 1로 바꿔가며
                queue.append((nx,ny))
                size += 1       # 분리된 영역 넓이를 체크한다.
    res.append(size)

# main
res=[]
for i in range(M):
    for j in range(N):
        if mtx[i][j]==0:
            bfs(i,j)

res.sort()      # 오름차순으로 각 영역의 넓이를 정렬한다.
print(len(res)) # 첫째줄 출력. 영역의 개수를 출력한다.
for i in res:   # 둘째줄 출력. 각 영여의 넓이를 오름차순으로 정렬한다.
    print(i, end=' ')