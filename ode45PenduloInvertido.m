%---Condiciones iniciales---%
z0 = [0; 0; deg2rad(1); 0]; % [xc(0), dxc(0), alpha(0), dalpha(0)]

%---Tiempo de simulación---%
tspan = [0 10]; % De 0 a 10 segundos

%---Resolver el sistema con ODE45---%
[t, z] = ode45(@PenduloInvertido, tspan, z0);

%---Graficar los resultados---%
figure(1);
subplot(2, 1, 1);
plot(t, z(:, 1), 'b', 'LineWidth', 1.5);
grid on;
title("Posición del carro (x_c)");
xlabel("Tiempo (s)");
ylabel("Posición (m)");

subplot(2, 1, 2);
plot(t, rad2deg(z(:, 3)), 'r', 'LineWidth', 1.5);
grid on;
title("Ángulo del péndulo (\alpha)");
xlabel("Tiempo (s)");
ylabel("Ángulo (°)");