% Часть 1
% Зона нечувсвительности
figure
plot(out.ScopeData.signals(2).values, out.ScopeData.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Зона нечувствительности');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;

% Зона насыщения
figure
plot(out.ScopeData1.signals(2).values, out.ScopeData1.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Зона насыщения');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;

% Зона нечувствительности с насыщением
figure
plot(out.ScopeData2.signals(2).values, out.ScopeData2.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Зона нечувствительности с насыщением');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;

% Двухпозиционное реле
figure
plot(out.ScopeData3.signals(2).values, out.ScopeData3.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Двухпозиционное реле');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;

% Трехпозиционное реле
figure
plot(out.ScopeData4.signals(2).values, out.ScopeData4.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Трехпозиционное реле');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;

% Гистерезис
figure
plot(out.ScopeData5.signals(2).values, out.ScopeData5.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Гистерезис');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;

% Часть 2
% Зона нечувсвительности
 figure
plot(out.tout, out.ScopeData.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Зона нечувствительности');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

% Зона насыщения
figure
plot(out.tout, out.ScopeData1.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Зона насыщения');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

% Зона нечувствительности с насыщением
figure
plot(out.tout, out.ScopeData2.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Зона нечувствительности с насыщением');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

% Двухпозиционное реле
figure
plot(out.tout, out.ScopeData3.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Двухпозиционное реле');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

% Трехпозиционное реле
figure
plot(out.tout, out.ScopeData4.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Трехпозиционное реле');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

% Гистерезис
figure
plot(out.tout, out.ScopeData5.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Гистерезис');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

%Часть 3
%Последовательное соединение звеньев

%Вариант 1
figure
plot(out.tout, out.ScopeData6.signals(1).values,'--', out.tout, 3*sin(pi/2*out.tout))
grid minor
title('Последовательное соединение звеньев');
subtitle('Вариант 1');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

%Вариант 2
figure
plot(out.tout, out.ScopeData7.signals(1).values,'--', out.tout, 3*sin(pi/2*out.tout))
grid minor
title('Последовательное соединение звеньев');
subtitle('Вариант 2');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;

