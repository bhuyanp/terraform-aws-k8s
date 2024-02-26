package com.example.productservice.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.lang.annotation.Documented;

@Builder
//@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

    //@Id
    private Long id;
    private String title;
    private String description;

}
