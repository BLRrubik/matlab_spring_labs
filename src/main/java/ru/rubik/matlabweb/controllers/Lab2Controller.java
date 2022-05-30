package ru.rubik.matlabweb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.rubik.matlabweb.DTO.ResultDTO;
import ru.rubik.matlabweb.properties.Property;
import ru.rubik.matlabweb.services.Lab2Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@CrossOrigin("*")//
@RestController
@RequestMapping("/lab2")
public class Lab2Controller {
    private List<Property> primeProperty = new ArrayList<>();
    private List<Property> backProperty = new ArrayList<>();


    @Autowired
    private Lab2Service lab2Service;

    @PostMapping("/process")
    public ResponseEntity<ResultDTO> processLab() throws IOException, InterruptedException {

        lab2Service.initLab();

        primeProperty = lab2Service.processResult("inPrime");
        backProperty = lab2Service.processResult("inBack");


        return ResponseEntity.of(Optional.of(new ResultDTO(primeProperty, backProperty)));
    }


}
