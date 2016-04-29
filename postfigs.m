function [] = postfigs( hfig, fmt)
% hfig: handle of fig
% format: fig format
if strcmpi(fmt, 'asce')
    % typical figure size 3.5in (336 pixels)
    set(hfig, 'Position', [100, 100, 355, 266])
    ax = get(hfig,'CurrentAxes');
    try
        % change label font
        xlb = get(ax, 'xlabel');
        set(xlb, 'fontsize', 8);
        set(xlb, 'Fontname', 'times new roman');
        ylb = get(ax, 'ylabel');
        set(ylb, 'fontsize', 8);
        set(ylb, 'Fontname', 'times new roman');   
        % change axis font
        set(ax,'fontsize',8);
        set(ax,'fontname','times new roman');
        % change legend font
        lgd = legend(ax);
        set(lgd, 'fontsize', 8);
        set(lgd, 'fontname', 'times new roman');
        % change annotation font
        % get the handle of the hidden annotation axes
        hAnnotAxes = findall(hfig,'Tag','scribeOverlay');
        % get its children handles
        if ~isempty(hAnnotAxes)
            hAnnotChildren = get(hAnnotAxes,'Children');
            for i = 1:length(hAnnotChildren)
                ha = hAnnotChildren(i);
                set(ha, 'fontsize', 8)
                set(ha, 'fontname', 'times new roman')
                set(ha, 'headlength', 6)
                set(ha, 'headwidth', 6)
            end
        end
    catch
        disp 'no xaxis';
    end
    % save figures
end
name = input('figure name:?', 's');
set(hfig, 'paperpositionmode', 'auto');
savefig(hfig, strcat('./fig/', name))
print(strcat('./fig/', name),'-depsc')
end

