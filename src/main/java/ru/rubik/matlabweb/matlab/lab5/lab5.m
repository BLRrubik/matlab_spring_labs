clear;

mkdir("D:/Programming/Web/matlabWeb/src/outputs/lab5/")
delete('outputs/*.png'); 


out = sim("simulink/lab.slx");
time = out.tout;

data = [
    out.x11.signals.values'
    out.x12.signals.values'
    out.x21.signals.values'
    out.x22.signals.values'
    out.x31.signals.values'
    out.x32.signals.values'
    out.x41.signals.values'
    out.x42.signals.values'
    ];

namesOfElements = [
    "Двухпозиционное реле"
    "Трехпозиционное реле"
    "Гистерезис"
    "Трехпозиционное реле с гистерезисом"
    ];

lablesOfGrafics = [
    "Фазовая траектория"
    "График движения выходной координаты"
    "График движения производной"
];

for i = 1:2:8
    for j = 1:1:3
        if(i == 1)
            plotTitle = sprintf("%s\n%s",namesOfElements(i), lablesOfGrafics(j));
            filename = sprintf("D:/Programming/Web/matlabWeb/src/outputs/lab5/%d%d.png", i, j);
        else
            plotTitle = sprintf("%s\n%s",namesOfElements((i+1)/2), lablesOfGrafics(j)); 
            filename = sprintf("D:/Programming/Web/matlabWeb/src/outputs/lab5/%d%d.png",i, j);
        end
        switch(j)
            case 1
              fig = createPlotOfPhase(data(i,:), data(i+1,:), plotTitle);
              savePlots(fig,filename);
              close ALL;
              continue;
            case 2
              fig = createPlotOfTraectory(time, data(i,:), plotTitle);
              savePlots(fig,filename);
              close ALL;
              continue;
            case 3
              fig = createPlotOfTraectory(time, data(i+1,:), plotTitle);
              savePlots(fig,filename);
              close ALL;
              continue;
        end
        
    end
    
end

function fig = createPlotOfTraectory(time, data, plotTitle)
    figure;
    fig = plot(time, data);
    grid on;
    xlabel("x");
    ylabel("y");
    title(plotTitle);
    return;
end

function fig = createPlotOfPhase(data, diffData, plotTitle) 
    figure;
    fig = plot(data, diffData);
    grid on;
    xlabel("x");
    ylabel("y");
    title(plotTitle);
    return;
end

function savePlots(fig, filename)
   saveas(fig, filename);
end














