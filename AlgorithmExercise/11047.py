## 11047
N, K = input().split()   # N, K값을 받아온다.
n = int(N)
k = int(K)
m = []      # 배열 방을 만들어준다.
num = 0     # 최소 동전 개수를 프린트할때 쓴다.

for i in range(n):
        m.append(int(input()))

for i in reversed(range(n)):    # 오름차순으로 받으므로 끝(큰값)에서부터 불러온다.
    num += k // m[i]        # num 값에 K를 동전으로 나눈 몫을 더해준다.
    # 여기서 따로 최소값따위를 구하지 않는 이유는 m[i]가 k보다 크면 0이 나오기 때문.
    k = k%m[i]      # K는 동전으로 나눈 나머지로 계속 반복문을 돌린다.

print(num)