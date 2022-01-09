## 2217
import sys
sys.setrecursionlimit(10**4)

N = int(input())    #첫째줄에서 정수 N을 입력받는다
rope = []

for _ in range(N):
    rope.append(int(input()))   #다음 N개의 줄에 각 로프가 버틸 수 있는 중량이 주어진다(10000 미만의 자연수)
                                # 이들을 병렬로 연결하여 각각의 로프에 걸리는 중량을 나눈다.

rope.sort(reverse=True) # 가장 무거운 무게를 들 수 있는 로프부터 내림차순으로 정렬한다.

for i in range(N):
    rope[i] = rope[i]*(i+1) # w = (가장 작은 무게를 들수있는 로프가 들수있는 질량)*(연결한 로프개수)

print(max(rope))