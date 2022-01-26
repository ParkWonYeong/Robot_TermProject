## 10866

import sys
from collections import deque
input = sys.stdin.readline

# push_front X 명령어
def push_front(x): 
    q.appendleft(command[1])
    # 또는
    # tmp = [x]
    # tmp.extend(deq)
    # q = tmp
    # return q

# push_back x 명령어
def push_back(x):
    q.append(command[1])

# pop_front 명령어
def pop_front():
    if (not q):
        return -1   # 스택에 들어있는 정수가 없는 경우 -1 출력
    else:
        return q.popleft()    # 스택에서 가장 위에 있는 정수를 빼고 그 수 출력

# pop_back 명령어
def pop_back():
    if (not q):
        return -1
    else:
        return q.pop()

# size 명령어
def size():
    return len(q) # 덱에 들어있는 정수의 개수 출력

# empty 명령어
def empty():
    if q:
        return 0    # 덱이 비어있지 않으면 0 출력
    else:
        return 1    # 덱이 비어있으면 1 출력

# front 명령어
def front():
    if q:
        return q[0]  # 덱의 가장 앞에 있는 정수
    else:
        return -1   # 덱에 들어있는 정수가 없으면 -1 출력

# back 명령어
def back():
    if q:
        return q[-1] # 큐의 가장 뒤에 있는 정수
    else:
        return -1   # 큐에 들어있는 정수가 없으면 -1 출력


N=int(input())  # 주어지는 명령 수 N

q=deque([])
for _ in range(N):
    command = input().split()
    order = command[0]

    if order == "push_front":
        push_front(command[1])    # push의 경우 x값인 command[1]을 넣는다.
    elif order == "push_back":
        push_back(command[1])
    elif order == "pop_front":
        print(pop_front())
    elif order == "pop_back":
        print(pop_back())
    elif order == "size":
        print(size())
    elif order == "empty":
        print(empty())
    elif order == "front":
        print(front())
    else:
        print(back())

# 참고한 코드(출처 https://e-you.tistory.com/293)
# from collections import deque
# import sys
# input=sys.stdin.readline
# n = int(input())
# q=deque([])
# for _ in range(n):
#     arr = input().split()
#     if arr[0]=="push_front": q.appendleft(int(arr[1]))
#     elif arr[0]=="push_back": q.append(int(arr[1]))
#     elif arr[0]=="pop_front": print(q.popleft()) if q else print(-1)
#     elif arr[0]=="pop_back": print(q.pop()) if q else print(-1)
#     elif arr[0]=="size": print(len(q))
#     elif arr[0]=="empty": print(0) if q else print(1)
#     elif arr[0]=="front" : print(q[0]) if q else print(-1)
#     elif arr[0]=="back" : print(q[-1]) if q else print(-1)