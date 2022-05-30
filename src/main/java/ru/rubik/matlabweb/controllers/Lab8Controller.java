package ru.rubik.matlabweb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.rubik.matlabweb.services.Lab8Service;

import java.io.IOException;

@RestController
@RequestMapping("/lab8")
@CrossOrigin("*")
public class Lab8Controller {
    @Autowired
    private Lab8Service service;

    @PostMapping
    public void process() throws IOException, InterruptedException {
        service.initLab();
    }
}
