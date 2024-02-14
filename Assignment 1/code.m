%% Part 1

m = 10;

case1n = 10;
case2n = 15;
case3n = 5;

[arrCase1, dCount1, iCount1] = getCase(m, case1n);
[arrCase2, dCount2, iCount2] = getCase(m, case2n);
[arrCase3, dCount3, iCount3] = getCase(m, case3n);

disp(['1st Case: ' num2str(dCount1) ' linearly dependent sets and ' num2str(iCount1) ' linearly independent sets']);
disp(['2nd Case: ' num2str(dCount2) ' linearly dependent sets and ' num2str(iCount2) ' linearly independent sets']);
disp(['3rd Case: ' num2str(dCount3) ' linearly dependent sets and ' num2str(iCount3) ' linearly independent sets']);


newM = 15;
b = rand(newM,1);

matrix1c = rand(newM, newM);
matrix2c = rand(newM, newM-5);
matrix3c = rand(newM, newM+5);

matrix1soln = getSolutionMatrix(matrix1c, b);
matrix2soln = getSolutionMatrix(matrix2c, b);
matrix3soln = getSolutionMatrix(matrix3c, b);

linsolve(matrix1c, b)
linsolve(matrix2c, b)
linsolve(matrix3c, b)


disp(matrix1soln)
disp(matrix2soln)
disp(matrix3soln)






%% Part 2 %%
%q1

w1 = [1; 2; -1; 3];
w2 = [4; 1; 1; 8];
w3 = [1; 0; 2; 2];
w4 = [-1; 1; 2; -1];

s1 = [w1 w2 w3 w4];

rrefS1 = rref(s1);

s1Rank = rank(rrefS1);

a = rand(3,1);
myVect = [a; 0];


mySet = [w1 w2 w3 myVect];

mySetrref = rref(mySet);
disp(mySetrref)

%q2
z2 = [1; 0; 2; 2];
z3 = [3; 4; 0; 8];

s1z2 = [s1 z2];
s1z2rref = rref(s1z2);
disp(s1z2rref);

s1z3 = [s1 z3];
s1z3rref = rref(s1z3);
disp(s1z3rref);

%q3
z1q3 = [2; 4; -2; 6];
s2q3 = [z1q3 z2 z3]; 

s2q3rref= rref(s2q3);
disp(s2q3rref)
rank(s2q3)

%q4
z1q4 = [2; 4; -2; 5];
s2q4 = [z1q4 z2 z3];

s1Basis =  [w1 w2 w3];

augMatrix = [s1Basis, -s2q4]; 

nullspaceMat = null(augMatrix);

disp(nullspaceMat);

nullspacerref = rref(nullspaceMat);
disp(nullspacerref);
disp(rank(nullspacerref))




%%

% Functions we use for Part 1
function solution = getSolutionMatrix(A, B)
   
    
    agumentedMatrix = [A B];
    reduced = rref(agumentedMatrix);
    
    solution = reduced;

end



function [list, ld, li] = getCase(row,col)
    myList = {};
    ld = 0;
    li = 0;
    for i=1:5
        vectors = rand(row,col);
        theRank = rank(vectors);
        
        if (theRank == min(row,col))
            li = li + 1;
            myList = [myList, vectors];
        else 
            ld = ld + 1;
        end

    end
    list = myList;
end

