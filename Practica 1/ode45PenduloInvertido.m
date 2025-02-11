%---Condiciones iniciales---%
z0 = [0, 0, deg2rad(1), 0]; % [xc(0), dxc(0), alpha(0), dalpha(0)]

%---Tiempo de simulación---%
tspan = [0,  10]; % De 0 a 10 segundos

%---Resolver el sistema con ODE45---%
[t, z] = ode45(@PenduloInvertido, tspan, z0);

%---Graficar los resultados---%
figure(1);
subplot(2, 1, 1); 

% Posición del carrito
plot(t, z(:, 1), 'b', 'LineWidth', 1.5); 
hold on;

% Velocidad del carrito
plot(t, z(:, 2), 'r', 'LineWidth', 1.5);
hold off;

xlabel('Tiempo');
ylabel('Carrito');
title('Variables del Carrito');
legend('Posición (z1)', 'Velocidad (z2)');
grid on;

%-------------------------------------------------------

% Variables del péndulo
subplot(2, 1, 2); 

% Ángulo del péndulo
plot(t, z(:, 3), 'g', 'LineWidth', 1.5); 
hold on;

% Velocidad angular del péndulo
plot(t, z(:, 4), 'm', 'LineWidth', 1.5); 
hold off;

xlabel('Tiempo (s)');
ylabel('Péndulo');
title('Variables del Péndulo');
legend('Ángulo (z3)', 'Velocidad angular (z4)');
grid on;