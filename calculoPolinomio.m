function varargout = calculoPolinomio(varargin)
% CALCULOPOLINOMIO MATLAB code for calculoPolinomio.fig
%      CALCULOPOLINOMIO, by itself, creates a new CALCULOPOLINOMIO or raises the existing
%      singleton*.
%
%      H = CALCULOPOLINOMIO returns the handle to a new CALCULOPOLINOMIO or the handle to
%      the existing singleton*.
%
%      CALCULOPOLINOMIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULOPOLINOMIO.M with the given input arguments.
%
%      CALCULOPOLINOMIO('Property','Value',...) creates a new CALCULOPOLINOMIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calculoPolinomio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calculoPolinomio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calculoPolinomio

% Last Modified by GUIDE v2.5 04-Nov-2019 19:05:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculoPolinomio_OpeningFcn, ...
                   'gui_OutputFcn',  @calculoPolinomio_OutputFcn, ...
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


% --- Executes just before calculoPolinomio is made visible.
function calculoPolinomio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calculoPolinomio (see VARARGIN)

% Choose default command line output for calculoPolinomio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calculoPolinomio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calculoPolinomio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonPolinomio.
function buttonPolinomio_Callback(hObject, eventdata, handles)
global x y e p
radioButtonSeleccionado = get(handles.uiGroupMetodo, 'SelectedObject');
valorSeleccionado = string(get(radioButtonSeleccionado, 'String'));
disp(valorSeleccionado);
switch valorSeleccionado
    case 'Lagrange'
        p = [];
        p = Lagrange(x,y,1);
        e = true;
    case 'N-G Progresivo'
        p = [];
        p = NGProgresivo(x,y,1);
        e = true;
    case 'N-G Regresivo'
        p = [];
        p = NGRegresivo(x,y,1);
        e = true;
end
texto2=strcat('P(x) =  ', char(p));
disp(strcat('P(x) = ', char(p)));
set(handles.polinomio,'String',texto2);

% --- Executes on button press in buttonVolver.
function buttonVolver_Callback(hObject, eventdata, handles)
menuIG;
close(handles.figure1);
