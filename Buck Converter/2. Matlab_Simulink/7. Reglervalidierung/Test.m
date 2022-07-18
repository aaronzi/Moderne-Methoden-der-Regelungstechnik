function Test()
    warning('off','all')

    simOut = sim('Vergleich_linear_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    
    % NICHTLINEAR
    vec_v_PV_nichtlinear = simOut.y_nichtlinear.v_PV.Data;
    vec_i_L_nichtlinear = simOut.y_nichtlinear.i_L.Data;

    % LINEAR
    vec_v_PV_linear = simOut.y_linear.Data(:, 1);
    vec_i_L_linear = simOut.y_linear.Data(:, 2);

    t_vec = simOut.tout;

    figure
    plot(t_vec, vec_v_PV_nichtlinear, t_vec, vec_v_PV_linear);
    legend("nichtlinear", "linear");
    title("v_{PV}");
    xlabel("Zeit t [s]");
    ylabel("Spannung U [v]");
    grid on;

    figure
    plot(t_vec, vec_i_L_nichtlinear, t_vec, vec_i_L_linear);
    legend("nichtlinear", "linear");
    title("i_L");
    xlabel("Zeit t [s]");
    ylabel("Strom i [A]");
    grid on;
    
    %{
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Winkel $\varphi$ [$^{\circ}$]','interpreter','latex')
    legend(legendString)
    grid on
    hold off
    filename = fullfile('./9. Reglervalidierung/PDF/', 'linear_ackermann_phi.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
    %}
end