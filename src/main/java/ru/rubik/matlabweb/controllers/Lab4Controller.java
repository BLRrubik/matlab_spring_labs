package ru.rubik.matlabweb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.rubik.matlabweb.services.Lab4Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping("/lab4")
public class Lab4Controller {
    @Autowired
    private Lab4Service service;

    @PostMapping
    public Map<String, List<Double>> process() throws IOException, InterruptedException {
        service.initLab();

        Map<String, List<Double>> map = new HashMap<>();
        map.put("result", service.processLab());

        return map;
    }
}
