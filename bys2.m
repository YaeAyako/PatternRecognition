clc;
clear all;
pw1=0.9;
pw2=0.1;
yb=[-2.67,-3.55,-1.24,-0.98,-0.79,-2.85,-2.76,-3.73,-3.54,-2.27,-3.45,-3.08,-1.58,-1.49,-0.74,-0.42,-1.12,4.25,-3.99,2.88,-0.98,0.79,1.19,3.07];
w1=[];
w2=[];
Y1=[];
Y2=[];
l12=7;
l21=2;
l11=0;
l22=0;
Y=[];
for i = 1:1:24
    x=yb(i);
    pxw1=normpdf(x,-2,1.5);
    pxw2=normpdf(x,2,2);
    y1=(l11*pw1*pxw1+l12*pxw2*pw2)/(pw1*pxw1+pw2*pxw2);
    y2=(l21*pw1*pxw1+l22*pxw2*pw2)/(pw1*pxw1+pw2*pxw2);
    Y1(end+1)=y1;
    Y2(end+1)=y2;
    Y3=pxw1/pxw2;
    Y4=((l12-l22)*pw2)/((l21-l11)*pw1);
    if Y3>=Y4
        w1(end+1)=i;
        Y(i)=1;
    else 
        w2(end+1)=i;
        Y(i)=0;
    end
end

w1
w2
Y

x=-5:0.01:5;
pxw11=normpdf(x,-2,1.5);
pxw21=normpdf(x,2,2);
y11=(l11*pw1*pxw11+l12*pxw21*pw2);
y21=(l21*pw1*pxw11+l22*pxw21*pw2);
p=find(y11==y21);
figure;
plot(x,y11,x,y21,yb,0,'*');
legend('w1','w2')