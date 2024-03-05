%%task 1
v = rand(2, 1);


unitV = v / norm(v);

M = zeros(2,6); 
M(:,1) = unitV;

for i=2:6
    p = (i-1)*(pi/3);
    R = [cos(p) -sin(p); sin(p) cos(p)];
    M(:,i) = R*unitV ;
end

%% Display
figure(1)
origin = zeros(1,size(M,2)); 
plot([origin; M(1,:)],[origin; M(2,:)]); 




%% task 2

%rotate by value 180
theta = deg2rad(180);

R2 = [cos(theta) -sin(theta); sin(theta) cos(theta)]; 
M2 = zeros(2,6);

for i=1:6
    M2(:, i) = R2*M(:, i);
end

figure(2)
origin = zeros(1,size(M2,2)); 
plot([origin; M2(1,:)],[origin; M2(2,:)]); 

% reflect across y=x


R3 = [0 1; 1 0];
M3 = zeros(2,6);

for i=1:6
    M3(:, i) = R3*M(:, i);
end

figure(3)
origin = zeros(1,size(M3,2)); 
plot([origin; M3(1,:)],[origin; M3(2,:)]);



%% Task 3

% a
theta1a = pi;
theta2a = pi/2;


T1a = [cos(theta1a) -sin(theta1a); sin(theta1a) cos(theta1a)];
T2a = [cos(theta2a) -sin(theta2a); sin(theta2a) cos(theta2a)];

T12a = T1a*T2a;
T21a = T2a*T1a;

resulta = zeros(2,5);
resultaSame = zeros(2,5);
%resulta(:, 1) = unitV;
resulta(:, 2) = T12a * unitV;
resulta(:, 3) = T21a * unitV;


figure(4)

origin = zeros(1,size(resulta,2)); 
plot([origin; resulta(1,:)],[origin; resulta(2,:)]);
title('A')


% b

theta1b = pi/2;

T1b = [cos(theta1b) -sin(theta1b); sin(theta1b) cos(theta1b)];
T2b = [1 0; 0 -1];

T12b = T1b*T2b;
T21b = T2b*T1b;


resultb = zeros(2,3);
%resultb(:, 1) = unitV;
resultb(:, 2) = T12b * unitV;
resultb(:, 3) = T21b * unitV;

figure(5)

origin = zeros(1,size(resultb,2)); 
plot([origin; resultb(1,:)],[origin; resultb(2,:)]);
title('B')
% c 


T1c = [0 1; 1 0];
T2c = [1 0; 0 -1];

T12c = T1c*T2c;
T21c = T2c*T1c;


resultc = zeros(2,3);
%resultc(:, 1) = unitV;
resultc(:, 2) = T12c * unitV;
resultc(:, 3) = T21c * unitV;

figure(6)

origin = zeros(1,size(resultc,2)); 
plot([origin; resultc(1,:)],[origin; resultc(2,:)]);
title('C')
% d


T1d = [1 -2; 0 1];
T2d = [1 0; 2 1];

T12d = T1d*T2d;
T21d = T2d*T1d;


resultd = zeros(2,3);
%resultd(:, 1) = unitV;
resultd(:, 2) = T12d * unitV;
resultd(:, 3) = T21d * unitV;

figure(7)
origin = zeros(1,size(resultd,2)); 
plot([origin; resultd(1,:)],[origin; resultd(2,:)]);
title('D')




