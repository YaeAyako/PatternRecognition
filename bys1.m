clc;
clear all;
pw1=0.9;
pw2=0.1;
yb=[-2.67,-3.55,-1.24,-0.98,-0.79,-2.85,-2.76,-3.73,-3.54,-2.27,-3.45,-3.08,-1.58,-1.49,-0.74,-0.42,-1.12,4.25,-3.99,2.88,-0.98,0.79,1.19,3.07];
w1=[];
w2=[];
Y1=[];
Y2=[];
Y=[];
for i = 1:1:24
    x=yb(i);
    pxw1=normpdf(x,-2,1.5);
    pxw2=normpdf(x,2,2);
    y1=pw1*pxw1/(pw1*pxw1+pw2*pxw2);
    y2=pw2*pxw2/(pw1*pxw1+pw2*pxw2);
    Y1(end+1)=y1;
    Y2(end+1)=y2;
    if y1>=y2
        w1(end+1)=i;
        Y(i)=1;
    else 
        w2(end+1)=i;
        Y(i)=0;
    end
    
end
 
x=-5:0.01:5;
pxw11=normpdf(x,-2,1.5);
pxw21=normpdf(x,2,2);
y11=pw1*pxw11;
y21=pw2*pxw21;
p=find(y11==y21);
figure;
plot(x,y11,x,y21,yb,0,'*');
legend('w1','w2');

w1
w2
Y
