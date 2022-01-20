## 1920

import sys
input = sys.stdin.readline

N = int(input())    # 첫째줄에 자연수 N이 주어진다.
A = list(map(int,input().split()))      # N개의 정수 A[N]이 주어진다.

M = int(input())
B = list(map(int, input().split()))     # 이 수들에 A안에 존재하는가?

res=0

for i in range(M):
    if B[i] in A:
        print(1)
    else:
        print(0)

## 위와 같은 방식으로 하면 정답은 맞지만, 시간초과에 걸린다.
## 따라서 이분 탐색 방법을 고려한다.

# 이분탐색의 탐색 종료 조건은
# mid값이 찾으려는 수랑 같으면 return,
# 없으면 left가 right보다 커질경우 종료한다.(while left<=right)
import sys
input = sys.stdin.readline

def binary_search(target):
    left, right = 0, N-1
    is_find=False
    while True:
        mid = (left+right)//2   #left와 right의 중간값을 구하고
        if target == A[mid]:    # 이 중간값을 인덱스로 하여 numbers에서 가져온값이 현재 하나씩
            print(1)            # 꺼내온 숫자와 같을 경우 1을 출력하고
            is_find=True        # is_find를 True로 바꾸고 반복문 종료
            break
        elif target > A[mid]:   # 꺼내온 숫자가 더 클 경우에는
            left = mid+1        # left값을 중간값+1로
        elif target < A[mid]:   # 꺼내온 숫자가 더 작을 경우에는
            right = mid-1       # right의 값을 중간값-1로 설정한다.

        if left > right:        # left값이 right보다 클 경우
            break               # 반복문을 종료한다.

    if not is_find:             # 종료 뒤 is_find가 여전히 False면
        print(0)                # 0을 출력한다.

N = int(input())    # 첫째줄에 자연수 N이 주어진다.
A = list(map(int,input().split()))      # N개의 정수 A[N]이 주어진다.
A.sort()            # 오름차순으로 정렬한다.

M = int(input())
B = list(map(int, input().split()))     # 이 수들에 A안에 존재하는가?

for i in range(M):
    binary_search(B[i])