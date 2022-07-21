function linear_lmi_i_regler_u()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    for i=1:5
        y_vec = [0.1 0.25 0.5 0.75 0.9];
        assignin('base','y_ref',y_vec(i));
        subplot(5,1,i)
        legendString = strings(6,1);
        for j=1:6
            assignin('base','start_deg',j*4);
            simOut = sim('Regelung_mit_Beobachter_linear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
            u = simOut.u.Data;
            t_vec = simOut.tout;
            plot(t_vec,u)
            hold on
            legendString(j) = sprintf('%.1f°',j*4);
        end
        xlabel('Zeit t [s]','interpreter','latex')
        ylabel('Eingangskraft u [N]','interpreter','latex')
        titleString = sprintf('y_{ref} = %1.2f',y_vec(i));
        title(titleString)
        legend(legendString)
        grid on
        hold off
    end
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos+[0 -500 0 500])
    filename = fullfile('./9. Reglervalidierung/10. Beobachter/', 'linear_lmi_i_regler_u.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end