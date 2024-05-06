m=15; %Choose number of pairs 
%Generating data in [a1,b1]
a1=-5; 
b1=5;
d= a1*ones(m,2)+ (b1-a1).*rand(m,2);

degrees = [1,5,10];  %Choose degree of polynomial 


figure(1);
hold on;



[P1, least1] = generatePoly(m, d, degrees(1));

fplot(P1,[a1-.5,b1+.5])
x1=d(:,1);
y1=d(:,2);
scatter(x1,y1,"filled","o")
xlim([-5 5])
ylim([-5 5])
title('Polynomial with a degree of 1')

[P2, least2] = generatePoly(m, d, degrees(2));
figure(2);
hold on;
fplot(P2,[a1-.5,b1+.5])
scatter(x1,y1,"filled","o")
xlim([-5 5])
ylim([-5 5])
title('Polynomial with a degree of 5')

[P3, least3] = generatePoly(m, d, degrees(3));
figure(3);
hold on;
fplot(P3,[a1-.5,b1+.5])
scatter(x1,y1,"filled","o")
xlim([-5 5])
ylim([-5 5])
title('Polynomial with a degree of 10')


disp('Least squares error for degree 1:')
disp(least1)
disp('Least squares error for degree 5:')
disp(least2)
disp('Least squares error for degree 10:')
disp(least3)








%Creating a zero matrix to save the coefficient matrix

function [P, least] = generatePoly(m, d, n)
    A=zeros(m,n+1); 


    %The following loop produces the coefficient matrix A
    for i=1:m
        for j=1:(n+1)
    A(i,j)=d(i,1)^(j-1);
        end
    end
    %Constructing the right-hand side vector b in Ax=b
    b=zeros(m,1);
    for i=1:m
        b(i)=d(i,2);
    end

    %Constructing the coefficient matrix of normal equation  
    B=A'*A; 
    
    
    %Finding the coefficient of polynomial y_1=a_0; y_2=a_1,....
    %Instead of the following line, use R=rref([A'*A,A'*b]) to find the solution of
    %linear system A'*Ay=A'*b and extract y from the last column R
    R=rref([A'*A,A'*b]);
    y=R(:, end);

    
    
    syms x   %This command defines x as variable 
    P = 0;

    for i =1:n+1
        P = P + y(i) * x^(i-1);
    end
    
    er=zeros(m,1);
    for i=1:m

        P_D = 0;
        pointX = d(i,1);
        for j=1:n+1
            P_D = P_D + y(j) * pointX^(j-1);
        end
        er(i)=abs(d(i,2)- P_D);
    end

    least = norm(er);

end 



