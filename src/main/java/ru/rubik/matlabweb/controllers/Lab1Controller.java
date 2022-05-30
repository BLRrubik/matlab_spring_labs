package ru.rubik.matlabweb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.rubik.matlabweb.DTO.ResultDTO;
import ru.rubik.matlabweb.properties.Property;
import ru.rubik.matlabweb.services.Lab1Service;
import ru.rubik.matlabweb.services.Lab2Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/lab1")
public class Lab1Controller {



    @Autowired
    private Lab1Service lab1Service;

    @PostMapping("/process")
    public void process() throws IOException, InterruptedException {
        lab1Service.initLab();
    }


}
