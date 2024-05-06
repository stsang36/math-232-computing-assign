SHAPE(:,:,1) = [0 0 0; 0 0 0; 0 0 0];
SHAPE(:,:,2) = [1 0 0; 0 0 0; 0 0 1];
SHAPE(:,:,3) = [0 0 0; 0 0 0; 0 0 0];
[Y,X,Z] = meshgrid(1:3,1:3,1:3);

m000 = sum(SHAPE(:));
m100 = sum(SHAPE(:).*(X(:)).^1);
m010 = sum(SHAPE(:).*(Y(:)).^1);
m001 = sum(SHAPE(:).*(Z(:)).^1);

x_bar = m100/m000;
y_bar = m010/m000;
z_bar = m001/m000;

mu020 = sum(SHAPE(:).*(Y(:)-y_bar).^2);
mu002 = sum(SHAPE(:).*(Z(:)-z_bar).^2);
mu022 = sum(SHAPE(:).*(Y(:)-y_bar).*(Z(:)-z_bar));

disp(mu002 + mu020);