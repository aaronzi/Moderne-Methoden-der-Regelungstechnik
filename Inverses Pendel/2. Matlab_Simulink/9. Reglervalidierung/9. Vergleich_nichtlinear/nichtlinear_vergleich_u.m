function nichtlinear_vergleich_u()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    % sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
    % sP_I_Regelung = [-3.2 -3.2 -3.2 -3.2 -3.2];

    assignin('base','start_deg',20);
    assignin('base','y_ref',0.1);

    simOut1 = sim('Einfache_Zustandsrueckfuehrung_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    u = simOut1.u.Data;
    t_vec = simOut1.tout;
    plot(t_vec,u)
    hold on
    
    simOut2 = sim('Einfache_Zustandsrueckfuehrung_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    u = simOut2.u.Data;
    t_vec = simOut2.tout;
    plot(t_vec,u)
    hold on

    simOut3 = sim('Einfache_Zustandsrueckfuehrung_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    u = simOut3.u.Data;
    t_vec = simOut3.tout;
    plot(t_vec,u)
    hold off

    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Eingangskraft u [N]','interpreter','latex')
    legend('Einfacher Regler','Vorsteuerung','I-Regler')
    grid on

    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./9. Reglervalidierung/9. Vergleich_nichtlinear/', 'nichtlinear_vergleich_u.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end