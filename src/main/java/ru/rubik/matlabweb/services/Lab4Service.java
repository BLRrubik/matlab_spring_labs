package ru.rubik.matlabweb.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class Lab4Service {
    @Autowired
    private Lab4FileService service;

    public void initLab() throws IOException, InterruptedException {

        Process proc = Runtime.getRuntime().exec(
                "D:\\Programms\\Matlab\\bin\\matlab.exe " +
                        "-batch " +
                        "\"run(" +
                        "'D:\\Programming\\Java\\Matlab\\src\\main\\java\\ru\\rubik\\matlabweb\\matlab\\lab4\\main.m'" +
                        ");" +
                        " if " +
                        "~isempty(groot().Children) " +
                        "uiwait; " +
                        "end;\"");

        TimeUnit.SECONDS.sleep(25);
    }

    public List<Double> processLab() {
        return service.process();
    }
}
