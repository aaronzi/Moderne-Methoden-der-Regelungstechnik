function rekonstruktion_phi_punkt()
    warning('off','all')
    assignin('base','start_deg',20);
    assignin('base','y_ref',0.1);
    simOut = sim('Regelung_mit_Beobachter_linear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
    phi_punkt = simOut.phi_punkt.Data;
    t_vec = simOut.tout;
    plot(t_vec,phi_punkt)
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Winkelgeschwindigkeit $\dot{\varphi}$ [m/s]','interpreter','latex')
    grid on
    filename = fullfile('./9. Reglervalidierung/10. Beobachter/', 'rekonstruktion_phi_punkt.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end