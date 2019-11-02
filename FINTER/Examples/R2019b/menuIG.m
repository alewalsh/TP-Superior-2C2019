function varargout = menuIG(varargin)

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menuIG_OpeningFcn, ...
                   'gui_OutputFcn',  @menuIG_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before menuIG is made visible.
function menuIG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menuIG (see VARARGIN)

% Choose default command line output for menuIG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global i j x y t p e

% UIWAIT makes menuIG wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = menuIG_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ingresarDatos.
function ingresarDatos_Callback(hObject, eventdata, handles)
% hObject    handle to ingresarDatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IngresoDatos;
close(handles.figure1);


% --- Executes on button press in mostrarDatos.
function mostrarDatos_Callback(hObject, eventdata, handles)
% hObject    handle to mostrarDatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in especializarK.
function especializarK_Callback(hObject, eventdata, handles)
% hObject    handle to especializarK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
especializarK;
close(handles.figure1);

% --- Executes on button press in alterarValores.
function alterarValores_Callback(hObject, eventdata, handles)
% hObject    handle to alterarValores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reiniciar.
function reiniciar_Callback(hObject, eventdata, handles)
global i j x y t p
x = 1;
y = 1;
t = 1;
p = 1;
i = 1;
j = 1;

%initialize_gui(gcbf, handles, true);

% hObject    handle to reiniciar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
