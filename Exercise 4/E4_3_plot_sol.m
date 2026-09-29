% Numerical Optimization and Model Predictive Control
% Script for Task 4.3

t = 0:0.01:1;

a= 0.01;

figure;

for i = 1:3

    c1 = 1/(1-exp(2*sqrt(1/a)));
    
    x = c1* (exp(sqrt(1/a)*t) - exp(sqrt(1/a)*(2-t)));
    u = sqrt(1/a)*c1*(exp(sqrt(1/a)*t) + exp(sqrt(1/a)*(2-t)));
    lambda = - a* u;

    integrand = 0.5*x.^2 + 0.5*a*u.^2;
    J_traj = cumtrapz(t, integrand);
    
    subplot(2,2,1)
    plot(t, x, 'LineWidth', 2)
    hold on; grid on; box on;
    xlabel('Time t'); ylabel('State x');
    
    subplot(2,2,2)
    plot(t, u, 'LineWidth', 2)
    hold on; grid on; box on;
    xlabel('Time t'); ylabel('Input u');
    
    subplot(2,2,3)
    plot(t, lambda, 'LineWidth', 2)
    hold on; grid on; box on;
    xlabel('Time t'); ylabel('Adj. state \lambda');

    subplot(2,2,4)
    plot(t, J_traj, 'LineWidth', 2)
    hold on; grid on; box on;
    xlabel('Time t'); ylabel('Cost J');
    
    legend('a = 0.01', 'a = 0.1', 'a = 1');
    
    a = a*10;
end