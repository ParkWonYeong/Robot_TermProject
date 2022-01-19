## 1969
# Hamming Distance는 각 위치의 뉴클오티드 문자가 다른 것의 개수이다.
# 따라서 Hamming Distance를 작게 하려면 문자가 최대한 많이 겹치면 된다.

import sys
input=sys.stdin.readline

N,M=map(int, input().split())           # DNA의 수 N, 문자열의 길이 M
dna=[]                                  # N개의 DNA가 한줄씩 주어진다
for _ in range(N):
    dna.append(list(map(str, input())))

count, ans = 0, 0
result=''
for i in range(M):
    t, a, g, c = 0, 0, 0, 0
    # Hamming Distance가 작으려면 문자가 최대한 많이 겹치면 된다.
    for j in range(N):                  # Hamming Distance의 합이 가장 작은 DNA 찾기
        if dna[j][i]=='T':              # 한 DNA에서 T가 나오면 t 개수 카운트
            t += 1
        elif dna[j][i]=='A':            # 한 DNA에서 A가 나오면 a 개수 카운트
            a += 1
        elif dna[j][i]=='G':            # 한 DNA에서 G가 나오면 g 개수 카운트
            g += 1
        elif dna[j][i]=='C':            # 한 DNA에서 C가 나오면 c 개수 카운트
            c += 1
    # 사전 순으로 개수가 가장 많은 DNA(result)를 찾고 Hamming Distance 값(ans)을 구한다.
    if max(t,a,g,c)==a:
        result += 'A'
        ans += t+g+c
    elif max(t,a,g,c)==c:
        result += 'C'
        ans += t+a+g
    elif max(t,a,g,c,)==g:
        result += 'G'
        ans += t+a+c
    elif max(t,a,g,c)==t:
        result += 'T'
        ans += a+g+c

# 출력
# 동일한 합이 여러 개일 때는 사전순으로 가장 앞서는 것을 출력한다
print(result)                           # 첫째줄에 Hamming Distance 합이 가장 작은 DNA를 출력
print(ans)                              # 둘째줄에 그 Hamming Distance의 합을 출력한다
