%Rozwiazywanie ukladow rownan nieliniowych metoda Newtona
%Uklad rownan do rozwiazania: 
%
% 2xy+2xz+2yz=22
% x^2-3yz-2xy^2=-25
% -3y^3+2x^2z^2=-6
clear;

%funkcje tworzace uklad rownan
F1=@(x,y,z) 2*x*y+2*x*z+2*y*z-22;
F2=@(x,y,z) x^2-3*y*z-2*x*(y^2)+25;
F3=@(x,y,z) -3*(y^3)+2*(x^2)*(z^2)+6;

niedokladnosc=0.05;
blad=1-niedokladnosc;

%wyznaczamy poszczegolne pochodne
W11=@(y,z) 2*y+2*z+2*y*z;
W21=@(x,y,z) 2*x-3*y*z-2*y^2;
W31=@(x,y,z) -3*y^3+2*2*x*z^2;
W12=@(x,z) 2*x+2*x*z+2*z;
W22=@(x,y,z) x^2-3*z-2*x*2*y;
W32=@(x,y,z) -3*3*y^2+2*x^2*z^2;
W13=@(x,y) 2*x*y+2*x+2*y;
W23=@(x,y) x^2-3*y-2*x*y^2;
W33=@(x,y,z) -3*y^3+2*x^2*2*z;

X=[2;2.5;3];
F=zeros(3,1);
W=zeros(3,3);

while niedokladnosc>blad
  W(1,1) = W11(X(1,1), X(2,1), X(3,1));
  W(1,2) = W12(X(1,1), X(2,1), X(3,1));
  W(1,3) = W13(X(1,1), X(2,1), X(3,1));
  W(2,1) = W21(X(1,1), X(2,1), X(3,1));
  W(2,2) = W22(X(1,1), X(2,1), X(3,1));
  W(2,3) = W23(X(1,1), X(2,1), X(3,1));
  W(3,1) = W31(X(1,1), X(2,1), X(3,1));  
  W(3,2) = W32(X(1,1), X(2,1), X(3,1));       
  W(3,3) = W33(X(1,1), X(2,1), X(3,1));
  
  F(1,1) = F1(X(1,1), X(2,1), X(3,1));     
  F(2,1) = F2(X(1,1), X(2,1), X(3,1));     
  F(3,1) = F3(X(1,1), X(2,1), X(3,1));

  F=F*(-1);
  dX=inv(W)*F;
  X=X+dX;
  
  disp(X);
  niedokladnosc=abs(F1(X(1,1),X(2,1),X(3,1)))+abs(F2(X(1,1),X(2,1),X(3,1)))+abs(F3(X(1,1),X(2,1),X(3,1)))
  disp("***");
end

disp("Wynik")
disp(X);
disp("Wartosc funkcji F1, F2, F3 po podstawieniu szukanych X");
disp(F1(X(1,1),X(2,1),X(3,1)));
disp(F2(X(1,1),X(2,1),X(3,1)));
disp(F3(X(1,1),X(2,1),X(3,1)));
