package ru.rubik.matlabweb.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.rubik.matlabweb.properties.Property;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;


@Service
public class Lab2Service {
    @Autowired
    private Lab2FileService lab2FileService;

    public void initLab() throws IOException, InterruptedException {

        Process proc = Runtime.getRuntime().exec(
                "D:\\Programms\\Matlab\\bin\\matlab.exe " +
                        "-batch " +
                        "\"run(" +
                        "'D:\\Programming\\Java\\matlabWeb\\src\\main\\java\\ru\\rubik\\matlabweb\\matlab\\lab2\\main.m'" +
                        ");" +
                        " if " +
                        "~isempty(groot().Children) " +
                        "uiwait; " +
                        "end;\"");

        TimeUnit.SECONDS.sleep(25);
    }

    public List<Property> processResult(String path){
        return lab2FileService.getProperties(path);
    }
}
