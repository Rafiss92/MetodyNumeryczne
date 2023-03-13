clear;
% Autor - Rafał Mastalerz
% zalozenie elementy glownej przekatnej macierzy D sa niezerowe
% rozmiar wektora b jest adekwatny do rozmiaru macierzy A 
% obliczenia realizowane sa dla bledu sumarycznego r<0.3

%Zad 1
%A=[20,-5,4,-4; 3,10,-3,-1; 2,0,4,0; 2,-1,-2,8]
%b=[12; 20; 28; 52]

%Zad 2
%A=[0,10,3,-1;20,3,2,10;2,3,0,10;2,-1,8,2]
%b=[35;103;27;23]

%Zad 3
%A=[1,2,3,4;2,0,5,2;1,1,4,2;2,1,1,1]
%b=[40;34;31;16]

%TEST
A=[5,2,6,6,-7;4,-4,7,2,1;5,9,-3,1,5;-3,4,7,9,-3;6,1,6,-4,2]
b=[8;16;3;5;7]

n=length(b);
L=zeros(n);
D=zeros(n);
U=zeros(n);

i=n;
for j=1:n
 [liczba, row] = max(A(:,i));
  if (A(i,i)==0) || (liczba<A(i,i))
      tymczasowa=A(i,:);
      A(i,:)=A(row,:);
      A(row,:)=tymczasowa;
      tymczasowa=b(i,:);
      b(i,:)=b(row,:);
      b(row,:)=tymczasowa;
  endif
  i--
endfor
A
for i=1:n
  for j=1:n
    if i>j              %dla wyrazow pod glowna przekatna macierzy L trojkatnej dolnej
       L(i,j)=A(i,j);
    elseif i<j          %dla wyrazow ponad glowna przekatna macierzy U trojkatnej gornej
       U(i,j)=A(i,j);
    else                %dla wyrazow na glownej przekatnej macierzy D diagonalnej
       D(i,j)=A(i,j);
    end
  end
end

N=inv(D);
H=zeros(n);
for i=1:n
  for j=1:n
    if i!=j
      H(i,j)=-A(i,j)/A(i,i); %dla i=j wyrazy maja wartosc zerowa bo wczesniej H=zeros(n)
    end  
  end
end

if (max(sum(abs(H)))<1) || (max(sum(abs(H')))<1) % ||=lub; H' - transpozycja macierzy (zamiana wierszy z kolumnami)
  x=zeros(4,1);

  liczba_iteracji=0;
while (sum(abs((A*x)-b))>=0.3)
    disp(['Wynik dla iteracji nr ',num2str(liczba_iteracji)]); %konwersja liczby t do tablicy znakow
    x=-N*(L+U)*x+N*b;
    liczba_iteracji++;
    disp(x)
endwhile    

  disp("Sumaryczny blad rozwiazania");
  disp(sum(abs((A*x)-b)));  
  disp("Sprawdzenie - wynik dokladny");
  disp(inv(A)*b);
else
  disp("Warunek wystarczajacy uzyskania zbieznosci nie zostal spelniony");
endif
