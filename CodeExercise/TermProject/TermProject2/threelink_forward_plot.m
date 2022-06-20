function threelink_forward_plot(th1, th2, th3, L1, L2, L3)     % 그 결과를 그래프로 그려주는 함수
    % test: threelink_forward_plot(pi/4,-2*pi/3,-pi/4)

    ox = 0;
    oy = 0;
    hold off
    plot(ox, oy, 'ok'), hold on
   
    % Forward kinematics
    x1 = L1*cos(th1);
    y1 = L1*sin(th1);
    x2 = L1*cos(th1)+L2*cos(th1+th2);
    y2 = L1*sin(th1)+L2*sin(th1+th2);
    x3 = L1*cos(th1)+L2*cos(th1+th2)+L3*cos(th1+th2+th3);
    y3 = L1*sin(th1)+L2*sin(th1+th2)+L3*sin(th1+th2+th3);
    % x3, y3는 end effector
    plot(x1, y1, 'ok')      % joint 1
    plot(x2, y2, 'ok')      % joint 2
    plot(x3, y3, 'ok')      % joint 3
    plot([ox, x1], [oy, y1], 'r')   % link 1
    plot([x1, x2], [y1, y2], 'b')   % link 2
    plot([x2, x3], [y2, y3], 'g')   % link 3
    
    end_effector = [x3 y3]

    max_L = L1+L2+L3+1;    % 그래프의 최대범위 설정
    axis([-max_L max_L -max_L max_L])
    grid on

end