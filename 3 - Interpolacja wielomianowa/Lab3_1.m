% Autor - Rafał Mastalerz
%interpolacja wielomianowa (wielomian stopnia 2; 3 wezly)

disp("Wspolrzedne wezlow");
%czytelne ale malo praktyczne
%punkty nalezy uporzadkowac wzgledem osi X
w2=[-3,-4]
w0=[ 2, 4]    
w1=[ 4, 1]

X=[w0(1,1)^0, w0(1,1)^1, w0(1,1)^2;
   w1(1,1)^0, w1(1,1)^1, w1(1,1)^2;
   w2(1,1)^0, w2(1,1)^1, w2(1,1)^2];
   
disp("Macierz X");
disp(X);

Y=[w0(1,2); w1(1,2); w2(1,2)];
disp("Macierz Y");
disp(Y);

A=inv(X)*Y;
disp("Macierz wspolczynnikow");
disp(A); 

fprintf(' W(x)=%f*x^2 + %f*x + %f \n', A(3,1), A(2,1), A(1,1));  

% czesc graficzna 
x=[-5:1:5]; % zakres zmiennej x dla jakich obliczana bedzie wartosc wielomianu
y=zeros(1,11);
%for i=1:11
%  y(i)=A(1,1)+A(2,1)*x(i)+A(3,1)*x(i)^2; % obliczanie wartosci funkcji dla kolejnych argumentow
%end
% To samo za posrednictwem operacji na wektorach (bez petli for)
 y=A(1,1)+A(2,1)*x.+A(3,1)*x.^2;
plot(x,y);  % rysuje wykres na podstawie danych z wektorow x i y
grid on;    % wlacza siatke
hold on;    % mozliwia dalsze operacje na wykresie   

vector_x=[w0(1,1), w1(1,1), w2(1,1)]; % utworzenie wektora wspolrzednych x wezlow
vector_y=[0,0,0];
for i=1:3
  vector_y(1,1)=vector_y(1,1)+A(i,1)*w0(1,1)^(i-1);   % W(w1(1,1))
  vector_y(1,2)=vector_y(1,2)+A(i,1)*w1(1,1)^(i-1);   % W(w2(1,1))
  vector_y(1,3)=vector_y(1,3)+A(i,1)*w2(1,1)^(i-1);   % W(w3(1,1))
end
plot(vector_x,vector_y,'rx'); % zaznacza na rysunku wybrane punkty obliczonego wielomaniu W(x) 
% opcje: 'r.',  'g*', 'g', '--gs'   itd.
% wiecej na http://www.mathworks.com/help/matlab/ref/plot.html#inputarg_LineSpec
plot(w0(1,1),w0(1,2),'--gs');  % zaznacza wsp wezla w0 
plot(w1(1,1),w1(1,2),'--gs');  % zaznacza wsp wezla w1 
plot(w2(1,1),w2(1,2),'--gs');  % zaznacza wsp wezla w2 

title('Interpolacja wielomianowa');
ylabel('Os y');
xlabel('Os x');