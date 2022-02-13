clear all
clc
fileID = fopen('box.svg','w');
%% Logic check
check = 0;
isnumber = 1;
count = 0;
str = input('Please enter the text you wanna put on the box: ','s');
angle = input('How many degrees do you wanna rotate the image: ');

% Let users re-enter the parameters until the input is suitable for box making  
while check == 0
w=input('Please enter the value of width  = ');  %gGet input
h=input('Please enter the value of height = '); 
l=input('Please enter the value of length = '); 

%Check if the input is empty
if isempty(l)
    fprintf('the input should be a positive number\n');
    isnumber = 0;
elseif isempty(w)
    fprintf('the input should be a positive number\n');
    isnumber = 0;
elseif isempty(h)
    fprintf('the input should be a positive number\n');
   isnumber = 0;
end

%Check if the input is numeric
if isnumeric(w) == 0    
    fprintf('the input should be a positive number\n');
    isnumber = 0;
elseif isnumeric(h) == 0
    fprintf('the input should be a positive number\n');
    isnumber = 0;
elseif isnumeric(l) == 0
    fprintf('the input should be a positive number\n');
    isnumber = 0;
end

%Check positive value
if h <= 0
    fprintf('the input should be a positive number\n');
    isnumber = 0;
elseif l <= 0
    fprintf('the input should be a positive number\n');
    isnumber = 0;
elseif w <= 0
    fprintf('the input should be a positive number\n');
    isnumber = 0;
end 

%Check size
if (isnumber == 1)
    if((5*w) < 800 ) && (2*h+w < 600)
        check = 1;
    else
    fprintf('The size is too big, re-enter the data\n');
    end
end

%Program running times limiation 
count = count+1;
if(count > 3)
    fprintf('Please rerun the program!\n');
    return;
end

end
%%
t = 96*1/8;
w = w*96;
h = h*96;
l = l*96;
xh = h/5;              %fix unit height
xl = l/5;              %fix unit length
xw = w/5;              %fix unit width
rhole = 0.086*96/2;    %spring hole radius

%Call the functions to draw the box
[x11,y11]= myfrontleftHarray(l,w,h,0,0);
[x12,y12]= myfrontrightHarray(l,w,h,l,0);
[x13,y13]= myfrontleftHarray(l,w,h,0,h+w);
[x14,y14]= myfrontrightHarray(l,w,h,l,h+w);


[x21,y21]= myfrontupLarray(l,w,h,0,h);
[x22,y22]= myfrontupLarray(l,w,h,0,h+h+w); 
[x23,y23]= myfrontupLarray(l,w,h,l+h,h+w); 

[x24,y24]= myfrontbottomLarray(l,w,h,0,0);
[x25,y25]= myfrontbottomLarray(l,w,h,0,w+h); 
[x26,y26]= myfrontupLarray(l,w,h,l+h,h);

[x31,y31] = myrighttopLarray(l,w,h,l,h);
[x32,y32] = myrighttopLarray(l,w,h,2*l+h,h);
[x33,y33] = myrightbottomLarray(l,w,h,l,h+w);
[x34,y34] = myrightbottomLarray(l,w,h,2*l+h,h+w);

[x41,y41] = mydividerLarray(l,w,h,2*l+2*h+2*t,h);

[x51,y51] = mytoprightLarray(l,w,h,l,h);
[x52,y52] = mytoprightLarray(l,w,h,l+l+h,h);
[x53,y53] = mytopleftLarray(l,w,h,l+l+h+h,h);
[x54,y54] = mytopleftLarray(l,w,h,0,h);
[x55,y55] = mytopleftLarray(l,w,h,l+h,h);

[x61,y61] = mySpring1array(l,w,h,4*96/25.4,h);
[x62,y62] = mySpring1array(l,w,h,l-5.6*96/25.4,h);
[x63,y63] = mySpring1array(l,w,h,l+4*96/25.4,h);
[x64,y64] = mySpring1array(l,w,h,l+h-5.6*96/25.4,h);
[x65,y65] = mySpring1array(l,w,h,l+h+4*96/25.4,h);
[x66,y66] = mySpring1array(l,w,h,l+l+h+4*96/25.4,h);
[x67,y67] = mySpring1array(l,w,h,l+l+h-5.6*96/25.4,h);
[x68,y68] = mySpring1array(l,w,h,l+l+h+h-5.6*96/25.4,h);

[x71,y71] = mySpring2array(l,w,h,4*96/25.4,h+w);
[x72,y72] = mySpring2array(l,w,h,l-5.6*96/25.4,h+w);
[x73,y73] = mySpring2array(l,w,h,l+4*96/25.4,h+w);
[x74,y74] = mySpring2array(l,w,h,l+h-5.6*96/25.4,h+w);
[x75,y75] = mySpring2array(l,w,h,l+h+4*96/25.4,h+w);
[x76,y76] = mySpring2array(l,w,h,l+l+h+4*96/25.4,h+w);
[x77,y77] = mySpring2array(l,w,h,l+l+h-5.6*96/25.4,h+w);
[x78,y78] = mySpring2array(l,w,h,l+l+h+h-5.6*96/25.4,h+w);

[x81,y81] = myDividerholearray(l,w,h,(l-t)/2,h/3);
[x82,y82] = myDividerholearray(l,w,h,(l-t)/2,h+w+h/3);



[hx1,hy1] = myLWhole(l,w,h,0,0);
[hx2,hy2] = myLWhole(l,w,h,0,0);
%% Start writting SVG file
fprintf(fileID, '<?xml version="1.0" encoding="UTF-8" ?>\n');
fprintf(fileID, '  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink">\n');

% finish the drawing by step
for k = 1:9

fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x11(k),y11(k),x11(k+1),y11(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x12(k),y12(k),x12(k+1),y12(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x13(k),y13(k),x13(k+1),y13(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x14(k),y14(k),x14(k+1),y14(k+1));

fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x21(k),y21(k),x21(k+1),y21(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x22(k),y22(k),x22(k+1),y22(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x23(k),y23(k),x23(k+1),y23(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x24(k),y24(k),x24(k+1),y24(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x25(k),y25(k),x25(k+1),y25(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x26(k),y26(k),x26(k+1),y26(k+1));

fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x31(k),y31(k),x31(k+1),y31(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x32(k),y32(k),x32(k+1),y32(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x33(k),y33(k),x33(k+1),y33(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x34(k),y34(k),x34(k+1),y34(k+1));

fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x51(k),y51(k),x51(k+1),y51(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x52(k),y52(k),x52(k+1),y52(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x53(k),y53(k),x53(k+1),y53(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x54(k),y54(k),x54(k+1),y54(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x55(k),y55(k),x55(k+1),y55(k+1));


end
for k=1:4
    fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x81(k),y81(k),x81(k+1),y81(k+1));
    fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x82(k),y82(k),x82(k+1),y82(k+1));

end
for k = 1:12
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x41(k),y41(k),x41(k+1),y41(k+1));


end
for k = 1:11
    fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x61(k),y61(k),x61(k+1),y61(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x62(k),y62(k),x62(k+1),y62(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x63(k),y63(k),x63(k+1),y63(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x64(k),y64(k),x64(k+1),y64(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x65(k),y65(k),x65(k+1),y65(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x66(k),y66(k),x66(k+1),y66(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x67(k),y67(k),x67(k+1),y67(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x68(k),y68(k),x68(k+1),y68(k+1));

fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x71(k),y71(k),x71(k+1),y71(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x72(k),y72(k),x72(k+1),y72(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x73(k),y73(k),x73(k+1),y73(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x74(k),y74(k),x74(k+1),y74(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x75(k),y75(k),x75(k+1),y75(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x76(k),y76(k),x76(k+1),y76(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x77(k),y77(k),x77(k+1),y77(k+1));
fprintf(fileID, '<line x1="%f"  y1="%f" x2="%f"   y2="%f" style="stroke:#006600;stroke-width: 1"/>\n',x78(k),y78(k),x78(k+1),y78(k+1));
end

for k = 1:16
fprintf(fileID, '<circle cx="%f" cy="%f" r="%f" style="stroke:#006600;stroke-width: 1;fill:none"/>\n',hx1(k),hy1(k),rhole);
fprintf(fileID, '<circle cx="%f" cy="%f" r="%f" style="stroke:#006600;stroke-width: 1;fill:none"/>\n',hx2(k),hy2(k),rhole);
end


%% user  User-specified text engraved on the top and front of the box
% front side center
frontcx = xl+xl+xl+0.086*96/2;
frontcy = t+3*xh;
% top side center
topcx = l*96/25.4;
topcy = h*96/25.4+w*96/25.4;
% get the size the input text
gap = size(str);

fprintf(fileID, ' <text x="%f" y="%f" style="fill: none; stroke: #000000;  font-size: %f;">',frontcx-gap(2)*96/12-l/6,frontcy-h/6,l/6);
fprintf(fileID, str);
fprintf(fileID,'</text>\n');

fprintf(fileID, ' <text x="%f" y="%f" style="fill: none; stroke: #000000;  font-size: %f;">',frontcx-l/3,h+w/2,w/6);
fprintf(fileID, str);
fprintf(fileID,'</text>\n');
%% Columbia Logo and Digital manufacturing
fprintf(fileID, '<image x="%f" y="%f" width="%f" height="%f" xlink:href="columbia.png" transform="rotate(%f,%f,%f)" />\n',frontcx-l/10,frontcy-h/10,l/6,h/6,angle,frontcx-l/10+l/12,frontcy-h/10+h/12);

fprintf(fileID, ' <text x="%f" y="%f" style="fill: none; stroke: #000000;  font-size: %f;">Digital Manufacturing</text>\n',frontcx-l/2,frontcy+h/4,l/12);

%% fractal patten
% find the center of a side
fracx = [];
fracy = [];
fracx(1) = l/2;
fracy(1) = h+w/2;

for j = 1:20
    fprintf(fileID, '<circle cx="%f" cy="%f" r="%f" style="stroke:#006600;stroke-width: 1;fill:none" transform="rotate(%f,%f,%f)"/>\n',fracx(j),fracy(j),h/40,j*15,fracx(1),fracy(1));
    fracx(j+1) = fracx(j)+1;
    fracy(j+1) = fracy(j)+1;
end

fracx = [];
fracy = [];
fracx(1) = l/2;
fracy(1) = h+w/2;
for j = 1:20
    fprintf(fileID, '<circle cx="%f" cy="%f" r="%f" style="stroke:#006600;stroke-width: 1;fill:none" transform="rotate(%f,%f,%f)"/>\n',fracx(j),fracy(j),h/40,j*15,fracx(1),fracy(1));
    fracx(j+1) = fracx(j)-1;
    fracy(j+1) = fracy(j)-1;
end

fracx = [];
fracy = [];
fracx(1) = l+h+l/2;
fracy(1) = h+w/2;
for j = 1:20
    fprintf(fileID, '<circle cx="%f" cy="%f" r="%f" style="stroke:#006600;stroke-width: 1;fill:none" transform="rotate(%f,%f,%f)"/>\n',fracx(j),fracy(j),h/40,j*15,fracx(1),fracy(1));
    fracx(j+1) = fracx(j)+1;
    fracy(j+1) = fracy(j)-1;
end

fracx = [];
fracy = [];
fracx(1) = l+h+l/2;
fracy(1) = h+w/2;
for j = 1:20
    fprintf(fileID, '<circle cx="%f" cy="%f" r="%f" style="stroke:#006600;stroke-width: 1;fill:none" transform="rotate(%f,%f,%f)"/>\n',fracx(j),fracy(j),h/40,j*15,fracx(1),fracy(1));
    fracx(j+1) = fracx(j)-1;
    fracy(j+1) = fracy(j)+1;
end

fprintf(fileID, '</svg>');
fclose(fileID);
%% drawing function
%ox and oy are the points where the drawing parts begin
function [x11,y11] = myfrontleftHarray(l,w,h,ox,oy)

i= 2;
t = 96*1/8;
xh = h/5;
xl = l/5;
xw = w/5;

x11 = [ox];
y11 = [oy];
x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;


end

function [x11,y11] = myfrontrightHarray(l,w,h,ox,oy)

i= 2;
t = 96*1/8;
xh = h/5;
xl = l/5;
xw = w/5;

x11 = [ox];
y11 = [oy];
x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xh;
end


function [x11,y11] = myfrontupLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

    xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    
x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;


x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);

end

function [x11,y11] = myfrontbottomLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    
x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);
i=i+1;


x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xl;
y11(i) = y11(i-1);

end

function [x11,y11] = mytopleftLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    
x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;


x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;

end


function [x11,y11] = mytoprightLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    
x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)-t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;
i=i+1;

x11(i) = x11(i-1)+t;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+xw;

end

function [x11,y11] = myrightbottomLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    
x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;


x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);

end

function [x11,y11] = myrighttopLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;


x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);

end

function [x11,y11] = mydividerLarray(l,w,h,ox,oy)
       i= 2;
    t = 96*1/8;

xh = h/5;
xl = l/5;
xw = w/5;
x11 = [ox];
y11 = [oy];    
x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)+xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+w;
i=i+1;

x11(i) = x11(i-1)-xh;
y11(i) = y11(i-1);
i=i+1;


x11(i) = x11(i-1);
y11(i) = y11(i-1)+t;
i=i+1;

x11(i) = x11(i-1)-xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-t;
i=i+1;

x11(i) = x11(i-1)-xh;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-w;

end


%Spring fixed hole2
function [x11,y11] = mySpring1array(l,w,h,ox,oy)
    i= 2;
    t = 96*1/8;
    xh = h/5;
    xl = l/5;
    xw = w/5;
    
    x11 = [ox];
    y11 = [oy];

    x11(i) = x11(i-1);
y11(i) = y11(i-1)+2*96/25.4;
i=i+1;

x11(i) = x11(i-1)-1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+1.6*96/25.4;
i=i+1;

x11(i) = x11(i-1)+1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+3*96/25.4;
i=i+1;

x11(i) = x11(i-1)+1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-3*96/25.4;
i=i+1;

x11(i) = x11(i-1)+1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-1.6*96/25.4;
i=i+1;

x11(i) = x11(i-1)-1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-2*96/25.4;


end

%Spring fixed hole2
function [x11,y11] = mySpring2array(l,w,h,ox,oy)
    i= 2;
    t = 96*1/8;
    xh = h/5;
    xl = l/5;
    xw = w/5;
    
    x11 = [ox];
    y11 = [oy];

    x11(i) = x11(i-1);
y11(i) = y11(i-1)-2*96/25.4;
i=i+1;

x11(i) = x11(i-1)-1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-1.6*96/25.4;
i=i+1;

x11(i) = x11(i-1)+1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)-3*96/25.4;
i=i+1;

x11(i) = x11(i-1)+1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+3*96/25.4;
i=i+1;

x11(i) = x11(i-1)+1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+1.6*96/25.4;
i=i+1;

x11(i) = x11(i-1)-1.6*96/25.4;
y11(i) = y11(i-1);
i=i+1;

x11(i) = x11(i-1);
y11(i) = y11(i-1)+2*96/25.4;


end
%divided part
function [x11,y11] = myDividerholearray(l,w,h,px,py)
 i= 2;
    t = 96*1/8;
    xh = h/3;
    xl = l/5;
    xw = w/5;
    
    x11 = [px];
    y11 = [py];

    x11(i) = x11(i-1)+t;
    y11(i) = y11(i-1);
    i=i+1;

    x11(i) = x11(i-1);
    y11(i) = y11(i-1)+xh;
    i=i+1;

    x11(i) = x11(i-1)-t;
    y11(i) = y11(i-1);
    i=i+1;

    x11(i) = x11(i-1);
    y11(i) = y11(i-1)-xh;
end

%spring hole
function [x11,y11] = myLWhole(l,w,h,ox,oy)

    
    x11 = [];
    y11 = [];
    
    t = 96*1/8;
    xh = h/5;
    xl = l/5;
    xw = w/5;

    x11(1) = 5*96/25.4;
    y11(1) = 2*96/25.4;

    x11(2) = l-5*96/25.4;
    y11(2) = 2*96/25.4;

    x11(3) = 5*96/25.4;
    y11(3) = h-2*96/25.4;

    x11(4) = l-5*96/25.4;
    y11(4) = h-2*96/25.4;

    x11(5) = 5*96/25.4;
    y11(5) = w+h+2*96/25.4;

    x11(6) = l-5*96/25.4;
    y11(6) = w+h+2*96/25.4;

    x11(7) = 5*96/25.4;
    y11(7) = w+h+h-2*96/25.4;

    x11(8) = l-5*96/25.4;
    y11(8) = w+h+h-2*96/25.4;

    x11(9) = 2*96/25.4;
    y11(9) = 5*96/25.4;
    
    x11(10) = 2*96/25.4;
    y11(10) = h-5*96/25.4;
        
    x11(11) = l-2*96/25.4;
    y11(11) = h-5*96/25.4;
       
    x11(12) = l-2*96/25.4;
    y11(12) = 5*96/25.4;
        
    x11(13) = 2*96/25.4;
    y11(13) = h+w+5*96/25.4;
    
    x11(14) = 2*96/25.4;
    y11(14) = h+w+h-5*96/25.4;
        
    x11(15) = l-2*96/25.4;
    y11(15) = h+w+h-5*96/25.4;
       
    x11(16) = l-2*96/25.4;
    y11(16) = h+w+5*96/25.4;
end