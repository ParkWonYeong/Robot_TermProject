## 10845

import sys
input = sys.stdin.readline

# push X 명령어
def push(x): 
    queue.insert(0, command[1])

# pop 명령어
def pop():
    if(not queue):
        return -1   # 스택에 들어있는 정수가 없는 경우 -1 출력
    else:
        return queue.pop()    # 스택에서 가장 위에 있는 정수를 빼고 그 수 출력

# size 명령어
def size():
    return len(queue) # 스택에 들어있는 정수의 개수 출력

# empty 명령어
def empty():
    if queue:
        return 0    # 스택이 비어있지 않으면 0 출력
    else:
        return 1    # 스택에 비어있으면 1 출력

# front 명령어
def front():
    if queue:
        return queue[len(queue)-1]  # 큐의 가장 앞에 있는 정수
    else:
        return -1   # 큐에 들어있는 정수가 없으면 -1 출력

# back 명령어
def back():
    if queue:
        return queue[0] # 큐의 가장 뒤에 있는 정수
    else:
        return -1   # 큐에 들어있는 정수가 없으면 -1 출력


N=int(input())  # 주어지는 명령 수 N

queue=[]
for _ in range(N):
    command = input().split()
    order = command[0]

    if order == "push":
        push(command[1])    # push의 경우 x값인 command[1]을 넣는다.
    elif order == "pop":
        print(pop())
    elif order == "size":
        print(size())
    elif order == "empty":
        print(empty())
    elif order == "front":
        print(front())
    else:
        print(back())