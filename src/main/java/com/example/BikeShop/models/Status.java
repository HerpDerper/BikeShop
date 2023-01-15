package com.example.BikeShop.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

//Статус
@Entity
public class Status {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idStatus;

    @Pattern(regexp = "[а-яА-Я]{1,50}", message = "Наименование статуса должно быть от 1 до 50 символов и состоять только из букв")
    private String name;

    public Status() {
    }

    public Status(String name) {
        this.name = name;
    }

    public Long getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(Long idStatus) {
        this.idStatus = idStatus;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}