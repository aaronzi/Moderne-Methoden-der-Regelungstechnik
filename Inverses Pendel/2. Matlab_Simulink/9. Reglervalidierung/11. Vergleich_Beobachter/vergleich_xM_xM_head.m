function vergleich_xM_xM_head()
    warning('off','all')
    assignin('base','start_deg',20);
    assignin('base','y_ref',0.1);
    simOut = sim('Regelung_mit_Beobachter_linear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
    mat_y = simOut.y(1,:).Data;
    mat_y_head = simOut.y_head(1,:).Data;
    vec_xM = mat_y(:,2);
    vec_xM_head = mat_y_head(:,2);
    t_vec = simOut.tout;
    plot(t_vec,vec_xM,t_vec,vec_xM_head)
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Position $x_M$ [m]','interpreter','latex')
    legend('$x_M$','$\hat{x}_M$','interpreter','latex')
    grid on
    filename = fullfile('./9. Reglervalidierung/11. Vergleich_Beobachter/', 'vergleich_xM_xM_head.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end