## 1700

import sys
input = sys.stdin.readline

N,K = map(int, input().split())           # 멀티탭 구멍의 개수 N와 전기용품의 총 사용횟수 K
multi = list(map(int, input().split()))   # K 이하의 자연수로 사용 순으로 주어지는 전기용품 목록

plugs = []
count = 0

for i in range(K):
    # 있으면 건너뛴다.
    if multi[i] in plugs:
        continue
    # 1. 멀티탭 개수만큼 순서대로 콘센트를 꽂아둔다.
    if len(plugs) < N:                    # 빈 플러그가 있으면 꽂는다.
        plugs.append(multi[i])
        continue
   
    multi_idxs = []                       # 다음 멀티탭 값 저장
    hasplug = True

    for j in range(N):
        if plugs[j] in multi[i:]:          # 멀티탭에 플러그가 꽂혀있으면 순서 인덱스 위치값 가져오기
            multi_idx = multi[i:].index(plugs[j])
        # 멀티탭의 현재 위치부터 마지막까지 가져온 뒤,
        # 멀티탭 안에 플러그 안에 있는 값이 있다면 멀티탭의 인덱스 값을 가져오고,
        # 없다면 구멍의 최대 개수+1을 해서 101을 넣어준다.
        else:
            multi_idx = 101
            hasplug = False

        multi_idxs.append(multi_idx)         # 인덱스에 값을 넣어준다.

        if not hasplug:
            break                       # 없다면 종료.

    # 뒤에서 사용하지 않거나 가장 적게 사용하는 플러그를 뽑는다.
    del plugs[multi_idxs.index(max(multi_idxs))] # 가장 나중에 쓸 물건 제거
    plugs.append(multi[i])            # 플러그에 멀티탭값 삽입
    count += 1                      # 제거 후 새로 꽂았으므로 뽑는 횟수 count   

print(count)

