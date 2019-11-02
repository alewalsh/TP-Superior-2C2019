function varargout = especializarK(varargin)
% ESPECIALIZARK MATLAB code for especializarK.fig
%      ESPECIALIZARK, by itself, creates a new ESPECIALIZARK or raises the existing
%      singleton*.
%
%      H = ESPECIALIZARK returns the handle to a new ESPECIALIZARK or the handle to
%      the existing singleton*.
%
%      ESPECIALIZARK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ESPECIALIZARK.M with the given input arguments.
%
%      ESPECIALIZARK('Property','Value',...) creates a new ESPECIALIZARK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before especializarK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to especializarK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help especializarK

% Last Modified by GUIDE v2.5 02-Nov-2019 04:39:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @especializarK_OpeningFcn, ...
                   'gui_OutputFcn',  @especializarK_OutputFcn, ...
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


% --- Executes just before especializarK is made visible.
function especializarK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to especializarK (see VARARGIN)

% Choose default command line output for especializarK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global i j x y t p e

texto=strcat('P(x) =  ', char(p));
disp(strcat('P(x) = ', char(p)));
set(handles.polinomio,'String',texto);

% UIWAIT makes especializarK wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = especializarK_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function laK_Callback(hObject, eventdata, handles)
% hObject    handle to laK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of laK as text
%        str2double(get(hObject,'String')) returns contents of laK as a double
k = str2double(get(hObject, 'String'));
if isnan(k)
    set(hObject, 'String', 0);
    errordlg('Debe ingresar un numero','Error');
end
handles.metricdata.k = k;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function laK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to laK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global e p t

if e
    k= handles.metricdata.k;
    disp(char(subs(p, t, k))); % subs sustituye la variable simbólica t en p por el valor k
    resultado = char(subs(p, t, k));
    set(handles.resultado, 'String', resultado);

else
    disp('Primero debe calcularse un polinomio');
end


% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)
% hObject    handle to volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menuIG;
close(handles.figure1);
