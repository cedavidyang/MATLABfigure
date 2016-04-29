function printpdf(h, name)

set(h,'units',get(h,'paperunits'));
temp = get( h, 'position' );
% set(h,'paperposition',get(h,'position'));
set(h,'paperposition',[0 0 temp(3:4)]);
% temp=get(h, 'paperposition');
set(h, 'papersize', temp(3:4));
% saveas(h, name, 'pdf');
print(h, '-dpng', '-r800', name);

return
end