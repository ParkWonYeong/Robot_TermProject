function varargout = term1(varargin)
% TERM1 MATLAB code for term1.fig
%      TERM1, by itself, creates a new TERM1 or raises the existing
%      singleton*.
%
%      H = TERM1 returns the handle to a new TERM1 or the handle to
%      the existing singleton*.
%
%      TERM1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TERM1.M with the given input arguments.
%
%      TERM1('Property','Value',...) creates a new TERM1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before term1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to term1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help term1

% Last Modified by GUIDE v2.5 29-May-2022 12:00:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @term1_OpeningFcn, ...
                   'gui_OutputFcn',  @term1_OutputFcn, ...
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


% --- Executes just before term1 is made visible.
function term1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to term1 (see VARARGIN)

Termproject1(0,0,0,0,0,0)

% Run robotic toolkit(startup_rvc)
%try
    %startup_rvc;
%catch ME
    %errordlg('Robotic Toolkit is not exist.')
    %rethrow ME;
%end
% Choose default command line output for term1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes term1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = term1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    th1 = str2double(handles.angle1.String)*pi/180;
    th2 = str2double(handles.angle2.String)*pi/180;
    th3 = str2double(handles.angle3.String)*pi/180;
    th4 = str2double(handles.angle4.String)*pi/180;
    th5 = str2double(handles.angle5.String)*pi/180;
    th6 = str2double(handles.angle6.String)*pi/180;

    d2 = 0.6; a2 = 2; d3 = -0.3; d4 = 0.7;
    
    L(1) = Link([th1 0 0 -pi/2]);
    L(2) = Link([th2 d2 a2 0]);
    L(3) = Link([th3 d3 0 -pi/2]);
    L(4) = Link([th4 d4 0 pi/2]);
    L(5) = Link([th5 0 0 -pi/2]);
    L(6) = Link([th6 0 0 0]);
    
    robot = SerialLink(L);
    robot.name = 'Number1';
    th = [th1 th2 th3 th4 th5 th6];

    robot.plot(th);
    T = robot.fkine(th);

    %try
    %    set(handles.textRobotModel, 'String', 'Moving Joints');
    %    handles.robot.moveSync(th);
    %    set(handles.textRobotModel, 'String', 'Done.');
    %catch ME
    %    errordlg('Unable to Move Robot');
    %    set(handles.textRobotModel, 'String','Error');
    %end

    % Display the end effector position on the GUI
    handles.pos_X.String = num2str(T.t(1));
    handles.pos_Y.String = num2str(T.t(2));
    handles.pos_Z.String = num2str(T.t(3));
    

    % Display th1~th6 on the GUI
    set(handles.slider1,'Value',th1*180/pi);
    set(handles.slider2,'Value',th2*180/pi);
    set(handles.slider3,'Value',th3*180/pi);
    set(handles.slider4,'Value',th4*180/pi);
    set(handles.slider5,'Value',th5*180/pi);
    set(handles.slider6,'Value',th6*180/pi);

    axes(handles.axes1);
    robot.plot(th);
    handles.robot = robot;

    % Update handles structure
    guidata(hObject, handles);


function angle1_Callback(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle1 as text
%        str2double(get(hObject,'String')) returns contents of angle1 as a double


% --- Executes during object creation, after setting all properties.
function angle1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function angle2_Callback(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle2 as text
%        str2double(get(hObject,'String')) returns contents of angle2 as a double


% --- Executes during object creation, after setting all properties.
function angle2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle3_Callback(hObject, eventdata, handles)
% hObject    handle to angle3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle3 as text
%        str2double(get(hObject,'String')) returns contents of angle3 as a double


% --- Executes during object creation, after setting all properties.
function angle3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle4_Callback(hObject, eventdata, handles)
% hObject    handle to angle4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle4 as text
%        str2double(get(hObject,'String')) returns contents of angle4 as a double


% --- Executes during object creation, after setting all properties.
function angle4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle5_Callback(hObject, eventdata, handles)
% hObject    handle to angle5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle5 as text
%        str2double(get(hObject,'String')) returns contents of angle5 as a double


% --- Executes during object creation, after setting all properties.
function angle5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle6_Callback(hObject, eventdata, handles)
% hObject    handle to angle6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle6 as text
%        str2double(get(hObject,'String')) returns contents of angle6 as a double


% --- Executes during object creation, after setting all properties.
function angle6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
th1 = get(handles.slider1, 'Value');
th1 = th1* pi/180;
handles.th1 = th1;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    th2 = get(handles.slider2, 'Value');
    th2 = th2* pi/180;
    handles.th2 = th2;
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    th3 = get(handles.slider3, 'Value');
    th3 = th3* pi/180;
    handles.th3 = th3;
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    th4 = get(handles.slider4, 'Value');
    th4 = th4* pi/180;
    handles.th4 = th4;
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    th5 = get(handles.slider5, 'Value');
    th5 = th5* pi/180;
    handles.th5 = th5;
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    th6 = get(handles.slider6, 'Value');
    th6 = th6* pi/180;
    handles.th6 = th6;
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    th1 = get(handles.slider1, 'Value')*pi/180;
    th2 = get(handles.slider2, 'Value')*pi/180;
    th3 = get(handles.slider3, 'Value')*pi/180;
    th4 = get(handles.slider4, 'Value')*pi/180;
    th5 = get(handles.slider5, 'Value')*pi/180;
    th6 = get(handles.slider6, 'Value')*pi/180;

    d2 = 0.6; a2 = 2; d3 = -0.3; d4 = 0.7;
    
    L(1) = Link([th1 0 0 -pi/2]);
    L(2) = Link([th2 d2 a2 0]);
    L(3) = Link([th3 d3 0 -pi/2]);
    L(4) = Link([th4 d4 0 pi/2]);
    L(5) = Link([th5 0 0 -pi/2]);
    L(6) = Link([th6 0 0 0]);
    
    robot = SerialLink(L);
    robot.name = 'Number1';
    th = [th1 th2 th3 th4 th5 th6];

    robot.plot(th);
    T = robot.fkine(th);

    %try
    %    set(handles.textRobotModel, 'String', 'Moving Joints');
    %    handles.robot.moveSync(th);
    %    set(handles.textRobotModel, 'String', 'Done.');
    %catch ME
    %    errordlg('Unable to Move Robot');
    %    set(handles.textRobotModel, 'String','Error');
    %end
    
    

    % Display the end effector position on the GUI
    handles.pos_X.String = num2str(T.t(1));
    handles.pos_Y.String = num2str(T.t(2));
    handles.pos_Z.String = num2str(T.t(3));


    % Display th1~th6 on the GUI
    handles.angle1.String = num2str(th1*180/pi);
    handles.angle2.String = num2str(th2*180/pi);
    handles.angle3.String = num2str(th3*180/pi);
    handles.angle4.String = num2str(th4*180/pi);
    handles.angle5.String = num2str(th5*180/pi);
    handles.angle6.String = num2str(th6*180/pi);

    axes(handles.axes1);
    robot.plot(th);
    handles.robot = robot;

    % Update handles structure
    guidata(hObject, handles);



function pos_X_Callback(hObject, eventdata, handles)
% hObject    handle to pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_X as text
%        str2double(get(hObject,'String')) returns contents of pos_X as a double


% --- Executes during object creation, after setting all properties.
function pos_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_Y_Callback(hObject, eventdata, handles)
% hObject    handle to pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_Y as text
%        str2double(get(hObject,'String')) returns contents of pos_Y as a double


% --- Executes during object creation, after setting all properties.
function pos_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_Z as text
%        str2double(get(hObject,'String')) returns contents of pos_Z as a double


% --- Executes during object creation, after setting all properties.
function pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetBtn.
function resetBtn_Callback(hObject, eventdata, handles)
% hObject    handle to resetBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.angle1,'string',0);
set(handles.angle2,'string',0);
set(handles.angle3,'string',0);
set(handles.angle4,'string',0);
set(handles.angle5,'string',0);
set(handles.angle6,'string',0);

set(handles.slider1,'Value',0);
set(handles.slider2,'Value',0);
set(handles.slider3,'Value',0);
set(handles.slider4,'Value',0);
set(handles.slider5,'Value',0);
set(handles.slider6,'Value',0);

set(handles.pos_X,'string',2);
set(handles.pos_Y,'string',0.3);
set(handles.pos_Z,'string',-0.7);

set(handles.distance,'string',0);
set(handles.interval,'string',0);

set(handles.X_radioBtn,'Value',0);
set(handles.Y_radioBtn,'Value',0);
set(handles.Z_radioBtn,'Value',0);

set(handles.jointX,'string','Q1');
set(handles.jointY,'string','Q2');
set(handles.jointZ,'string','Q3');

Termproject1(0,0,0,0,0,0)



function distance_Callback(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distance as text
%        str2double(get(hObject,'String')) returns contents of distance as a double


% --- Executes during object creation, after setting all properties.
function distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interval_Callback(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interval as text
%        str2double(get(hObject,'String')) returns contents of interval as a double


% --- Executes during object creation, after setting all properties.
function interval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in X_radioBtn.
function X_radioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to X_radioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of X_radioBtn
if (get(handles.X_radioBtn, 'Value'))
    set(handles.Y_radioBtn, 'Value', 0)
    set(handles.Z_radioBtn, 'Value', 0)
end


% --- Executes on button press in Y_radioBtn.
function Y_radioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to Y_radioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Y_radioBtn
if (get(handles.Y_radioBtn, 'Value'))
    set(handles.X_radioBtn, 'Value', 0)
    set(handles.Z_radioBtn, 'Value', 0)
end



% --- Executes on button press in Z_radioBtn.
function Z_radioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to Z_radioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Z_radioBtn
if (get(handles.Z_radioBtn, 'Value'))
    set(handles.Y_radioBtn, 'Value', 0)
    set(handles.X_radioBtn, 'Value', 0)
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    distance = str2double(handles.distance.String);
    interval = str2double(handles.interval.String);

    if (get(handles.X_radioBtn, 'Value'))
        % X axis / jabcobian Lab 활용.
        d2 = 0.6; a2 = 2; d3 = -0.3; d4 = 0.7;
        th = [0 0 0 0 0 0];
        L(1) = Link([th(1) 0 0 -pi/2]);
        L(2) = Link([th(2) d2 a2 0]);
        L(3) = Link([th(3) d3 0 -pi/2]);
        L(4) = Link([th(4) d4 0 pi/2]);
        L(5) = Link([th(5) 0 0 -pi/2]);
        L(6) = Link([th(6) 0 0 0]);
        
        
        robot = SerialLink(L);
        robot.name = 'Number1';
        robot.plot(th)
        
        for i = 1:interval:distance
            J = robot.jacob0(th);
            Jp = J(1:3,1:3);
            dp = [0.01;0;0];    %% dp벡터
            dq = inv(Jp)*dp;    %% Jp와 dp이용해서 dq벡터 만들기
        
            % 경고 메시지 출력
            if det(inv(Jp)) < 100*eps
                warning('Reached a place CANNOT MOVE to the design structure.')
                errordlg('Unable to Move Robot!!');
                break
            end
            T = robot.fkine(th);
            % Display the end effector position on the GUI
            handles.pos_X.String = num2str(T.t(1));
            handles.pos_Y.String = num2str(T.t(2));
            handles.pos_Z.String = num2str(T.t(3));
            % Display joint angle th_x, th_y, th_z the GUI
            handles.jointX.String = num2str(dq(1));
            handles.jointY.String = num2str(dq(2));
            handles.jointZ.String = num2str(dq(3));

            
            % Display joint angle1~6
            handles.angle1.String = num2str(th(1));
            handles.angle2.String = num2str(th(2));
            handles.angle3.String = num2str(th(3));
            handles.angle4.String = num2str(th(4));
            handles.angle5.String = num2str(th(5));
            handles.angle6.String = num2str(th(6));
            q = th;             %% dq 이용해서 새로운 q(각도) 만들기
            q(1:3) = q(1:3) + dq';
            th=q;
            robot.plot(q)       %% q 이용해서 robot plot
            getframe(gcf);
        end

    elseif (get(handles.Y_radioBtn, 'Value'))
        % Y axis / jabcobian Lab 활용.
        d2 = 0.6; a2 = 2; d3 = -0.3; d4 = 0.7;
        th = [0 0 0 0 0 0];
        L(1) = Link([th(1) 0 0 -pi/2]);
        L(2) = Link([th(2) d2 a2 0]);
        L(3) = Link([th(3) d3 0 -pi/2]);
        L(4) = Link([th(4) d4 0 pi/2]);
        L(5) = Link([th(5) 0 0 -pi/2]);
        L(6) = Link([th(6) 0 0 0]);
        
        robot = SerialLink(L);
        robot.name = 'Number1';
        robot.plot(th)
        
        for i = 1:interval:distance
            J = robot.jacob0(th);
            Jp = J(1:3,1:3);
            dp = [0;0.01;0];    %% dp벡터
            dq = inv(Jp)*dp;    %% Jp와 dp이용해서 dq벡터 만들기
        
            % 경고 메시지 출력
            if det(inv(Jp)) < 100*eps
                warning('Reached a place CANNOT MOVE to the design structure.')
                errordlg('Unable to Move Robot!!');
                break
            end
            T = robot.fkine(th);
            % Display the end effector position on the GUI
            handles.pos_X.String = num2str(T.t(1));
            handles.pos_Y.String = num2str(T.t(2));
            handles.pos_Z.String = num2str(T.t(3));
            % Display joint angle the GUI
            handles.jointX.String = num2str(dq(1));
            handles.jointY.String = num2str(dq(2));
            handles.jointZ.String = num2str(dq(3));

            % Display joint angle1~6
            handles.angle1.String = num2str(th(1));
            handles.angle2.String = num2str(th(2));
            handles.angle3.String = num2str(th(3));
            handles.angle4.String = num2str(th(4));
            handles.angle5.String = num2str(th(5));
            handles.angle6.String = num2str(th(6));

            q = th;             %% dq 이용해서 새로운 q(각도) 만들기
            q(1:3) = q(1:3) + dq';
            th=q;
            robot.plot(q)       %% q 이용해서 robot plot
            getframe(gcf);
        end

    else
        % Z axis / jabcobian Lab 활용.
        d2 = 0.6; a2 = 2; d3 = -0.3; d4 = 0.7;
        th = [0 0 0 0 0 0];
        L(1) = Link([th(1) 0 0 -pi/2]);
        L(2) = Link([th(2) d2 a2 0]);
        L(3) = Link([th(3) d3 0 -pi/2]);
        L(4) = Link([th(4) d4 0 pi/2]);
        L(5) = Link([th(5) 0 0 -pi/2]);
        L(6) = Link([th(6) 0 0 0]);
        
        robot = SerialLink(L);
        robot.name = 'Number1';
        robot.plot(th)
        
        for i = 1:interval:distance
            J = robot.jacob0(th);
            Jp = J(1:3,1:3);
            dp = [0;0;0.01];    %% dp벡터
            dq = inv(Jp)*dp;    %% Jp와 dp이용해서 dq벡터 만들기
        
            % 경고 메시지 출력
            if det(inv(Jp)) < 100*eps
                warning('Reached a place CANNOT MOVE to the design structure.')
                errordlg('Unable to Move Robot!!');
                break
            end
            T = robot.fkine(th);
            % Display the end effector position on the GUI
            handles.pos_X.String = num2str(T.t(1));
            handles.pos_Y.String = num2str(T.t(2));
            handles.pos_Z.String = num2str(T.t(3));
            % Display joint angle the GUI
            handles.jointX.String = num2str(dq(1));
            handles.jointY.String = num2str(dq(2));
            handles.jointZ.String = num2str(dq(3));
            % Display joint angle1~6
            handles.angle1.String = num2str(th(1));
            handles.angle2.String = num2str(th(2));
            handles.angle3.String = num2str(th(3));
            handles.angle4.String = num2str(th(4));
            handles.angle5.String = num2str(th(5));
            handles.angle6.String = num2str(th(6));
            
            q = th;             %% dq 이용해서 새로운 q(각도) 만들기
            q(1:3) = q(1:3) + dq';
            th=q;
            robot.plot(q)       %% q 이용해서 robot plot
            getframe(gcf);
        end
    end
