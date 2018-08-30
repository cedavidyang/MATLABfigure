function [] = postfigs( hfig, figsize, issave, ftsize)
% hfig: handle of fig
% format: fig format
if strcmpi(num2str(figsize), 'asce')
    % typical figure size 3.5in (336 pixels)
    set(hfig, 'Units', 'pixels')
    set(hfig, 'Position', [100, 100, 336, 336*0.75])
elseif length(figsize) == 1
%     set(hfig, 'Position', [100, 100, figsize, figsize*0.75])
    set(hfig, 'Units', 'inches')
    set(hfig, 'Position', [2, 2, figsize, figsize*0.75])
elseif length(figsize) == 2
    set(hfig, 'Units', 'inches')
    set(hfig, 'Position', [2, 2, figsize(1), figsize(2)])    
end
get(hfig,'CurrentAxes');   % not sure whether the first "get" give a diffent value
ax = get(hfig,'CurrentAxes');
% change axis font
set(ax,'fontsize',ftsize);
set(ax,'fontname','Arial');
% change label font
try
    xlb = get(ax, 'xlabel');
    set(xlb, 'fontsize', ftsize, 'Fontname', 'Arial');
catch
    disp 'no xlabel';
end
try
    ylb = get(ax, 'ylabel');
    set(ylb, 'fontsize', ftsize, 'Fontname', 'Arial');
catch
    disp 'no ylabel';
end
% change legend font
lgd = legend(ax);
try
    set(lgd, 'fontsize', ftsize, 'fontname', 'Arial');
catch
    disp 'no legend';
end
% get the handle of the hidden annotation axes
hAnnotAxes = findall(hfig,'Tag','scribeOverlay');
try
    hAnnotChildren = get(hAnnotAxes,'Children');
    for i = 1:length(hAnnotChildren)
        ha = hAnnotChildren(i);
        set(ha, 'fontsize', ftsize)
        set(ha, 'fontname', 'Arial')
        set(ha, 'headlength', 6)
        set(ha, 'headwidth', 6)
    end
catch
    disp 'no annotation';
end

if issave == true
    % save figures
    name = input('figure name:?', 's');
    set(hfig, 'paperpositionmode', 'auto');
    savefig(hfig, strcat('./fig/', name))
    print(strcat('./fig/', name),'-depsc')
end

end

