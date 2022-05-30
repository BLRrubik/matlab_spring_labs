package ru.rubik.matlabweb.services;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

@Service
public class Lab3FileService {
    private String fileStoragePath;
    private List<Double> properties;

    public Lab3FileService() {
        fileStoragePath = "D:\\Programming\\Java\\Matlab\\src\\main\\java\\ru\\rubik\\matlabweb\\matlab\\lab3\\outputs\\";
        properties = new ArrayList<>();
    }

    public List<Double> process() {
        String finalPath = fileStoragePath + "\\Итог.txt";
        try {
            if (Files.readString(Path.of(finalPath)).length() == 0) {
                throw new IOException();
            }

            String strings = Files.readString(Path.of(finalPath));
            String[] lines = strings.split("[\r\n]+");
            for (String line: lines) {
                properties.add(Double.parseDouble(line));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }


}
