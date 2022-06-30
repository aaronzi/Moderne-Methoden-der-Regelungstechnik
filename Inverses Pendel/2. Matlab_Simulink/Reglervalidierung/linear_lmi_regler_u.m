function linear_lmi_regler_u()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    legendString = strings(10,1);
    for i=1:10
        assignin('base','start_deg',i*2.7);
        simOut = sim('LMI_linear.slx','StartTime','0','StopTime','4','FixedStep','1/1e4');
        u = simOut.u.Data;
        t_vec = simOut.tout;
        plot(t_vec,u)
        hold on
        legendString(i) = sprintf('%.1f°',i*2.7);
    end
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Eingangskraft u [N]','interpreter','latex')
    legend(legendString)
    grid on
    hold off
    filename = fullfile('./Reglervalidierung/', 'linear_lmi_regler_u.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end