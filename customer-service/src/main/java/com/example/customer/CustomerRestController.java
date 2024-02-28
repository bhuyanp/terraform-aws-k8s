package com.example.customer;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/customer")
public class CustomerRestController {
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<String>> getAllProducts(){
        return ResponseEntity.of(Optional.of(List.of(
                "Customer 1",
                "Customer 2"
        )));
    }
}
