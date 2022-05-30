clc;
clear all;
mkdir("outputs")
mkdir("D:/Programming/Web/matlabWeb/src/outputs/lab3")
out=sim('lr3model.slx'); %запуск модели
hold on 
A=plot(out.tout,out.ScopeData.signals.values);
plot(out.tout,out.ScopeData1.signals.values);
plot(out.tout,out.ScopeData2.signals.values);
axis([0 30 0 1.4]);
grid;
xlabel('t, c');
ylabel('h(t)');
title('Схема 1')
legend('Колебательный k=0.5','Апериодический k=0.2','Монотонный k=0.1','Location','southeast')
saveas(A,'D:/Programming/Web/matlabWeb/src/outputs/lab3/1.png')
close
hold on
B=plot(out.tout,out.ScopeData4.signals.values);
plot(out.tout,out.ScopeData5.signals.values);
plot(out.tout,out.ScopeData3.signals.values);
axis([0 30 0 1.65]);
grid;
xlabel('t, c');
ylabel('h(t)');
title('Схема 2')
legend('Апериодический k=1','Монотонный k=0.2','Колебательный k=2','Location','southeast')
saveas(B,'D:/Programming/Web/matlabWeb/src/outputs/lab3/2.png')
close
hold on
C=plot(out.tout,out.ScopeData6.signals.values);
plot(out.tout,out.ScopeData7.signals.values);
axis([0 40 0 0.6]);
grid;
xlabel('t, c');
ylabel('h(t)');
title('Схема 3')
legend('Линейная ОС','Нелинейный КУ','Location','southeast')
saveas(C,'D:/Programming/Web/matlabWeb/src/outputs/lab3/3.png')
close
hold on
D=plot(out.tout,out.ScopeData8.signals.values);
plot(out.tout,out.ScopeData9.signals.values);
plot(out.tout,out.ScopeData10.signals.values);
axis([0 40 0 1.4]);
grid;
xlabel('t, c');
ylabel('h(t)');
title('Схема 4')
legend('Без коррекции','Корекция с k=1','Корекция с k=7.5','Location','southeast')
saveas(D,'D:/Programming/Web/matlabWeb/src/outputs/lab3/4.png')
close
h(1,:)=out.ScopeData.signals.values;
h(2,:)=out.ScopeData1.signals.values;
h(3,:)=out.ScopeData2.signals.values;
h(4,:)=out.ScopeData4.signals.values;
h(5,:)=out.ScopeData5.signals.values;
h(6,:)=out.ScopeData3.signals.values;
h(7,:)=out.ScopeData6.signals.values;
h(8,:)=out.ScopeData7.signals.values;
h(9,:)=out.ScopeData8.signals.values;
h(10,:)=out.ScopeData9.signals.values;
h(11,:)=out.ScopeData10.signals.values;
for i=1:11
t(i)=out.tout(find(~((h(i,:)>h(i,length(h(i,:)))*0.95)&(h(i,:)<h(i,length(h(i,:)))*1.05)),1,'last'));
end
fprintf(fopen('outputs\Итог.txt','w'), '%6.4f\n', t);
fclose('all');