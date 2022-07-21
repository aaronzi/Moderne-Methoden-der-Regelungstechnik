%% VERGLEICH LINEAR NICHTLINEAR - Phi-Grad
function vergleich_linear_nichtlinear_phi_grad()
    warning('off','all')
    
    % PFAD DER SIMULATION
    simOut = sim('Vergleich_linear_nichtlinear','StartTime','0','StopTime','30','FixedStep','1/1e4');
    
    % PHI-WERTE IN GRAD
    vec_phi_grad_linear = simOut.y_linear.Phi_Grad_linear(:, 1).Data;
    vec_phi_grad_nichtlinear =simOut.y_nichtlinear.Phi_Grad_nichtlinear(:, 1).Data;   

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT
    figure
    hold on;
    plot(t_vec, vec_phi_grad_linear, "r--", "LineWidth", 1.5);
    plot(t_vec, vec_phi_grad_nichtlinear, "b");
    xlabel("Zeit t [s]", 'interpreter','latex');
    ylabel("Winkel $\varphi$ [$^{\circ}$]", 'interpreter','latex')
    legend("linear", "nichtlinear", 'interpreter','latex');
    grid on;
    hold off;

    % PDF SPEICHERN
    filename = fullfile('./9. Reglervalidierung/1. Vergleich_linear_nichtlinear/', 'vergleich_linear_nichtlinear_phi_grad.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end