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
global p x y
p = [];
%Agregar todos los valores existentes de x e y al listbox
n = length(x);
if n > 0
    for a=1:n
        %Agregar elementos al listbox
        parXY = string(x(a)) + "-" + string(y(a));
        contenidoListbox = get(handles.listbox2,'string');
        longitudListbox = length(contenidoListbox);
        contenidoListbox{longitudListbox + 1} = parXY;
        set(handles.listbox2, 'String', contenidoListbox);
    end
end



function varargout = IngresoDatos_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function buttonIngresarDatos_Callback(hObject, eventdata, handles)
global x y i
n = length(x);
encontrado = false;
for a=1:n
    if x(a)== str2double(get(handles.editX, 'String'))
        encontrado = true;
    end
end

if encontrado
    warndlg("La X ya fue ingresada anteriormente.", "Advertencia");
else
    x(i) = str2double(get(handles.editX, 'String'));
    y(i) = str2double(get(handles.editY, 'String'));

    %Agregar elementos al listbox
    parXY = string(x(i)) + "-" + string(y(i));
    contenidoListbox = get(handles.listbox2,'string');
    longitudListbox = length(contenidoListbox);
    contenidoListbox{longitudListbox + 1} = parXY;
    set(handles.listbox2, 'String', contenidoListbox);

    i = i + 1;
end



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


function buttonVolver_Callback(hObject, eventdata, handles)
menuIG;
close(handles.figure1);


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


% --- Executes on button press in buttonAlterar.
function buttonAlterar_Callback(hObject, eventdata, handles)
global x y
listaDeObjetos = get(handles.listbox2, 'String');
if not(isempty(listaDeObjetos))
    valorSeleccionado = string(listaDeObjetos(get(handles.listbox2, 'Value')));
    valorSpliteado = split(valorSeleccionado, '-');
    valorX = string(valorSpliteado(1));
    valorY = string(valorSpliteado(2));
    %Valido que no haya repetidos
    encontrado = false;
    n = length(x);
    for a=1:n
        if x(a)== str2double(get(handles.editX, 'String'))
            encontrado = true;
        end
    end

    if encontrado
        warndlg("La X ya fue ingresada anteriormente.", "Advertencia");
    else
    %Modificar elemento del array
        n = length(x);
        for a=1:n
            if string(x(a)) == valorX && string(y(a)) == valorY
                x(a) = str2double(get(handles.editX, 'String'));
                y(a) = str2double(get(handles.editY, 'String'));
                break
            end
        end
        %Modificar elemento del listbox
        valorSeleccionado = get(handles.listbox2, 'Value');
        parXY = get(handles.editX, 'String') + "-" + get(handles.editY, 'String');
        listaDeObjetos{valorSeleccionado} = parXY;
        set(handles.listbox2, 'String', listaDeObjetos, 'Value', 1);
    end
else
    warndlg("La lista se encuentra vacía.", "Advertencia");
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
