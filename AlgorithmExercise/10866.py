## 10866

import sys
from collections import deque
input = sys.stdin.readline

# push_front X 명령어
def push_front(x): 
    deque.appendleft(0, command[1])
    # 또는
    # tmp = [x]
    # tmp.extend(deq)
    # deque = tmp
    # return deque

# push_back x 명령어
def push_back(x):
    deque.append(0, command[1])

# pop_front 명령어
def pop_front():
    if (not deque):
        return -1   # 스택에 들어있는 정수가 없는 경우 -1 출력
    else:
        return deque.pop()    # 스택에서 가장 위에 있는 정수를 빼고 그 수 출력

# pop_back 명령어
def pop_back():
    if (not deque):
        return -1
    else:
        return deque.pop_back()

# size 명령어
def size():
    return len(deque) # 덱에 들어있는 정수의 개수 출력

# empty 명령어
def empty():
    if deque:
        return 0    # 덱이 비어있지 않으면 0 출력
    else:
        return 1    # 덱이 비어있으면 1 출력

# front 명령어
def front():
    if deque:
        return deque[len(deque)-1]  # 덱의 가장 앞에 있는 정수
    else:
        return -1   # 덱에 들어있는 정수가 없으면 -1 출력

# back 명령어
def back():
    if deque:
        return deque[0] # 큐의 가장 뒤에 있는 정수
    else:
        return -1   # 큐에 들어있는 정수가 없으면 -1 출력


N=int(input())  # 주어지는 명령 수 N

deque=[]
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