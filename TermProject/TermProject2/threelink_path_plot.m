function threelink_path_plot(select)     % 그 결과를 그래프로 그려주는 함수
    L1 = 2; L2 = 1; L3 = 1;
    if select == 1
        % three_link_street_x
        % 10초간 이동 -> 전체 3의 길이에서 한번에 0.015씩 움직임.
        for x = 1.5:-0.015:-1.5
        % Inverse Kinematics function m-file 활용
           out = threelink_inverseK([x,1.5]);
           th1 = out(1); th2 = out(2); th3 = out(3);
           threelink_forward_plot(th1, th2, th3, L1, L2, L3)
           plot([1.5, -1.5], [1.5,1.5], 'k')   %  직선경로 plot
           getframe(gcf);
        end

    elseif select == 2
        % three_link_street_y
        % 10초간 이동 -> 전체 3의 길이에서 한번에 0.015씩 움직임.
        for y = 1.5:-0.015:-1.5
        % Inverse Kinematics function m-file 활용
           out = threelink_inverseK([1,y]);
           th1 = out(1); th2 = out(2); th3 = out(3);
           threelink_forward_plot(th1, th2, th3, L1, L2, L3)
           plot([1, 1], [1.5,-1.5], 'k')   %  직선경로 plot
           getframe(gcf);
        end

    elseif select == 3
        c_x = 1; c_y = 1; r = 0.6;
        path_x = c_x + r*cos(linspace(0,2*pi,100)); % 0~100 구간 10초간 이동
        path_y = c_y + r*sin(linspace(0,2*pi,100));

        for i = 1:length(path_x)
            x = path_x(i); y = path_y(i);
            out = threelink_inverseK([x,y]);
            th1 = out(1); th2 = out(2); th3 = out(3);
            threelink_forward_plot(th1, th2, th3, L1, L2, L3)
            
            % Draw Circle
            syms xx yy
            circle = (xx-c_x)^2 + (yy-c_y)^2 == r^2;
            fimplicit(circle, 'k')
            getframe(gcf);
        end
    else
        warning('Select 1 or 2 or 3.')
    end
end