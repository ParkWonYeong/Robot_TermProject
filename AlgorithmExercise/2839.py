## 2839
sugar = input("숫자를 입력하세요: ")
kg = int(sugar)

bag = 0     # 포대의 개수는 처음에 0으로 시작
while kg >= 0:  # 받은 설탕의 무게가 0kg이 될때까지 반복한다.
    if kg % 5 == 0:     #5kg짜리로 모두 선택 가능한 경우
        bag += (kg // 5)
        print(bag)
        break
    kg -= 3             # 5kg짜리로 선택하고 남은 것은 3kg짜리로
    bag += 1            # 하나씩 추가해준다.
else:
    print(-1)