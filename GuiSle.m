function varargout = GuiSle(varargin)


% Last Modified by GUIDE v2.5 08-May-2019 17:28:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiSle_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiSle_OutputFcn, ...
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

%make global array for equations.
function setGlobalArr(arr)
global eq
eq = arr;

function arr = getGlobalArr
global eq
arr = eq;

function setGlobalTemp(rr)
global Rtemp
Rtemp = rr;

function rr = getGlobalTemp
global Rtemp
rr = Rtemp;

%make global array for equations.
function setGlobalInit(ins)
global ing
ing = ins;

function ins = getGlobalInit
global ing
ins = ing;

%make global array for variables
function setGlobalArrVars(arrVar)
global vars
vars = arrVar;

function arrVars = getGlobalArrVars
global vars
arrVars = vars;

function counter = getGlobalCounter
global co
counter = co;

function setGlobalCounter(counter)
global co
co = counter;

% --- Executes just before GuiSle is made visible.
function GuiSle_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiSle (see VARARGIN)

% Choose default command line output for GuiSle
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


set(handles.initg, 'enable', 'off');
set(handles.setInit, 'enable', 'off');
set(handles.nomIt, 'enable', 'off');
set(handles.eps, 'enable', 'off');
setGlobalArr({});
setGlobalArrVars({});
setGlobalInit([]);
setGlobalCounter(1);
set(handles.table,'ColumnWidth',{100});

% UIWAIT makes GuiSle wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiSle_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in MethodChooser.
function MethodChooser_Callback(hObject, eventdata, handles)
 contents = cellstr(get(handles.MethodChooser,'String'));
 choosen = contents{get(handles.MethodChooser,'Value')};
 if strcmp(choosen, 'Gauss-Seidel')
        set(handles.initg, 'enable', 'on');
        set(handles.setInit, 'enable', 'on');
        set(handles.nomIt, 'enable', 'on');
        set(handles.eps, 'enable', 'on');
 else
        set(handles.initg, 'enable', 'off');
        set(handles.setInit, 'enable', 'off');
        set(handles.nomIt, 'enable', 'off');
        set(handles.eps, 'enable', 'off');
 end
 

% --- Executes during object creation, after setting all properties.
function MethodChooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MethodChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eqn_Callback(hObject, eventdata, handles)
% hObject    handle to eqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eqn as text
%        str2double(get(hObject,'String')) returns contents of eqn as a double


% --- Executes during object creation, after setting all properties.
function eqn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AddEqn.
function AddEqn_Callback(hObject, eventdata, handles)
% hObject    handle to AddEqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 choosen = get(handles.eqn, 'String')
 if isempty(choosen)
     msgbox('Equation is Empty', 'Error','error');
     return;
 end
 arr = getGlobalArr;
 arr{end+1} = choosen;
 setGlobalArr(arr);
 getVar(choosen);
 set(handles.eqBox,'str', getGlobalArr); 
 getGlobalArr
 getGlobalArrVars
 
 set(handles.table,'data',getGlobalArrVars);
 
 



function initg_Callback(hObject, eventdata, handles)
% hObject    handle to initg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initg as text
%        str2double(get(hObject,'String')) returns contents of initg as a double


% --- Executes during object creation, after setting all properties.
function initg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setInit.
function setInit_Callback(hObject, eventdata, handles)
% hObject    handle to setInit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get the initial guess
     init = get(handles.initg, 'String');
     if isempty(init)
     msgbox('Intial guess is empty', 'Error','error');
     return
     end
     rr = getGlobalTemp;
     cu = getGlobalCounter;
     if cu > length(getGlobalArr)
         msgbox('End of Variable', 'Error','error');
         return;
     end
     temp = strcat(rr{1 , cu} ,' =  ');
     temp = strcat(temp, init);
     rr{1 , cu}  = temp;
     set(handles.table,'data',rr);
     init =  str2double(init);
     initg = getGlobalInit;
     initg = [initg; init]
     setGlobalInit(initg);
     setGlobalCounter(cu + 1);
     setGlobalTemp(rr);
    
     



function nomIt_Callback(hObject, eventdata, handles)
% hObject    handle to nomIt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nomIt as text
%        str2double(get(hObject,'String')) returns contents of nomIt as a double


% --- Executes during object creation, after setting all properties.
function nomIt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nomIt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%get the variables from the equations 
%add them to array
%sort them alphapetic
function arr = getVar(str)
            i = 1;
            n = length(str);
            arrVars = getGlobalArrVars;
            while (i <= n)
                s =  '';
               if isletter(str(i))
                   while (i <= n)
                      if isletter(str(i))
                          s = strcat(s,str(i));
                          i = i+1;
                          continue;
                      end
                      if  ~isnan(str2double(str(i)))
                          s = strcat(s,str(i));
                          i = i+1;
                          continue;
                      end
                      if str(i) == ' '
                         s = strcat(s,str(i));
                         i = i+1;
                         continue;
                      else
                         break;
                      end
                      
                   end
                   arrVars{end+1} = s;
               end
               i = i+1;
            end
            arrVars =unique(sort(arrVars));
            setGlobalArrVars(arrVars);
            setGlobalTemp(arrVars);
            
 


function eps_Callback(hObject, eventdata, handles)
% hObject    handle to eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps as text
%        str2double(get(hObject,'String')) returns contents of eps as a double


% --- Executes during object creation, after setting all properties.
function eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in solve.
function solve_Callback(hObject, eventdata, handles)
contents = cellstr(get(handles.MethodChooser,'String'));
choosen = contents{get(handles.MethodChooser,'Value')};
if strcmp(choosen, 'Gauss-Jordan')
    obj = GuassJordan();
    obj.eqns = getGlobalArr;
    obj.solve;
    obj.b
    WriteFile(obj,4);
    setappdata(0,'roots',obj.b);
    setappdata(0,'coff',obj.a);
    setappdata(0,'cons',obj.b);
end
if strcmp(choosen, 'Gauss')
    obj = Gauss();
    obj.eqns = getGlobalArr;
    obj.n = size(getGlobalArr);
    obj.solve;
    obj.x
    WriteFile(obj,3);
    setappdata(0,'roots',obj.x);
    setappdata(0,'coff',obj.a);
    setappdata(0,'cons',obj.b);
   
end
if strcmp(choosen, 'LU')
    obj = LU();
    obj.eqns = getGlobalArr;
    obj.getLU;
    obj.ans;
    
    setappdata(0,'L',obj.L);
    setappdata(0,'U',obj.U);
    setappdata(0,'cons',obj.d);
    setappdata(0,'roots',obj.ans);
    
    WriteFile(obj,1);
    
end
if strcmp(choosen, 'Gauss-Seidel')
    
     %get number of Iterations
     nomIT = get(handles.nomIt, 'String');
         if isempty(nomIT)
         nomIT = 50;
         else
         nomIT = str2double(nomIT);
         end
     epsilon = get(handles.eps, 'String');
         if isempty(epsilon)
            epsilon = 0.00001;
         else
           epsilon = str2double(epsilon);
         end

      objec = GaussSeidel(getGlobalArr, nomIT, epsilon);
      objec.calc(getGlobalInit);
      objec.data
      objec.roots
      WriteFile(objec,2);
      setappdata(0,'data',objec.data);
      
    obj = GuassJordan();
    obj.eqns = getGlobalArr;
    obj.solve;
    obj.b;
    setappdata(0,'jordan',obj.b);
    
    obj = Gauss();
    obj.eqns = getGlobalArr;
    obj.n = size(getGlobalArr);
    obj.solve;
    obj.x;
    setappdata(0,'gauss',obj.x);
    
    obj = LU();
    obj.eqns = getGlobalArr;
    obj.getLU;
    obj.ans;
    setappdata(0,'lu',obj.ans);
    
end

setappdata(0,'variables',getGlobalArrVars);

setappdata(0,'method',choosen);
resultsp2;



% --- Executes on selection change in eqBox.
function eqBox_Callback(hObject, eventdata, handles)
% hObject    handle to eqBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns eqBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from eqBox


% --- Executes during object creation, after setting all properties.
function eqBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eqBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fileChooser.
function fileChooser_Callback(hObject, eventdata, handles)
% hObject    handle to fileChooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [file,path] = uigetfile
    s = strcat(path , file);
    file = FileReader;
    file.read(s);
    
   
    set(handles.equation, 'String', file.fun);
%     set(handles.menue, 'String', file.method);
    set(handles.menue, 'Value', file.methodnum);
    menue_Callback(handles.menue, eventdata, handles)
%    set(handles.menue,'Value', file.method)
    set(handles.lower, 'String', file.lower);
    set(handles.upper, 'String', file.upper);
    set(handles.eps, 'String', file.eps);
    set(handles.NomIt, 'String', file.NomIt);
    set(handles.initial, 'String', file.init);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
set(handles.initg, 'enable', 'off');
set(handles.setInit, 'enable', 'off');
set(handles.nomIt, 'enable', 'off');
set(handles.eps, 'enable', 'off');
setGlobalArr({});
setGlobalArrVars({});
setGlobalInit([]);
setGlobalCounter(1);
set(handles.table,'ColumnWidth',{100});
 set(handles.eqBox,'str', ''); 
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
