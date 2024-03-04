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
theta = 180;

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

