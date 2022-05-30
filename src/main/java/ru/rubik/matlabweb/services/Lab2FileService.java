package ru.rubik.matlabweb.services;

import org.springframework.stereotype.Service;
import ru.rubik.matlabweb.properties.Property;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

@Service
public class Lab2FileService {
    private String fileStoragePath;
    private List<Property> properties;

    public Lab2FileService() {
        fileStoragePath = "D:\\Programming\\Java\\Matlab\\src\\main\\java\\ru\\rubik\\matlabweb\\matlab\\lab2\\outputs\\";
        properties = new ArrayList<>();
    }

    public List<Property> getProperties(String path) {
        List<Property> properties = new ArrayList<>();
        String finalPath = fileStoragePath + path + "\\output.txt";
        try {
            if (Files.readString(Path.of(finalPath)).length() == 0) {
                throw new IOException();
            }

            String strings = Files.readString(Path.of(finalPath));
            String[] lines = strings.split("[\r\n]+");
            List<String> strings1 = new ArrayList<>();

            for(String line: lines) {
                if (line.startsWith("Переходная характеристика.")){
                    continue;
                }
                strings1.add(line);
            }

            Property property = null;
            int counter = 1;
            for (int i = 0, flag = 0; i < strings1.size(); i++, flag++) {
                if (i % 3 == 0) {
                    property = new Property();
                    flag = 0;
                }
                Double time_n;
                Double overshoot;
                Double time_r;
                switch (flag){
                    case 0:
                        if (!isNan(strings1.get(i))){
                            overshoot = Double.parseDouble(strings1.get(i).split(":")[1].trim().split(" ")[0]);
                        }
                        else overshoot = null;
                        property.setOvershoot(overshoot);
                        property.setId(counter++);
                        continue;
                    case 1:
                        if (!isNan(strings1.get(i))){
                            time_n = Double.parseDouble(strings1.get(i).split(":")[1].trim().split(" ")[0]);
                        }
                        else time_n = null;
                        property.setTime_n(time_n);
                        continue;
                    case 2:
                        if (!isNan(strings1.get(i))){
                            time_r = Double.parseDouble(strings1.get(i).split(":")[1].trim().split(" ")[0]);
                        }
                        else time_r = null;
                        property.setTime_r(time_r);
                        properties.add(property);
                        continue;
                }
            }
        } catch (IOException e) {
            System.out.println("Невозможно прочитать один или несколько файлов с отчётом." +
                    "(" + path + ") " +
                    "Возможно, файл не находится в нужной директории " +
                    "или некорректный");
        }

        return properties;
    }


    private boolean isNan(String string) {
        return string.split(":")[1].trim().split(" ")[0].equals("NaN");
    }

}
