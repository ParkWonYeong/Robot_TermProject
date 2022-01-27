## 1406

import sys
input = sys.stdin.readline

def L():    # L: 커서를 왼쪽으로 한칸 옮김(커서가 문장의 맨 앞이면 무시됨)
    if stack_left:
        stack_right.append(stack_left.pop())
def D():    # D: 커서를 오른쪽으로 한칸 옮김(커서가 문장의 맨 뒤면 무시됨)
    if stack_right:
        stack_left.append(stack_right.pop())
def B():    # B: 커서 왼쪽의 문자를 삭제(커서가 문장의 맨 앞이면 무시)
    if stack_left:          # 삭제로 인해 커서는 한칸 왼쪽으로 이동한 것처럼 나타나지만,
        stack_left.pop()    # 실제로 커서의 오른쪽에 있던 문자는 그대로임
def P(x):   # P $: $라는 문자를 커서 왼쪽에 추가함
    stack_left.append(x)
    

# 파이썬에서 list로 구현된 "stack"으로 풀이가 가능하다. 커서 기준으로 왼쪽 stack, 오른쪽 stack을 만들어준다.
# 이후 stack_left와 stack_right를 합쳐주면 되는데, stack_left 뒤에 바로 와야할 문자열이
# stack_right 끝에 마지막으로 들어가기 때문에 stack_right의 list를 reverse해주고 합친다.

stack_left = list(input().strip())    # 초기에 편집기에 입력되어 있는 문자열
stack_right = []    # # 명령어가 수행되기 전에 커서는 문장의 맨 뒤(오른쪽)에 위치하고 있다.
M = int(input())    # 입력할 명령어의 개수를 나타내는 정수

for _ in range(M):
    command = list(input().split())
    if command[0] == 'L':
        L()
    elif command[0] == 'D':
        D()
    elif command[0] == 'B':
        B()
    elif command[0] == 'P':
        P(command[1])

stack_left.extend(stack_right[::-1])    # 또는 stack_left.extend(reversed(stack_right))
print(''.join(stack_left))

# 위의 두 줄을 더 짧게 축약해서 print(''.join(stack_left+list(reversed(stack_right))))로 쓰면
# 452ms정도로 나왔다.

# 별해
# stack_right.reverse()
# stack_left.extend(stack_right)

# 하지만 주의점. stack_right.reverse() 보다는 reversed(stack_right)가 좋다고.
# 만약 모든 명령이 끝난 후 stack_right 값이 아무것도 존재하지 않는다면
# stack_right.reverse()는 Type Error를 띄우기 때문이다.
# 반면 reversed(stack_right)는 값이 존재하지 않아도 오류없이 작동한다.

# 실제 동작시켜본 결과 reversed()를 사용했을 때 시간이 476ms,
# .reverse()를 사용했을 때 508ms로 조금 더 빠르기도 했다.



# 다른 풀이를 찾아보다가 훨씬 더 빠른 속도로 해결한 코드가 있길래 따라 작성해봤다.(참고: https://bnzn2426.tistory.com/112)
import sys
from sys import stdin

def L():
    if stack_left:
        stack_right.append(stack_left.pop())
def D():
    if stack_right:
        stack_left.append(stack_right.pop())
def B():
    if stack_left:
        stack_left.pop()
def P(x):
    stack_left.append(x)

stack_left = list(stdin.readline().strip())    # 초기에 편집기에 입력되어 있는 문자열
stack_right = []    # 초기에는 커서 기준으로 right가 비어있다.
M = int(stdin.readline())    # 입력할 명령어의 개수를 나타내는 정수

for command in stdin:       # <<< 이 구문을 사용하니 속도가 꽤 빨라졌다
    if command[0] == 'L':
        L()
    elif command[0] == 'D':
        D()
    elif command[0] == 'B':
        B()
    elif command[0] == 'P':
        P(command[2])
print(''.join(stack_left+list(reversed(stack_right))))