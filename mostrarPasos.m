function varargout = mostrarPasos(varargin)
% MOSTRARPASOS MATLAB code for mostrarPasos.fig
%      MOSTRARPASOS, by itself, creates a new MOSTRARPASOS or raises the existing
%      singleton*.
%
%      H = MOSTRARPASOS returns the handle to a new MOSTRARPASOS or the handle to
%      the existing singleton*.
%
%      MOSTRARPASOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOSTRARPASOS.M with the given input arguments.
%
%      MOSTRARPASOS('Property','Value',...) creates a new MOSTRARPASOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mostrarPasos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mostrarPasos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mostrarPasos

% Last Modified by GUIDE v2.5 03-Nov-2019 17:35:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mostrarPasos_OpeningFcn, ...
                   'gui_OutputFcn',  @mostrarPasos_OutputFcn, ...
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


% --- Executes just before mostrarPasos is made visible.
function mostrarPasos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mostrarPasos (see VARARGIN)

% Choose default command line output for mostrarPasos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mostrarPasos wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global x p pasito coef;
texto=polynomialDegree(p);
set(handles.result,'String',texto);
if(sonPuntosEquiespaciados(x))
    texto1="Los puntos ingresados son equiespaciados";
    disp('Los puntos ingresados son equiespaciados');
else
    texto1="Los puntos ingresados NO son equiespaciados";
    disp('Los puntos ingresados NO son equiespaciados');
end
set(handles.equiespaciado,'String',texto1);
set(handles.pasos,'String',pasito);
set(handles.coeficientes,'String', coef);

texto2=strcat('P(x) =  ', char(p));
disp(strcat('P(x) = ', char(p)));
set(handles.polinomio,'String',texto2);

% --- Outputs from this function are returned to the command line.
function varargout = mostrarPasos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)
menuIG;
close(handles.figure1);

% hObject    handle to volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
