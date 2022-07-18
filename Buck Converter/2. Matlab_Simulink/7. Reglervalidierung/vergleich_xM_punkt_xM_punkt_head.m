function vergleich_xM_punkt_xM_punkt_head()
    warning('off','all')
    assignin('base','start_deg',20);
    assignin('base','y_ref',0.1);
    simOut = sim('Regelung_mit_Beobachter_linear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
    mat_y = simOut.y(1,:).Data;
    mat_y_head = simOut.y_head(1,:).Data;
    vec_xM_punkt = mat_y(:,3);
    vec_xM_punkt_head = mat_y_head(:,3);
    t_vec = simOut.tout;
    plot(t_vec,vec_xM_punkt,t_vec,vec_xM_punkt_head)
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Geschwindigkeit $\dot{x}_M$ [m/s]','interpreter','latex')
    legend('$\dot{x}_M$','$\hat{\dot{x}}_M$','interpreter','latex')
    grid on
    filename = fullfile('./9. Reglervalidierung/PDF/', 'vergleich_xM_punkt_xM_punkt_head.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end