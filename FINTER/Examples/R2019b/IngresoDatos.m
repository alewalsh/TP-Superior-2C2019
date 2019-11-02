function varargout = IngresoDatos(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IngresoDatos_OpeningFcn, ...
                   'gui_OutputFcn',  @IngresoDatos_OutputFcn, ...
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


function IngresoDatos_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global i j x y t p e
x = 1;
y = 1;
t = 1;
p = 1;
i = 1;
j = 1;
e = false;


function varargout = IngresoDatos_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function buttonIngresarDatos_Callback(hObject, eventdata, handles)
global x y i j
x(i) = str2double(get(handles.editX, 'String'));
disp('El valor de x es: ');
%texto = string(get(handles.text4,'String')) + newline + string(x(i)); 
%set(handles.text4,'String', string(x(i)));
disp(x(i));
y(j) = str2double(get(handles.editY, 'String'));
disp('El valor de y es: ');
disp(y(j));
%lista = get(handles.listbox2,'String');
%nuevoParametro = string(x(i)) + "-" + string(y(j));
%listaConNuevoItem = strvcat(lista, nuevoParametro);
%set(handles.listbox2,'String',listaConNuevoItem);

%Agregar elementos al listbox
parXY = string(x(i)) + "-" + string(y(j));
contenidoListbox = get(handles.listbox2,'string');
longitudListbox = length(contenidoListbox);
contenidoListbox{longitudListbox + 1} = parXY;
set(handles.listbox2, 'String', contenidoListbox);

i = i + 1;
j = j + 1;

helpdlg('Datos ingresados correctamente.','Exito');


function editX_Callback(hObject, eventdata, handles)
handles.x = str2double(get(hObject, 'String'));

if isnan(handles.x)
    set(hObject, 'String', 0);
    errordlg('X debe ser un número!','Error');
end


function editX_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String',0);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editY_Callback(hObject, eventdata, handles)
y = str2double(get(hObject, 'String'));
if isnan(y)
    set(hObject, 'String', 0);
    errordlg('Y debe ser un número!','Error');
end


function editY_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String',0);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton5_Callback(hObject, eventdata, handles)
disp('---------------------------');
global x y e p
p = Lagrange(x,y,1);
e = true;
disp(strcat('P(x) = ', char(p)));
disp('---------------------------');
disp('El vector x es: ');
%texto = "";
texto = strcat('P(x) = ', char(p));
%for a=1:3
%    texto = texto + string(x(a)) + newline;    
%end
set(handles.text4,'String',texto);
%save variables x y e p

function listbox2_Callback(hObject, eventdata, handles)


function listbox2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function buttonBorrar_Callback(hObject, eventdata, handles)
%Quitar elementos al listbox
global x y
listaDeObjetos = get(handles.listbox2, 'String');
if not(isempty(listaDeObjetos))
    valorSeleccionado = string(listaDeObjetos(get(handles.listbox2, 'Value')));
    valorSpliteado = split(valorSeleccionado, '-');
    valorX = string(valorSpliteado(1));
    valorY = string(valorSpliteado(2));
    %Quitar elemento del array
    n = length(x);
    for a=1:n
        if string(x(a)) == valorX && string(y(a)) == valorY
            x(a) = [];
            y(a) = [];
            break
        end
    end
    %Quitar elemento del listbox
    valorSeleccionado = get(handles.listbox2, 'Value');
    listaDeObjetos(valorSeleccionado) = [];
    set(handles.listbox2, 'String', listaDeObjetos, 'Value', 1);
else
    warndlg("La lista se encuentra vacía.", "Advertencia");
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menuIG;
close(handles.figure1);
