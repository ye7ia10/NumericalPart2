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

% Last Modified by GUIDE v2.5 08-May-2019 13:10:33

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
