package com.example.BikeShop.models;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

public class Color {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idColor;

    @Pattern(regexp = "[а-яА-Я]{1,50}", message = "Наименование цвета должно быть от 1 до 50 символов и состоять только из букв")
    private String name;

    public Color() {
    }

    public Color(String name) {
        this.name = name;
    }

    public Long getIdColor() {
        return idColor;
    }

    public void setIdColor(Long idColor) {
        this.idColor = idColor;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}