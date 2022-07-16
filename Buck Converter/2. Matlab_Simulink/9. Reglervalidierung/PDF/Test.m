function Test()
    warning('off','all')

        simOut = sim('Vergleich_linear_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
        % NICHTLINEAR
        vec_v_PV_nichtlinear = simOut.y_nichtlinear.signal1.Data;
        vec_i_L_nichtlinear = simOut.y_nichtlinear.signal2.Data;

        % LINEAR
        mat_x = simOut.y_linear.Data(:, 1);
        mat_y = simOut.y_linear.Data(:, 2);
        vec_v_PV_linear = mat_x + 2*x_Ruhe(1);
        faktor = mat_y(end)/vec_i_L_nichtlinear(end);
        vec_i_L_linear = mat_y;

        t_vec = simOut.tout;

        figure
        plot(t_vec, vec_v_PV_nichtlinear, t_vec, vec_v_PV_linear);
        legend("nichtlinear", "linear");
        grid on;

        figure
        plot(t_vec, vec_i_L_nichtlinear, t_vec, vec_i_L_linear);
        legend("nichtlinear", "linear");
        grid on;

    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Winkel $\varphi$ [$^{\circ}$]','interpreter','latex')
    legend(legendString)
    grid on
    hold off
    filename = fullfile('./9. Reglervalidierung/PDF/', 'linear_ackermann_phi.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end