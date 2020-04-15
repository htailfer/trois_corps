
function y = troiscorps(t,r,m)

x1 = r(1:2);x2 = r(5:6);x3 = r(9:10);
d1 = (x3-x2) / norm(x3-x2)^3;
d2 = (x1-x3) / norm(x1-x3)^3;
d3 = (x2-x1) / norm(x2-x1)^3;
y(1:2) = r(3:4);
y(5:6) = r(7:8);
y(9:10) = r(11:12);
y(3:4) =   m(2) * d3 - m(3) * d2;
y(7:8) =   m(3) * d1 - m(1) * d3;
y(11:12) = m(1) * d2 - m(2) * d1;
endfunction 
//
m=[3 4 5];listf=list(troiscorps,m);
r=[1 3,0 0,-2 -1,0 0,1 -1,0 0]
//x1 = [1,-1];x2 = [1,3];x3 = [-2,-1];v = [0,0];
t0=0;tfin=60;
tpas=0.02;
sol = ode(r',t0,t0:tpas:tfin,listf);
xset('figure',0)
clf;
Xmin=min([sol(1,:),sol(5,:),sol(9,:)]);
Ymin=min([sol(2,:),sol(6,:),sol(10,:)]);
Xmax=max([sol(1,:),sol(5,:),sol(9,:)]);
Ymax=max([sol(2,:),sol(6,:),sol(10,:)]);
plot2d([sol(1,:); sol(5,:); sol(9,:)]',[sol(2,:); sol(6,:); sol(10,:)]',[1,2,3],'111',' ',[Xmin,Ymin,Xmax,Ymax]);
xtitle('trajectoires');
//
xset('figure',1)
n=prod(size(sol(1,:)));
for i=1:(n-10)
 drawlater
 clf()
 plot2d([sol(1,i:i+10); sol(5,i:i+10); sol(9,i:i+10)]',[sol(2,i:i+10); sol(6,i:i+10); sol(10,i:i+10)]',[1,2,3],'111',' ',[Xmin,Ymin,Xmax,Ymax]);
  drawnow
end

