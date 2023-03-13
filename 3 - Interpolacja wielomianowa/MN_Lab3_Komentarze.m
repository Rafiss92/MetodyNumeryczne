% Autor - Rafał Mastalerz
%interpolacja wielomianowa (wielomian stopnia 5; 6 wezlow)

disp("Wspolrzedne wezlow");
%czytelne ale malo praktyczne
%punkty nalezy uporzadkowac wzgledem osi X
w1=[-5,5]
w2=[-4,1]
w5=[-2,4]
w3=[1,2]
w4=[2,-1]
w6=[4,-1]

X=[w1(1,1)^0, w1(1,1)^1, w1(1,1)^2, w1(1,1)^3, w1(1,1)^4, w1(1,1)^5;
   w2(1,1)^0, w2(1,1)^1, w2(1,1)^2, w2(1,1)^3, w2(1,1)^4, w2(1,1)^5;
   w3(1,1)^0, w3(1,1)^1, w3(1,1)^2, w3(1,1)^3, w3(1,1)^4, w3(1,1)^5;
   w4(1,1)^0, w4(1,1)^1, w4(1,1)^2, w4(1,1)^3, w4(1,1)^4, w4(1,1)^5;
   w5(1,1)^0, w5(1,1)^1, w5(1,1)^2, w5(1,1)^3, w5(1,1)^4, w5(1,1)^5;
   w6(1,1)^0, w6(1,1)^1, w6(1,1)^2, w6(1,1)^3, w6(1,1)^4, w6(1,1)^5]
   
disp("Macierz X");
disp(X);

if (det(X) != 0)

  Y=[w1(1,2); w2(1,2); w3(1,2); w4(1,2); w5(1,2); w6(1,2)];
  disp("Macierz Y");
  disp(Y);

  A=inv(X)*Y;
  disp("Macierz wspolczynnikow");
  disp(A); 

  fprintf(' W(x)=%f*x^5 + %f*x^4 + %f*x^3 + %f*x^2 + %f*x + %f \n', A(6,1), A(5,1), A(4,1), A(3,1), A(2,1), A(1,1));  

  % czesc graficzna 
  x=[-6:1:6]; % zakres zmiennej x dla jakich obliczana bedzie wartosc wielomianu
  y=zeros(1,13);
  %for i=1:11
  %  y(i)=A(1,1)+A(2,1)*x(i)+A(3,1)*x(i)^2; % obliczanie wartosci funkcji dla kolejnych argumentow
  %end
  % To samo za posrednictwem operacji na wektorach (bez petli for)
   y=A(1,1)+A(2,1)*x.+A(3,1)*x.^2+A(4,1)*x.^3+A(5,1)*x.^4+A(6,1)*x.^5;
  plot(x,y);  % rysuje wykres na podstawie danych z wektorow x i y
  grid on;    % wlacza siatke
  hold on;    % mozliwia dalsze operacje na wykresie   

  vector_x=[w1(1,1), w2(1,1), w3(1,1), w4(1,1), w5(1,1), w6(1,1)]; % utworzenie wektora wspolrzednych x wezlow
  vector_y=zeros(1,6);
  for i=1:6
    vector_y(1,1)=vector_y(1,1)+A(i,1)*w1(1,1)^(i-1);   % W(w1(1,1))
    vector_y(1,2)=vector_y(1,2)+A(i,1)*w2(1,1)^(i-1);   % W(w2(1,1))
    vector_y(1,3)=vector_y(1,3)+A(i,1)*w3(1,1)^(i-1);   % W(w3(1,1))
    vector_y(1,4)=vector_y(1,4)+A(i,1)*w4(1,1)^(i-1);   % W(w4(1,1))
    vector_y(1,5)=vector_y(1,5)+A(i,1)*w5(1,1)^(i-1);   % W(w5(1,1))
    vector_y(1,6)=vector_y(1,6)+A(i,1)*w6(1,1)^(i-1);   % W(w6(1,1))
  end
  plot(vector_x,vector_y,'rx'); % zaznacza na rysunku wybrane punkty obliczonego wielomaniu W(x) 
  % opcje: 'r.',  'g*', 'g', '--gs'   itd.
  % wiecej na http://www.mathworks.com/help/matlab/ref/plot.html#inputarg_LineSpec
  plot(w1(1,1),w1(1,2),'--gs');  % zaznacza wsp wezla w1 
  plot(w2(1,1),w2(1,2),'--gs');  % zaznacza wsp wezla w2 
  plot(w3(1,1),w3(1,2),'--gs');  % zaznacza wsp wezla w3 
  plot(w4(1,1),w4(1,2),'--gs');  % zaznacza wsp wezla w4
  plot(w5(1,1),w5(1,2),'--gs');  % zaznacza wsp wezla w5 
  plot(w6(1,1),w6(1,2),'--gs');  % zaznacza wsp wezla w6 

  title('Interpolacja wielomianowa');
  ylabel('Os y');
  xlabel('Os x');
else
  disp("Macierz ma wyznacznik = 0! Nie mo�na utworzy� macierzy odwrotnej!");
endif