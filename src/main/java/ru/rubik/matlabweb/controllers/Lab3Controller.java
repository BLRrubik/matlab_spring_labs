package ru.rubik.matlabweb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.rubik.matlabweb.services.Lab3FileService;
import ru.rubik.matlabweb.services.Lab3Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping("/lab3")
public class Lab3Controller {
    @Autowired
    private Lab3Service service;

    @PostMapping
    public Map<String, List<Double>> process() throws IOException, InterruptedException {
        service.initLab();

        Map<String, List<Double>> map = new HashMap<>();
        map.put("result", service.process());
        return map;
    }
}
