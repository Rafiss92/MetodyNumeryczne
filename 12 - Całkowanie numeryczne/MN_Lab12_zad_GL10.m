clear;
format long; % zmiana formatu wynikow
function calka = calka_trapezy(a,b,n,fz)
  % a, b = zakres calkowania
  % n = liczba podzialow
  % fz = funkcja calkowana (najlepiej jako funkcja anonimowa)
  suma=0;
  h=(b-a)/n; % Szerokosc podzialu
  x=zeros(n,1);
  y=zeros(n,1);
  calka=0;
  for i=1:n
    x(i,1)=a+i*h;
    y(i,1)=fz(x(i,1));
  endfor

  suma=((y(1,1)+y(n,1))/2);

  for i=1:n-1
     suma+=fz(x(i,1));
  endfor
  calka=h*suma;
endfunction

function calka = calka_prostokaty(a,b,n,fz)
  % a, b = zakres calkowania
  % n = liczba podzialow
  % fz = funkcja calkowana (najlepiej jako funkcja anonimowa)
  suma=0;
  h=(b-a)/n; % Szerokosc przedzialu
  x=zeros(n,1);
  y=zeros(n,1);
  calka=0;
  for i=1:n
    x(i,1)=a+i*h;
    y(i,1)=fz(x(i,1));
  endfor

  for i=1:n-1
     suma+=fz(x(i,1));
  endfor
  calka=h*suma;
endfunction

fx=@(x) 0.5*x^2-5.5*x+35; % Funkcja calkowana

disp("\n")
disp("Calka dla funkcji: 0.5*x^2-5.5*x+35:\n")
disp("Metoda prostokatow:");
tic(); calka_prostokaty(-5,15,25,fx) 
toc
tic(); calka_prostokaty(-5,15,100,fx)
toc
tic(); calka_prostokaty(-5,15,1000,fx)
toc

disp("\nMetoda trapezow:");
tic(); calka_trapezy(-5,15,25,fx)
toc
tic(); calka_trapezy(-5,15,100,fx)
toc
tic(); calka_trapezy(-5,15,1000,fx)
toc

disp("Sprawdzenie funkcja quad:")
tic(); quad(fx,-5,15)
toc

%rysunek
% Generowanie linii
printf("Czas wykonywania rysunku: ");
tic();
xfx=linspace(-5,15,150); 
yfx=zeros(1,columns(xfx));

for i=1:columns(xfx)
  yfx(i)=fx(xfx(i));
endfor

figure()
plot(xfx,yfx); % Wykres calki
hold on;
title(["Wykres funkcji: 0.5*x^2-5.5*x+35"]);
for i=1:columns(xfx)
  xxfx=[xfx(i),xfx(i)];
  yyfx=[0,yfx(i)];
  plot(xxfx,yyfx);
endfor
xlabel("X");
ylabel("Y");
printf("%f \n", czas=toc);