clear;

mkdir("D:/Programming/Web/matlabWeb/src/outputs/lab2/");
mkdir("D:/Programming/Web/matlabWeb/src/outputs/lab2/inBack");
mkdir("D:/Programming/Web/matlabWeb/src/outputs/lab2/inPrime");
mkdir("outputs/inBack");
mkdir("outputs/inPrime");

out = sim("simulink/models.slx");

file1 = fopen('outputs/inPrime/output.txt', 'w+');
file2 = fopen('outputs/inBack/output.txt', 'w+');
delete('D:/Programming/Web/matlabWeb/src/outputs/lab2/inBack/*.png');
delete('D:/Programming/Web/matlabWeb/src/outputs/lab2/inPrime/*.png');

fclose('all');

dataWithKinPrime = [out.outData';
    out.outData1';
    out.outData2';
    out.outData3';
    out.outData4';
    out.outData5';
    out.outData6';
    out.outData7';
    out.outData8'];

dataWithKinBack = [out.outData9';
    out.outData10';
    out.outData11';
    out.outData12';
    out.outData13';
    out.outData14';
    out.outData15';
    out.outData16';
    out.outData17'];

time = out.tout;
k = [0.5, 1, 10];

names = ["Зона нечувствительности";
    "Насыщение";
    "Зона нечувствительности с насыщением";
    "Двухпозиционное реле";
    "Трехпозиционное реле";
    "Гистерезис"];

titleInFile = 1;


for i = 1:1:18
   figure;
   if (i>3 && i<10) || i>12
       if(i<12)
           titleString = sprintf('Переходная характеристика. %s', names(i-3));
           plotName = names(i-3);
       else
           titleString = sprintf('Переходная характеристика. %s', names(i-12));
           plotName = names(i-12);
       end
   else
       if(i>9)
           titleString = sprintf('Переходная характеристика. k = %2.1f', k(i-9));
           titleInFile = 2;
           plotName = k(i-9);
       else
           titleString = sprintf('Переходная характеристика. k = %2.1f', k(i));
           titleInFile = 1;
           plotName = k(i);
       end
   end
   if i<10
        [overshoot, time_n, time_r] = options(dataWithKinPrime(i, :), time);
        filename = "D:/Programming/Web/matlabWeb/src/outputs/lab2/inPrime/" + i+ ".png";
        saveGrafics(dataWithKinPrime(i, :), time, filename, titleString);
   else
       [overshoot, time_n, time_r] = options(dataWithKinBack(i-9, :), time);
       filename = "D:/Programming/Web/matlabWeb/src/outputs/lab2/inBack/" + (i-9) + ".png";
       saveGrafics(dataWithKinBack(i-9, :), time, filename, titleString);
   end

   if (titleInFile == 1)
      file = fopen('outputs/inPrime/output.txt', 'a');
      saveToFileParams(file, titleString, overshoot, time_n, time_r);
   else
      file = fopen('outputs/inBack/output.txt', 'a');
      saveToFileParams(file, titleString, overshoot, time_n, time_r);
   end
    close("all");
end

function saveGrafics(data, time, filename, titleString)
   fig = plot(time, data);
   grid on;
   title(titleString);
   xlabel('t');
   ylabel('h(t)');
   saveas(fig, filename);
end

function saveToFileParams(file, titleString, overshoot, time_n, time_r)
      fprintf(file, titleString);
      fprintf(file, "\nПеререгулирование: %2.0f %%\nВремя нарастания: %4.2f\nВремя регулирования: %4.2f\n", overshoot*100, time_n, time_r);
      fprintf(file, "\n");
      fclose(file);
end

function [overshoot, time_n, time_r] = options(data, time)
    if (data(end) - data(end - 1) > 0.000001)
        overshoot = NaN;
        time_n = NaN;
        time_r = NaN;
        return;
    else
        stateValue = data(end);
        maxValue = max(data);
        overshoot = (maxValue - stateValue) / stateValue;
        downLine = stateValue * 0.95;
        upLine = stateValue * 1.05;
        index_n = tn(data, downLine);
        index_r = tr(data, downLine, upLine);
        time_n = time(data == index_n );
        time_r = time(data == index_r);

        return;
    end
end

function value = tr(data, downLine, upLine)
    flag = 0;
    arr = [];
    data = data';
    for i = 1:1:length(data)
        if data(i) < downLine | data(i) > upLine
                arr(length(arr)+1) = data(i);
        end
    end
    value = arr(find(arr, 1, 'last'));

    return;
end

function value = tn(data, downLine)
    data = data';
    for i = 1:1:length(data)
        if data(i) >= downLine
           value = data(i);
           return;
        end
    end
end
