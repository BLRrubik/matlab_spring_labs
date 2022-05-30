clc 
clear;
savePath  = "C:\\matlab_site\\front\\matlabWeb\\src\\outputs\\lab1InPrime\\";
out=sim('simulink/models1.slx'); 
counter = 1;
i = 1;
% Часть 1
% Зона нечувсвительности
figure (i); i=i+1;
hold on
plot(out.ScopeData.signals(2).values, out.ScopeData.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Зона нечувствительности');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;

% Зона насыщения
figure (i); i=i+1;
hold on
plot(out.ScopeData1.signals(2).values, out.ScopeData1.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Зона насыщения');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Зона нечувствительности с насыщением
figure (i); i=i+1;
hold on
plot(out.ScopeData2.signals(2).values, out.ScopeData2.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Зона нечувствительности с насыщением');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Двухпозиционное реле
figure (i); i=i+1;
hold on
plot(out.ScopeData3.signals(2).values, out.ScopeData3.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Двухпозиционное реле');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Трехпозиционное реле
figure (i); i=i+1;
hold on
plot(out.ScopeData4.signals(2).values, out.ScopeData4.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Трехпозиционное реле');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Гистерезис
figure (i); i=i+1;
hold on
plot(out.ScopeData5.signals(2).values, out.ScopeData5.signals(1).values)
grid minor
title('Статические характеристики');
subtitle('Гистерезис');
xlabel('x');
ylabel('y');
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Часть 2
% Зона нечувсвительности
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Зона нечувствительности');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Зона насыщения
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData1.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Зона насыщения');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Зона нечувствительности с насыщением
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData2.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Зона нечувствительности с насыщением');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Двухпозиционное реле
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData3.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Двухпозиционное реле');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Трехпозиционное реле
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData4.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Трехпозиционное реле');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
% Гистерезис
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData5.signals(1).values,'--', out.tout, 2*sin(1*out.tout))
grid minor
title('Реакция на гармоническое воздействие');
subtitle('Гистерезис');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
%Часть 3
%Последовательное соединение звеньев

%Вариант 1
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData6.signals(1).values,'--', out.tout, 3*sin(pi/2*out.tout))
grid minor
title('Последовательное соединение звеньев');
subtitle('Вариант 1');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;
%Вариант 2
figure (i); i=i+1;
hold on
plot(out.tout, out.ScopeData7.signals(1).values,'--', out.tout, 3*sin(pi/2*out.tout))
grid minor
title('Последовательное соединение звеньев');
subtitle('Вариант 2');
xlabel('time');
ylabel('y(t)');
legend('y(t)','sin')
ax = gca;
ax.FontSize = 10;
saveas(gcf, savePath + counter, 'png');
counter  = counter + 1;

close all;
