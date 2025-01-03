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
pdepoly([ -1.1536964980544748,...
 -1.0642023346303504,...
 -1.1964980544747084,...
 -0.97859922178988334,...
 -1.2626459143968873,...
 -1.029182879377432,...
 -1.313229571984436,...
 -0.86186770428015591,...
 -1.0758754863813231,...
 -1.068093385214008,...
 -0.51167315175097294,...
 -0.80739299610894943,...
 -0.80350194552529186,...
 -0.24319066147859947,...
 -0.14980544747081725,...
 -0.0058365758754865826,...
 -0.23151750972762675,...
 0.040856031128404968,...
 -0.22762645914396917,...
 -0.49221789883268507,...
 -0.41439688715953316,...
 -0.53501945525291839,...
 -0.64007782101167332,...
 -0.7684824902723737,...
 -0.88521400778210135,...
 -1.0758754863813231,...
],...
[ -0.79571984435797605,...
 -0.75680933852140075,...
 -0.67509727626459171,...
 -0.51945525291828787,...
 -0.33268482490272389,...
 -0.26653696498054491,...
 -0.060311284046692615,...
 -0.052529182879377467,...
 0.21206225680933843,...
 0.20428015564202329,...
 -0.048638132295719894,...
 0.33268482490272366,...
 0.33268482490272366,...
 -0.16926070038910512,...
 -0.0019455252918290089,...
 -0.34435797665369661,...
 -0.36770428015564205,...
 -0.57392996108949434,...
 -0.72178988326848259,...
 -0.63618677042801552,...
 -0.77626459143968862,...
 -0.78793774319066179,...
 -0.72178988326848259,...
 -0.81128404669260723,...
 -0.75291828793774318,...
 -0.83463035019455267,...
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
