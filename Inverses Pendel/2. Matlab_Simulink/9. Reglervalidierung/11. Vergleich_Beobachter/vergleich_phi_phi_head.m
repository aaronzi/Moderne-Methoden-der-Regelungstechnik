function vergleich_phi_phi_head()
    warning('off','all')
    assignin('base','start_deg',20);
    assignin('base','y_ref',0.1);
    simOut = sim('Regelung_mit_Beobachter_linear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
    mat_y = simOut.y(1,:).Data;
    mat_y_head = simOut.y_head(1,:).Data;
    vec_phi = mat_y(:,1)*180/pi;
    vec_phi_head = mat_y_head(:,1)*180/pi;
    t_vec = simOut.tout;
    plot(t_vec,vec_phi,t_vec,vec_phi_head)
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Winkel $\varphi$ [$^{\circ}$]','interpreter','latex')
    legend('$\varphi$','$\hat{\varphi}$','interpreter','latex')
    grid on
    filename = fullfile('./9. Reglervalidierung/11. Vergleich_Beobachter/', 'vergleich_phi_phi_head.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end