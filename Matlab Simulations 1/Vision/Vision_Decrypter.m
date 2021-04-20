function varargout = Vision_Decrypter(varargin)
% VISION_DECRYPTER MATLAB code for Vision_Decrypter.fig
%      VISION_DECRYPTER, by itself, creates a new VISION_DECRYPTER or raises the existing
%      singleton*.
%
%      H = VISION_DECRYPTER returns the handle to a new VISION_DECRYPTER or the handle to
%      the existing singleton*.
%
%      VISION_DECRYPTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISION_DECRYPTER.M with the given input arguments.
%
%      VISION_DECRYPTER('Property','Value',...) creates a new VISION_DECRYPTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Vision_Decrypter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Vision_Decrypter_OpeningFcn via varargin.
% 
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Vision_Decrypter

% Last Modified by GUIDE v2.5 27-May-2018 00:53:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Vision_Decrypter_OpeningFcn, ...
    'gui_OutputFcn',  @Vision_Decrypter_OutputFcn, ...
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


% --- Executes just before Vision_Decrypter is made visible.
function Vision_Decrypter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Vision_Decrypter (see VARARGIN)

% Choose default command line output for Vision_Decrypter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Vision_Decrypter wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);    %Tirar axis
axis off
axes(handles.axes2);    %Tirar axis
axis off

% --- Outputs from this function are returned to the command line.
function varargout = Vision_Decrypter_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
% handles    structure with handles and user data (see GUIDATA)
[flnm,flpth,oCheck] = uigetfile('*.png');

assignin('base','flnm',flnm');
assignin('base','flpth',flpth);
assignin('base','oCheck',oCheck);

x=imread('decode.png');%Ler com codigo

axes(handles.axes1);
x=imread('decode.png');%Ler com codigo
imshow(x);

axes(handles.axes2);
y=imread(flnm);   %Ler sem codigo
set(handles.text6,'String',flnm)
imshow(y)

x=uint16(x);    %16 bit
y=uint16(y);    %16 bit

[x_row, x_col]=size(x);

b=0;k=1;
%Decode
for i=1:x_row
    for j=1:x_col
        if(x(i,j)>=y(i,j))
            a=x(i,j)-y(i,j);
        else
            a=256+x(i,j)-y(i,j);
        end
        
        if(a~=0)
            z(k)=uint8(a);
            k=k+1;
        else
            b=1;
            break;
        end
    end
    if(b==1)
        break;
    end
end

file=fopen('decrypted.txt','w'); %Criar Ficheiro
finalstr = "";
for i=1:k-1
    a = char(file,'%c',z(i)) %Escrever no fcheiro
    if a(3) == ' '
        finalstr = strcat(finalstr," ")  
    else
        finalstr = strcat(finalstr,a(3))
    end
end
strcat(finalstr,[newline newline newline newline 'Traduzido pelo programa "Decode" de Marcos Mendes' newline 'Esta descodificação foi feita em Matlab']);
set(handles.text2,'String',finalstr)
