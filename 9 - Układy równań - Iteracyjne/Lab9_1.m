% autor - Rafał Mastalerz
% zalozenie elementy glownej przekatnej macierzy D sa niezerowe
% rozmiar wektora b jest adekwatny do rozmiaru macierzy A 
% obliczenia realizowane sa dla 10-ciu iteracji

A=[20,-5,4,-4; 3,10,-3,-1; 2,0,4,0; 2,-1,-2,8]
b=[12; 20; 28; 52]

n=length(b);
L=zeros(n);
D=zeros(n);
U=zeros(n);

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
  for t=0:12
    disp(['Wynik dla iteracji nr ',num2str(t)]); %konwersja liczby t do tablicy znakow
    x=-N*(L+U)*x+N*b;
    disp(x);    
  end
  disp("Sumaryczny blad rozwiazania");
  disp(sum(abs((A*x)-b)));  
  disp("Sprawdzenie - wynik dokladny");
  disp(inv(A)*b);
else
  disp("Warunek wystarczajacy uzyskania zbieznosci nie zostal spelniony");
end
