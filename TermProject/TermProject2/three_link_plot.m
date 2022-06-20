% three link plot
simOut = sim('termproject2');      % simulink file
for i = 1:40:length(simOut.ScopeData1{1}.Values.Time)       % Scope value(개수가 많아 40개당 하나의 값)
    th = simOut.ScopeData1{1}.Values.Data(i,:)
    th = pi/2-th;   % 기준좌표 변경 위함
    th1 = th(1); th2 = th(2); th3 = th(3);
    threelink_forward_plot(th1, th2, th3, 2, 1, 1);
    xlabel(simOut.ScopeData1{1}.Values.Time(i,1)) % 시간 표시(초)
    getframe(gcf);
end