function varargout = Vision_Encrypter(varargin)
% VISION_ENCRYPTER MATLAB code for Vision_Encrypter.fig
%      VISION_ENCRYPTER, by itself, creates a new VISION_ENCRYPTER or raises the existing
%      singleton*.
%
%      H = VISION_ENCRYPTER returns the handle to a new VISION_ENCRYPTER or the handle to
%      the existing singleton*.
%
%      VISION_ENCRYPTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISION_ENCRYPTER.M with the given input arguments.
%
%      VISION_ENCRYPTER('Property','Value',...) creates a new VISION_ENCRYPTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Vision_Encrypter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Vision_Encrypter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Vision_Encrypter

% Last Modified by GUIDE v2.5 26-May-2018 23:58:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Vision_Encrypter_OpeningFcn, ...
                   'gui_OutputFcn',  @Vision_Encrypter_OutputFcn, ...
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


% --- Executes just before Vision_Encrypter is made visible.
function Vision_Encrypter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Vision_Encrypter (see VARARGIN)

% Choose default command line output for Vision_Encrypter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Vision_Encrypter wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);    %mostrar
axis off
axes(handles.axes2);    %mostrar
axis off


% --- Outputs from this function are returned to the command line.
function varargout = Vision_Encrypter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
[flnm,flpth,oCheck] = uigetfile('*.png');

assignin('base','flnm',flnm');
assignin('base','flpth',flpth);
assignin('base','oCheck',oCheck);

Str = char(get(handles.edit1,'String')); %Ler
Str=uint16(Str);    %Converter para 16 bit numere

normal=imread(flnm);   %Imagem a encriptar

axes(handles.axes1);    %mostrar
imshow(normal);         %imagem

normal=uint16(normal);                %converter para 16 bit
[x_row,x_col]=size(normal);

c=numel(Str);   %contar os caracteres do ficheiro a encriptar
a=1;

delete decode.png; 

%Encriptar
for i=1:x_row %garantir que todos se encontra dentro da imagem
    for j=1:x_col
        if(a<=c)  
            if(normal(i,j)+Str(a)>255)
                temp=normal(i,j)+Str(a)-256;
            else
                temp=normal(i,j)+Str(a);
            end
            z(i,j)=uint8(temp);
        else
            z(i,j)=uint8(normal(i,j));
        end
        a=a+1;
    end
end

imwrite(z,'decode.png');     %Guardar a imagem com o código

axes(handles.axes2);
imshow(imread('decode.png'));
