function linear_ackermann_u()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    h = figure;
    for i=1:10
        assignin('base','start_deg',i*2.7);
        simOut = sim('Zustandsregelung_mit_Ackermann_linear','StartTime','0','StopTime','4','FixedStep','1/1e4');
        u = simOut.u.Data;
        t_vec = simOut.tout;
        plot(t_vec,u)
        hold on
    end
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Eingangskraft u [N]','interpreter','latex')
    grid on
    hold off
    set(h,'Units','Inches');
    pos = get(h,'Position');
    set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
    print(h,'Reglervalidierung/linear_ackermann_xM','-dpdf','-r0')
    disp('Successfully created PDF')
end