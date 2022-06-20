function out = three_link_dynamics(in)

th1 = in(1); th2 = in(2); th3 = in(3);
dth1 = in(4); dth2 = in(5); dth3 = in(6);
f1 = in(7); f2 = in(8); f3 = in(9);

m1 = 3; m2 = 2; m3 = 2;
L1 = 2; L2 = 1; L3 = 1;
g = 9.8;

% joint torque로부터 수식 전개.
M11 = (m1+m2+m3)*L1^2+(m2+m3)*L2^2+m3*L3^2+(m2+m3)*L1*L2*2*cos(th2)+m3*L2*L3*2*cos(th3)+m3*L3*L1*2*cos(th2+th3);
M12 = (m2+m3)*L2^2+m3*L3^2+(m2+m3)*L1*L2*cos(th2)+m3*L2*L3*2*cos(th3)+m3*L3*L1*cos(th2+th3);
M13 = m3*L3^2+m3*L2*L3*cos(th3)+m3*L3*L1*cos(th2+th3);

M21 = M12;
M22 = (m2+m3)*L2^2+m3*L3^2+m3*L2*L3*2*cos(th3);
M23 = m3*L3^2+m3*L2*L3*cos(th3);

M31 = M13;
M32 = M23;
M33 = m3*L3^2;

M = [M11 M12 M13; M21 M22 M23; M31 M32 M33];

C11 = -(m2+m3)*L1*L2*(2*dth1*dth2+dth2^2)*sin(th2)-m3*L2*L3*(2*dth1*dth3+2*dth2*dth3+dth3^2)*sin(th3)-m3*L3*L1*(2*dth1+dth2+dth3)*(dth2+dth3)*sin(th2+th3);
C21 = -m3*L2*L3*(2*dth1*dth3+2*dth2*dth3+dth3^2)*sin(th3)+(m2+m3)*L1*L2*dth1^2*sin(th2)+m3*L3*L1*dth1^2*sin(th2+th3);
C31 = m3*L2*L3*(dth1+dth2)^2*sin(th3)+m3*L3*L1*dth1^2*sin(th2+th3);
C = [C11; C21; C31];

G11 = (m1+m2+m3)*g*L1*cos(th1)+(m2+m3)*g*L2*cos(th1+th2)+m3*g*L3*cos(th1+th2+th3);
G21 = (m2+m3)*g*L2*cos(th1+th2)+m3*g*L3*cos(th1+th2+th3);
G31 = m3*g*L3*cos(th1+th2+th3);
G = [G11; G21; G31];

F = [f1; f2; f3];

out = inv(M)*(-C-G+F);