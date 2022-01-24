## 10828.py

import sys
input = sys.stdin.readline

# push X 명령어
def push(x): 
    act.append(x)   # 정수 X를 스택에 넣는 연산

# pop 명령어
def pop():
    if(not act):
        return -1   # 스택에 들어있는 정수가 없는 경우 -1 출력
    else:
        return act.pop()    # 스택에서 가장 위에 있는 정수를 빼고 그 수 출력

# size 명령어
def size():
    return len(act) # 스택에 들어있는 정수의 개수 출력

# empty 명령어
def empty():
    if act:
        return 0    # 스택이 비어있지 않으면 0 출력
    else:
        return 1    # 스택에 비어있으면 1 출력

# top 명령어
def top():
    if act:
        return act[-1]  # 스택의 가장 위에 있는 정수 출력
    else:
        return -1       # 만약 스택에 들어있는 정수가 없으면 -1 출력


N=int(input())  # 주어지는 명령 수 N


act = []
for i in range(N):
    command=input().split() # push 1과 같은 명령어를 push, 1 등으로 분리
    order = command[0]  # 명령어를 받는다. (정수 제외)

    if order == "push":
        push(command[1])    # push의 경우 x값인 command[1]을 넣는다.
    elif order == "pop":
        print(pop())
    elif order == "size":
        print(size())
    elif order == "empty":
        print(empty())
    elif order == "top":
        print(top())
