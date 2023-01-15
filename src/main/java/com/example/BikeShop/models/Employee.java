package com.example.BikeShop.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import java.util.Date;

public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idEmployee;

    @Pattern(regexp = "[а-яА-Я]{1,30}", message = "Имя должно быть от 1 до 30 символов и состоять только из букв")
    private String name;

    @Pattern(regexp = "[а-яА-Я]{1,30}", message = "Фамилия должна быть от 1 до 30 символов и состоять только из букв")
    private String surname;

    @Pattern(regexp = "[а-яА-Я]{0,30}", message = "Отчество должно быть от 0 до 30 символов и состоять только из букв")
    private String patronymic;

    @NotNull(message = "Дата рождения не должна быть пустой")
    @Past(message = "Дата рождения не может быть будущей")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date dateBirth;

    @Pattern(regexp = "[0-9]{4}", message = "Некорректный ввод номера паспорта")
    private String passportSeries;

    @Pattern(regexp = "[0-9]{6}", message = "Некорректный ввод серии паспорта")
    private String passportNumber;

    @NotBlank(message = "Адрес не должен быть пустым или состоять из одних лишь пробелов")
    private String address;

    @Pattern(regexp = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7}$", message = "Номера телефона должен состоять из 11 цифр и иметь данный формат: +7(999)9999999 или 8(999)9999999")
    private String phoneNumber;


}
