function varargout = start(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start_OpeningFcn, ...
                   'gui_OutputFcn',  @start_OutputFcn, ...
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


% --- Executes just before start is made visible.
function start_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

axes(handles.logo)
handles.imagen=imread('FINTER.png');
imagesc(handles.imagen)
axis off

% --- Outputs from this function are returned to the command line.
function varargout = start_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in comenzar.
function comenzar_Callback(hObject, eventdata, handles)
global i j x y t p e
x = [];
y = [];
p = [];
t = 1;
i = 1;
j = 1;
e = false;
menuIG;
close(handles.figure1);

% --- Executes during object creation, after setting all properties.
function logo_CreateFcn(hObject, eventdata, handles)
