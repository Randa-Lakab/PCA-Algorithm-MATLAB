% Initial data
X = [9.01 8.05 9.07 8.09 6.1 7.3 7.5 5.7 1 1.5 2 2.5 3 3.5 4.5 1 5.5 6 7 4.3];
Y = [10.2 9.8 9.5 9 8.8 8.2 6.2 7.4 2 5.2 1 7.8 0.6 6.5 6.4 0.3 6.2 4.15 5.1 3.2];
Z = [5 4 5 4 5 4 2 5 4 3.5 3 5 4 3 3.5 4 5 3 4 3];

% Combination into a single matrix (each column corresponds to a variable)
A = [X' Y' Z'];

% 3D Point Cloud Visualization
figure;
plot3(X, Y, Z, 'bo');
grid on;
title('Nuage de points initial');
xlabel('X'); ylabel('Y'); zlabel('Z');

% Centering variables
X = A(:,1) - mean(A(:,1));
Y = A(:,2) - mean(A(:,2));
Z = A(:,3) - mean(A(:,3));

% Reduction (normalization)
X = X / sqrt((1/20) * X' * X);
Y = Y / sqrt((1/20) * Y' * Y);
Z = Z / sqrt((1/20) * Z' * Z);

% New center-reduced matrix
A = [X Y Z];

% Centered-reduced cloud display
figure;
plot3(X, Y, Z, 'r*');
grid on;
title('Nuage centré-réduit');
xlabel('X'); ylabel('Y'); zlabel('Z');

% Calculation of the covariance matrix
Mat_Cov = cov(A, 1);

% Eigenvalues ​​and eigenvectors (principal component analysis)
[Vecteur, Valeur] = eig(Mat_Cov);

% Displaying the main axes
hold on;
quiver3(mean(X), mean(Y), mean(Z), Vecteur(1,1), Vecteur(2,1), Vecteur(3,1), 'LineWidth', 2);
quiver3(mean(X), mean(Y), mean(Z), Vecteur(1,2), Vecteur(2,2), Vecteur(3,2), 'LineWidth', 2);
quiver3(mean(X), mean(Y), mean(Z), Vecteur(1,3), Vecteur(2,3), Vecteur(3,3), 'LineWidth', 2);
hold off;

% Normalization of eigenvectors
Vect1_norm = Vecteur(:,1) / norm(Vecteur(:,1));
Vect2_norm = Vecteur(:,2) / norm(Vecteur(:,2));
Vect3_norm = Vecteur(:,3) / norm(Vecteur(:,3));

% Orthogonality Check
disp('--- Vérification orthogonalité ---');
disp(Vect1_norm' * Vect1_norm);
disp(Vect2_norm' * Vect2_norm);
disp(Vect3_norm' * Vect3_norm);
disp(Vect1_norm' * Vect2_norm);
disp(Vect2_norm' * Vect3_norm);
disp(Vect1_norm' * Vect3_norm);








