function Termproject1(th1, th2, th3, th4, th5, th6)

    d2 = 0.6;
    a2 = 2;
    d3 = -0.3;
    d4 = 0.7;
    
    th = [th1 th2 th3 th4 th5 th6];
    L(1) = Link([th1 0 0 -pi/2]);
    L(2) = Link([th2 d2 a2 0]);
    L(3) = Link([th3 d3 0 -pi/2]);
    L(4) = Link([th4 d4 0 pi/2]);
    L(5) = Link([th5 0 0 -pi/2]);
    L(6) = Link([th6 0 0 0]);
   
    robot = SerialLink(L);
    robot.name = 'Number1';
    robot.plot(th)

    dx = 0.01; dy = 0.01; dz = 0.01;
    
    J = robot.jacob0(th);
    
    Jp = J(1:3,1:3);
    
    dp = [0;0;dz];      %% dp벡터
    
    dq = inv(Jp)*dp;    %% Jp와 dp이용해서 dq벡터 만들기
    
    q = th;             %% dq 이용해서 새로운 q(각도) 만들기
    
    q(1:3) = q(1:3) + dq';
    
    th=q;
    

    robot.plot(q)       %% q 이용해서 robot plot
end