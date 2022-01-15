## 4796

# 계산식: (V//P*L)+(V%P)
# ...라고 생각했으나 두번째 괄호에서는 고려사항이 있다.
# 나누고 남은 수가 L의 값보다 클수도, 작을 수도 있다.
# 이때는 최소 L의 값 이하여야한다.

#sys를 이용했을때 72ms, 이용하지 않았을때 120ms가 걸림.
import sys
input=sys.stdin.readline

cnt=1       # Case number에 기입하기 위한 변수
while True:
    L,P,V=list(map(int, input().split()))
    if L==0&P==0&V==0:  # 마지막줄의 입력을 받으면 멈춘다.
        break
    ans=V//P*L+min(L,V%P)
    print("Case "+str(cnt)+": "+str(ans))
    cnt += 1
