function out = threelink_inverseK(input)       % 원하는 좌표로 갈때 그 각도를 계산해주는 함수
    x = input(1); y = input(2);
    L1 = 2; L2 = 1; L3 = 1;
    th_i = -pi/2;
    x2 = x-L3*cos(th_i);
    y2 = y-L3*sin(th_i);
    C = sqrt(x2^2+y2^2);
    gamma = atan2(y2,x2);
    th1 = gamma + acos((C^2+L1^2-L2^2)/(2*L1*C));
    th2 = -th1 + atan2(y2-L1*sin(th1),x2-L1*cos(th1));
    th3 = -pi-th_i-th1-th2;
out = [th1, th2, th3];