function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[1 1 1]);
set(ax,'PlotBoxAspectRatio',[3 2 1]);
set(ax,'XLim',[-1.5 1.5]);
set(ax,'YLim',[-1 1]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');

% Geometry description:
pdepoly([ 0.001945525291829231,...
 -0.50000000000000022,...
 -1.2548638132295722,...
 -0.65953307392996119,...
 -0.63618677042801575,...
 -0.07587548638132291,...
 0.33657587548638102,...
 0.60505836575875449,...
 1.1887159533073923,...
 0.39105058365758705,...
],...
[ 0.81906614785992282,...
 0.19649805447470814,...
 0.16147859922178975,...
 -0.30544747081712065,...
 -0.83852140077821025,...
 -0.32490272373540874,...
 -0.78015564202334664,...
 -0.27042801556420248,...
 -0.033073929961089599,...
 0.23540856031128388,...
],...
 'P1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','P1')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'0.0',...
'10.0',...
'1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0 ';...
'0.0 ';...
'10.0';...
'1.0 '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','1000','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');