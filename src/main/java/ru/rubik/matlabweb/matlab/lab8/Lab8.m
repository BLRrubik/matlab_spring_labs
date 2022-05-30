clc;
clear;
path = "D:/Programming/Web/matlabWeb/src/outputs/lab8/";
out=sim('lab8cxem.slx');
figure
plot(out.tout,out.ScopeData22.signals.values, 'b')
title('Ток нагрузки');
ylabel('I_н, A')
xlabel('t, с')
grid
text(15,100,{'Параметры регулятора',['P: ',get_param('lab8cxem/PID Controller','P')],[' I: ',get_param('lab8cxem/PID Controller','I')]})
saveas(gcf, path + 1, 'png')
%print('1','-djpeg');
close
figure
hold on
plot(out.tout,out.ScopeData3.signals(1).values)
plot(out.tout,out.ScopeData3.signals(2).values)
xlabel('t, c');
ylabel('I, A');
title('ШИМ-сигнал');
grid
%print('2','-djpeg');
saveas(gcf, path + 2, 'png')
close
figure
hold on
plot(out.tout,out.ScopeData3.signals(1).values)
plot(out.tout,out.ScopeData3.signals(2).values)
xlabel('t, c');
ylabel('I, A');
title('ШИМ-сигнал(приближенный)')
grid
axis([2 2.01 0 1])
%print('3','-djpeg');
saveas(gcf, path + 3, 'png')
close
figure
hold on
plot(out.tout,out.ScopeData5.signals.values, 'g')
plot(out.tout,out.ScopeData22.signals.values, 'b')
plot(out.tout,out.ScopeData1.signals.values, 'r')
title('Влияние частоты ШИМ на ток нагрузки')
grid
ylabel('I_н, A')
xlabel('t, с')
legend('Частота, уменьшенная вдвое','Заданная частота','Частота, увеличенная вдвое', 'location', 'southeast')
axis([0 5 0 140])
%print('4','-djpeg')
saveas(gcf, path + 4, 'png')
close
hold on
plot(out.tout,out.ScopeData2.signals(1).values)
plot(out.tout,out.ScopeData2.signals(2).values)
xlabel('t, c');
ylabel('I, A');
title('ШИМ-сигнал(приближенный) удвоенной частоты')
grid
axis([2 2.01 0 1])
%print('5','-djpeg');
saveas(gcf, path + 5, 'png')
close
hold on
plot(out.tout,out.ScopeData6.signals(1).values)
plot(out.tout,out.ScopeData6.signals(2).values)
xlabel('t, c');
ylabel('I, A');
title('ШИМ-сигнал(приближенный) уменьшенной вдвое частоты')
grid
axis([2 2.01 0 1])
%print('6','-djpeg');
saveas(gcf, path + 6, 'png')
close
