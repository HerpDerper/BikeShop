package com.example.BikeShop.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;

public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idProduct;

    @NotBlank(message = "Наименование товара не должено быть пустым или состоять из одних лишь пробелов")
    @Size(min = 1, max = 30, message = "Наименование товара не должено быть от 1 до 30 символов")
    private String name;

    @Min(value = 1, message = "Цена товара должна быть больше 0")
    @NotNull(message = "Цена товара не должна быть пустой")
    private int price;

    @NotNull(message = "Дата поступления на склад не должна быть пустой")
    @Past(message = "Дата поступления на склад не может быть будущей")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date dateReceipt;

    @Min(value = 0, message = "Количество товара должно быть больше или равно 0")
    @NotNull(message = "Количество товара не должна быть пустым")
    private int count;
}
