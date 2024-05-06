
%This code find a polynomial of degree 3 which best fit 10 pairs  in [-2,2]

m=10; %Choose number of pairs 
%Generating data in [a1,b1]
 %d= a1*ones(m,2)+ (b1-a1).*rand(m,2);
a1=-2; 
b1=2;
d= a1*ones(m,2)+ (b1-a1).*rand(m,2); 
%%
%Once you generated the data you need to fit the same data with three
%different polynomial---Do NOT rerun the above lines after generating your
%data set

n=3;  %Choose degree of polynomial 

%Creating a zero matrix to save the coefficient matrix
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
y=B\(A'*b);


syms x   %This command defines x as variable 
P=@(x) y(1)+y(2).*x+y(3).*x.^2+y(4).*x.^3;  %This is a polynomial of degree 3 (you need to change this)

%%%%%% Generating plot
hold on 
coefficients = polyfit(d(:,1), d(:,2), 3);

% Evaluate the fitted polynomial at several points to obtain the line
x_values = linspace(min(d(:,1)), max(d(:,2)), 100);  % Generate 100 points for smoothness
y_values = polyval(coefficients, x_values);

fplot(@(x) P(x),[a1-.5,b1+.5])
plot(x_values, y_values, 'LineWidth', 2, 'DisplayName', 'Fitted Polynomial');
ylim([-5 5])     
x1=d(:,1);
y1=d(:,2);

scatter(x1,y1,"filled","o")

%%%% Error for approximations
er=zeros(m,1);
for i=1:m
    er(i)=abs(d(i,2)-P(d(i,1)));
end
disp('Least squares error:')
norm(er)



