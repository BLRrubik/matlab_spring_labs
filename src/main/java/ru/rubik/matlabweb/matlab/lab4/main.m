clear;

mkdir("outputs")
fprintf(fopen('outputs\out.txt','w'),"");
fclose('all')
mkdir("D:/Programming/Web/matlabWeb/src/outputs/lab4")
out = sim("simulink/models4.slx");
Data = [out.sc, out.sc1, out.sc2, out.sc3, out.sc4, out.sc5,];
B = [6, 0.9, 1.6, 1.5, 1.9, 1.6];

k = 1;
names = ["зона нечувствительности";
    "насыщение";
    "зона нечувствительности с насыщением";
    "двухпозиционное реле";
    "трехпозиционное реле";
    "гистерезис"];
str1 = "Реакции систем с элементом";
for counter = 1:1:6
    figure( 'Position', [100+counter*100, 50, 1000, 900]);
    plot(Data(:, k), Data(:, k+3), '--b', ...
        Data(:, k), Data(:, k+2), 'r', ...
        Data(:, k), Data(:, k+1), 'k', 'LineWidth', 1)

    grid on;
    pax = gca;
    pax.GridAlpha = 1;
  
    ylim auto
    legend({'без нелинейного элемента', 'с нелинейным эл-том без вибр.', 'с нелинейным эл-том с вибр.'});
    xlabel('t');
    ylabel('x');
    str = "D:/Programming/Web/matlabWeb/src/outputs/lab4/" + counter + ".png";
    mkdir output
    fprintf(fopen('outputs\out.txt','a'), '%1.1f\r', B(counter));
    saveas(gcf, str)
    k = k + 4;
    close all;
end

