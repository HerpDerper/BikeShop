package com.example.BikeShop.models;

import org.springframework.security.core.GrantedAuthority;

//Перечисление ролей
public enum Role implements GrantedAuthority {

    ADMIN, //Админ БД
    HR_DEP, //Сотрудник отдела кадров
    SALES_DEP, //Сотрудник отдела продаж
    DIRECTOR, //Директор (суперпользователь)
    MERCHANDISER, //Товаровед
    REPAIR_DEP, //Сотрудник отдела ремонта
    CUSTOMER_SERVICE_DEP, //Сотрудник отдела по работе с клиентами
    CLIENT; //Клиент

    @Override
    public String getAuthority() {
        return name();
    }

}