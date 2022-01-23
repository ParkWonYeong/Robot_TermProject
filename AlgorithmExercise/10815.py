## 10815

## 방법1) 이분탐색법을 사용한다. ##

import sys
input = sys.stdin.readline

def binary_search(target):
    start, end = 0, N-1
    is_find=False
    while True:
        mid = (start+end)//2
        if target == num_sang[mid]:
            is_find=True
            return 1
        elif target > num_sang[mid]:
            start = mid+1
        elif target < num_sang[mid]:
            end = mid-1

        if start > end:
            break

    if not is_find:
        return 0

N=int(input())  # 상근이의 카드 개수
num_sang = list(map(int, input().split()))
num_sang.sort()

M=int(input())  # 주어지는 정수 개수
num_M = list(map(int, input().split()))

for i in range(M):
    print(binary_search(num_M[i]), end=' ')


## 방법2) 집합(set)을 이용한다. ##

import sys
input=sys.stdin.readline

N=int(input())
num_sang=set(map(int, input().split()))
M=int(input())
num_M=list(map(int, input().split()))
for i in num_M:
    if i in num_sang:
        print(1, end=' ')
    else:
        print(0, end=' ')