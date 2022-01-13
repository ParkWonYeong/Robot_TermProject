## 11000

import heapq
# heapq 모듈은 이진트리 기반의 최소 힙 자료구조를 제공한다.
# min heap를 사용하면 원소들이 항상 정렬된 상태로 추가/삭제되며,
# mim heap 내 가장 작은 값을 인덱스 0이라 하며, 모든 원소네는 항상 자식원소들보다 작거나 동하게 추가/삭제
import sys      # sys.stdin.readline()을 이용한다. (시간초과 방지)

N = int(input())    # 첫번째 줄에서 N을 받는다.
                    # N개의 줄에 Si, Ti가 주어진다.
mtx=[]              # S,T값에 대한 배열 생성
for _ in range(N):
    mtx.append(list(map(int, sys.stdin.readline().split()))) # 배열값으로 받아오는건 이런방법도 있다..
mtx.sort(key=lambda x: x[0])         # 시작시간(x[0])이 빠른 순으로 강의 정렬
# key 인자에 함수를 넘겨주면 해당 함수의 반환값을 비교하여 순서대로 정렬된다.

room=[]                             # 필요한 강의실
# 처음에는 '그냥 room=1로 시작하면 안되나?' 해서 고쳐서 해보다가 깨달았다.
# 이 문제에서는 시작시간과 마치는 시간을 비교해야하며, room 또한 배열에서 배열로 불러와서
# 비교를 해가며 강의실을 개설하는 것이 더 나았다.
heapq.heappush(room, mtx[0][1])     # 맨 처음 강의실

for i in range(1,N):
    if mtx[i][0] < room[0]:            #현재 회의실 끝나는 시간보다 다른 회의시간이 빠르면 새로운 강의실 개설
        heapq.heappush(room, mtx[i][1]) # 강의실 개설을 추가해준다.
    else:                           # 이 경우 똑같은 강의실을 이어서 쓸 수있다.
        heapq.heappop(room)        # 가장 작은 원소 삭제 후 그 값 리턴
        heapq.heappush(room, mtx[i][1])

print(len(room))                    # 최종적으로 room의 len을 구하면 강의실 수를 알수있게 된다.