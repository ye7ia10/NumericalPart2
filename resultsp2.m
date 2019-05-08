function varargout = resultsp2(varargin)
% RESULTSP2 MATLAB code for resultsp2.fig
%      RESULTSP2, by itself, creates a new RESULTSP2 or raises the existing
%      singleton*.
%
%      H = RESULTSP2 returns the handle to a new RESULTSP2 or the handle to
%      the existing singleton*.
%
%      RESULTSP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTSP2.M with the given input arguments.
%
%      RESULTSP2('Property','Value',...) creates a new RESULTSP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resultsp2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resultsp2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resultsp2

% Last Modified by GUIDE v2.5 08-May-2019 17:05:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resultsp2_OpeningFcn, ...
                   'gui_OutputFcn',  @resultsp2_OutputFcn, ...
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


% --- Executes just before resultsp2 is made visible.
function resultsp2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resultsp2 (see VARARGIN)

method = getappdata(0,'method');
set(handles.methname,'String',method);
set(handles.rootstable,'ColumnWidth',{100});
set(handles.coef,'ColumnWidth',{100});
set(handles.uitable4,'ColumnWidth',{100});
set(handles.const,'ColumnWidth',{100});
if (strcmp(method,'Gauss'))
    set(handles.rootstable,'ColumnName',getappdata(0,'variables'))
    roots = num2cell(getappdata(0,'roots'))
    set(handles.rootstable,'data',roots)
    coff = double(getappdata(0,'coff'))
    set(handles.coef,'data',coff)
    cons = double(getappdata(0,'cons'))
    set(handles.const,'data',cons)
end
if (strcmp(method,'Gauss-Seidel'))
    errorArr = {};
    i = 1;
    v = getappdata(0,'variables')
    set(handles.menu, 'string', v);
    set(handles.rootstable,'ColumnName',v);
    while i <= length(getappdata(0,'variables')) 
        v{1, i}
        errorArr{end+1} = strcat('e',v{1, i})
        i = i+1;
    end
    i = 1;
    while i <= length(errorArr)
        v{end+1} = errorArr{1, i};
        i = i +1;
    end
    set(handles.coef,'ColumnName',v);
    roots = getappdata(0,'data');
    roots = roots(length(roots),1:length(errorArr));
    set(handles.rootstable,'data',roots);
    set(handles.texxt,'string','Iterations');
    coff = double(getappdata(0,'data'));
    set(handles.coef,'data',coff)
    set(handles.const,'visible','off')
    set(handles.text5,'visible','off')
    set(handles.axes1,'visible','on')
     set(handles.menu,'visible','on')
      set(handles.nxt,'visible','on')
       set(handles.prev,'visible','on')
end
if (strcmp(method,'Gauss-Jordan'))
    set(handles.rootstable,'ColumnName',getappdata(0,'variables'))
    roots = double(getappdata(0,'roots'))'
    set(handles.rootstable,'data',roots)
    coff = double(getappdata(0,'coff'))
    set(handles.coef,'data',coff)
    cons = double(getappdata(0,'cons'))
    set(handles.const,'data',cons)
end
if (strcmp(method,'LU'))
    set(handles.rootstable,'ColumnName',getappdata(0,'variables'))
    roots = num2cell(getappdata(0,'roots')')
    set(handles.rootstable,'data',roots)
    L = double(getappdata(0,'L'))
    set(handles.coef,'data',L)
    set(handles.texxt,'string','L')
    U = double(getappdata(0,'U'))
    set(handles.const,'data',U)
    set(handles.text5,'string','U')
    cons = double(getappdata(0,'cons'))
    set(handles.uitable4,'data',cons)
    set(handles.text7,'string','Constants')
    set(handles.text7,'visible','on')
    set(handles.uitable4,'visible','on')
    set(handles.text5,'visible','on')
    set(handles.const,'visible','on')
end



% Choose default command line output for resultsp2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resultsp2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resultsp2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu


% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nxt.
function nxt_Callback(hObject, eventdata, handles)
% hObject    handle to nxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in prev.
function prev_Callback(hObject, eventdata, handles)
% hObject    handle to prev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
