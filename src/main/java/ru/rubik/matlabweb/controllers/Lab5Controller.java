package ru.rubik.matlabweb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.rubik.matlabweb.services.Lab5Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping("/lab5")
public class Lab5Controller {
    @Autowired
    private Lab5Service lab5Service;

    @PostMapping
    public Map<String, String> process() throws IOException, InterruptedException {
        lab5Service.initLab();
        Map<String,String> map = new HashMap<>();
        map.put("message", "OK");
        return map;
    }
}
