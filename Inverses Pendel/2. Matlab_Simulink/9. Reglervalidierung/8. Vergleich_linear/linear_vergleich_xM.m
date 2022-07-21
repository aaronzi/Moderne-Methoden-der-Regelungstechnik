function linear_vergleich_xM()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    % sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
    % sP_I_Regelung = [-3.2 -3.2 -3.2 -3.2 -3.2];

    assignin('base','start_deg',20);
    assignin('base','y_ref',0.1);

    simOut1 = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    mat_x = simOut1.x_vec(1,:).Data;
    t_vec = simOut1.tout;
    vec_xM = mat_x(:,3);
    plot(t_vec,vec_xM)
    hold on
    
    simOut2 = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    mat_x = simOut2.x_vec(1,:).Data;
    t_vec = simOut2.tout;
    vec_xM = mat_x(:,3);
    plot(t_vec,vec_xM)
    hold on

    simOut3 = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    mat_x = simOut3.x_vec(1,:).Data;
    t_vec = simOut3.tout;
    vec_xM = mat_x(:,3);
    plot(t_vec,vec_xM)
    hold off

    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Position $x_M$ [m]','interpreter','latex')
    legend('Einfacher Regler','Vorsteuerung','I-Regler')
    grid on

    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./9. Reglervalidierung/8. Vergleich_linear/', 'linear_vergleich_xM.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end