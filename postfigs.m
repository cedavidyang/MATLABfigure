function [] = postfigs( hfig, fmt)
% hfig: handle of fig
% format: fig format
if strcmpi(fmt, 'asce')
    % typical figure size 3.5in (336 pixels)
    set(hfig, 'Position', [100, 100, 355, 266])
    ax = get(hfig,'CurrentAxes');       
    % change axis font
    set(ax,'fontsize',10);
    set(ax,'fontname','times new roman');
    % change label font
    try
        xlb = get(ax, 'xlabel');
        set(xlb, 'fontsize', 10, 'Fontname', 'times new roman');
    catch
        disp 'no xlabel';
    end    
    try
        ylb = get(ax, 'ylabel');
        set(ylb, 'fontsize', 10, 'Fontname', 'times new roman');
    catch
        disp 'no ylabel';
    end     
    % change legend font
    lgd = legend(ax);
    try
        set(lgd, 'fontsize', 10, 'fontname', 'times new roman');
    catch
        disp 'no legend';
    end
    % get the handle of the hidden annotation axes
    hAnnotAxes = findall(hfig,'Tag','scribeOverlay');
    try
        hAnnotChildren = get(hAnnotAxes,'Children');
        for i = 1:length(hAnnotChildren)
                ha = hAnnotChildren(i);
                set(ha, 'fontsize', 10)
                set(ha, 'fontname', 'times new roman')
                set(ha, 'headlength', 6)
                set(ha, 'headwidth', 6)
        end
    catch
        disp 'no annotation';
    end

end
% save figures
name = input('figure name:?', 's');
set(hfig, 'paperpositionmode', 'auto');
savefig(hfig, strcat('./fig/', name))
print(strcat('./fig/', name),'-depsc')
end

