clear;
% Autor - Rafał Mastalerz
% Inicjalizacja macierzy
A=[4,3,0.5;1,-1,5;-0.5,2,2];
B=[-2,1.5,4;-2,1,2.5;-1,2,-1];
% Zerowanie macierzy C
C=zeros(3,3);

% Mnożenie macierzy A*B pętlą FOR
for i=1:3
  for j=1:3
    C(i,j)=A(i,1)*B(1,j)+A(i,2)*B(2,j)+A(i,3)*B(3,j);
  endfor
endfor

% Funkcja zwracająca wyznacznik macierzy 3x3
function retval = detMac3x3(A)
  retval=A(1,1)*A(2,2)*A(3,3)+A(1,2)*A(2,3)*A(3,1)+A(1,3)*A(2,1)*A(3,2)-A(3,1)*A(2,2)*A(1,3)-A(3,2)*A(2,3)*A(1,1)-A(3,3)*A(2,1)*A(1,2);
endfunction

% Funkcja zwracająca jako wartość macierz odwróconą
function retval = inwersja(A);
  AI=zeros(3,3);
  detA=detMac3x3(A); % Obliczanie wyznacznika macierzy A
  
  if (detA !=0) % Warunek tworzenia macierzy odwrotnej
    % Obliczanie wyznaczników minorów
   D_dopelnienia(1,1)=(A(2,2)*A(3,3)-A(3,2)*A(2,3));
   D_dopelnienia(1,2)=-(A(2,1)*A(3,3)-A(3,1)*A(2,3));
   D_dopelnienia(1,3)=(A(2,1)*A(3,2)-A(3,1)*A(2,2));
   D_dopelnienia(2,1)=-(A(1,2)*A(3,3)-A(3,2)*A(1,3));
   D_dopelnienia(2,2)=(A(1,1)*A(3,3)-A(3,1)*A(1,3));
   D_dopelnienia(2,3)=-(A(1,1)*A(3,2)-A(3,1)*A(1,2));
   D_dopelnienia(3,1)=(A(1,2)*A(2,3)-A(2,2)*A(1,3));
   D_dopelnienia(3,2)=-(A(1,1)*A(2,3)-A(2,1)*A(1,3));
   D_dopelnienia(3,3)=(A(1,1)*A(2,2)-A(2,1)*A(1,2));
   
   DT=zeros(3,3); % Zerowanie macierzy DT
   
   % Tworzenie transponowanej macierzy dopełnień
  for i=1:3
    for j=1:3
      DT(j,i)=D_dopelnienia(i,j);
    endfor
  endfor
  
  D_inv=zeros(3,3); % Zerowanie macierzy D_inv
  
  % Tworzenie właściwej macierzy odwrotnej
  for i=1:3
    for j=1:3
      D_inv(i,j)=1/detA*DT(i,j);
    endfor
  endfor
  
  retval = D_inv; % Zwrócona wartość funkcji
  
  else
    disp("Nie można odwrocic macierzy, wyznacznik = 0"); % Warunek, jeśli wyznacznik == 0
  endif
endfunction

% Wywołanie funkcji
disp("Macierz odwrocona funkcjami: \n");
disp(inwersja(C));
disp("\nWyznacznik:");
disp(detMac3x3(inwersja(C)));

% Wywołanie funkcji wbudowanych w Octave
disp("\nOczkiewany rezultat (funkcje Octave):");
disp(inv(A*B));
disp("\nWyznacznik:");
disp(det(inv(A*B)));