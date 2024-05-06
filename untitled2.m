% Input array
x = [7, 8, 2, 8, 6, 1, 3, 5, 8, 8, 2, 8, 8, 4, 7, 2, 4, 8, 7, 8];
y = [0.66, 0.04, 0.85, 0.93, 0.68, 0.76, 0.74, 0.39, 0.66, 0.17, 0.71, 0.03, 0.28, 0.05, 0.10, 0.82, 0.69, 0.32, 0.95, 0.03];

% Compute tied ranks
xr = tiedrank(x);
yr = tiedrank(y);

% Display the results
disp('Original Array:');
disp(x);
disp(y);

disp('Tied Ranks Array:');
disp(xr);
disp(yr);

disp(sum(xr));
disp(sum(yr));

format shortG;
disp(sum(xr.^2))
disp(sum(yr.^2))

sum_of_product = sum(xr .* yr);
disp(sum_of_product)

histogram2(x,y)


% Define bin edges for x1 and x2
bin_edges_x1 = 0.5:1:9.5;
bin_edges_x2 = 0.1:0.1:1.0;

% Calculate the 2D histogram matrix
hist_matrix = hist3([x1, x2], 'Edges', {bin_edges_x1, bin_edges_x2});

% Display the histogram matrix
disp('2D Histogram Matrix:');
disp(hist_matrix);

% Display bin edges information
disp('Bin Edges for x1:');
disp(bin_edges_x1);
disp('Bin Edges for x2:');
disp(bin_edges_x2);

% Optionally, you can visualize the histogram matrix
figure;
imagesc(hist_matrix');
colorbar;
xlabel('Bins for x1');
ylabel('Bins for x2');
title('2D Histogram Matrix');

% Optionally, you can display the actual data points on top of the histogram
hold on;
scatter(x1, x2, 10, 'r.', 'filled');
hold off;