function linear_lmi_regler_xM()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    legendString = strings(10,1);
    for i=1:10
        assignin('base','start_deg',i*2.7);
        simOut = sim('LMI_linear.slx','StartTime','0','StopTime','4','FixedStep','1/1e4');
        mat_x = simOut.x_vec(1,:).Data;
        vec_xM = mat_x(:,3);
        t_vec = simOut.tout;
        plot(t_vec,vec_xM)
        hold on
        legendString(i) = sprintf('%.1f°',i*2.7);
    end
    xlabel('Zeit t [s]','interpreter','latex')
    ylabel('Position $x_M$ [m]','interpreter','latex')
    legend(legendString)
    grid on
    hold off
    filename = fullfile('./9. Reglervalidierung/PDF/', 'linear_lmi_regler_xM.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end