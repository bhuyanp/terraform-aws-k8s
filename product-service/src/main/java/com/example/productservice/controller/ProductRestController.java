package com.example.productservice.controller;

import com.example.productservice.model.Product;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/product")
public class ProductRestController {

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<Product>> getAllProducts(){
        return ResponseEntity.of(Optional.of(List.of(
                new Product(101L, "ProductA", "Description of product A"),
                new Product(102L, "ProductA", "Description of product A")
        )));
    }
}
