package ru.rubik.matlabweb.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.rubik.matlabweb.properties.Property;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;


@Service
public class Lab1Service {
    @Autowired
    private Lab2FileService lab1FileService;

    public void initLab() throws IOException, InterruptedException {

        Process proc = Runtime.getRuntime().exec(
                "C:\\Program Files\\MATLAB\\R2022a\\bin\\matlab.exe " +
                        "-batch " +
                        "\"run(" +
                        "'E:\\project\\matlab_spring_labs\\src\\main\\java\\ru\\rubik\\matlabweb\\matlab\\lab1\\lab1.m'" +
                        ");" +
                        " if " +
                        "~isempty(groot().Children) " +
                        "uiwait; " +
                        "end;\"");

        TimeUnit.SECONDS.sleep(25);
    }

    public List<Property> processResult(String path) {
        return lab1FileService.getProperties(path);
    }
}
