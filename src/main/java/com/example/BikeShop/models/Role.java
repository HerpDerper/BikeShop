package com.example.BikeShop.models;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {

    ADMIN, HR_DEP, SALES_DEP, DIRECTOR, MERCHANDISER, REPAIR_DEP, CUSTOMER_SERVICE_DEP, CLIENT;

    @Override
    public String getAuthority() {
        return name();
    }

}