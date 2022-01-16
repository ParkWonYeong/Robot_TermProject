## 12845

# 1) 두 카드는 인접한 카드여야 한다.
# 2) 업그레이드 된 카드 A의 레벨은 변하지 않는다.
# 카드 합성을 할때마다 두 카드 레벨의 합만큼 골드를 받는다.

# 처음에 가장 큰 수를 더해주는게 유리하다.
# 내림차순으로 변경한 뒤 앞부터 차례로 더해준다.
# [A B C D E F G] <= 레벨이 제일 높은 A가 맨 앞으로 오며, 레벨이 변동되지 않음
# (A+B) + (A+C) + (A+D) + (A+E) + (A+F) + (A+G) = A*6+(B+C+D+E+F+G)
# = (A+B+C+D+E+F+G)+A*5 <= 곱해지는 숫자가 n-2만큼이다.

n=int(input())  # 카드의 개수가 주어진다.

Level = list(map(int, input().split()))  # 각각 카드의 레벨 Li가 순서대로 주어진다.
Level.sort(reverse=True)    # 내림차순으로 정렬한다.

total=0
for i in range(n):
    total += Level[i]
total += Level[0]*(n-2)

print(total)