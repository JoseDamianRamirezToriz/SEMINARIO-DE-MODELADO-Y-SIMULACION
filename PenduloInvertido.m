function dz = doblependulo(t, z)
    %---Definición de los parámetros---%
    Lp = 0.3302;       % Longitud del péndulo (m)
    Mp = 0.23;         % Masa del péndulo (kg)
    Ip = 0.0079;       % Momento de inercia del péndulo (kgm²)
    Mc = 0.7031;       % Masa del carro (kg)
    Fc = 0;            % Fuerza aplicada al carro (N)
    Bp = 0.0024;       % Coeficiente de amortiguamiento del péndulo (Nms/rad)
    g = 9.81;          % Aceleración debido a la gravedad (m/s²)
    Beq = 4.3;         % Coeficiente de amortiguamiento equivalente (Ns/m)

    %---Estados del sistema---%
    dz = zeros(4, 1);

    %---Definición de la dinámica del sistema---%
    denom = (Mc + Mp) * Ip + Mc * Mp * Lp^2 + Mp^2 * Lp^2 * sin(z(3))^2;

    % Ecuación para ddot_xc
    dz(1) = z(2);
    dz(2) = ((Ip + Mp * Lp^2) * Fc + Mp^2 * Lp^2 * g * cos(z(3)) * sin(z(3))- (Ip + Mp * Lp^2) * Beq * z(2)- (Ip * Mp * Lp - Mp^2 * Lp^3) * z(4)^2 * sin(z(3))- Mp * Lp * z(4) * cos(z(3)) * Bp) / denom;

    % Ecuación para ddot_alpha
    dz(3) = z(4);
    dz(4) = ((Mc + Mp) * Mp * g * Lp * sin(z(3))- (Mc + Mp) * Bp * z(4)+ Fc * Mp * Lp * cos(z(3))- Mp^2 * Lp^2 * z(4)^2 * sin(z(3)) * cos(z(3))- Beq * Mp * Lp * z(2) * cos(z(3))) / denom;
end