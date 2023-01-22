package com.example.BikeShop.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RoleController {

    @PostMapping("/main")
    public String getMainPage() {
        return switch (getRoleType(SecurityContextHolder.getContext().getAuthentication())) {
            case "ADMIN" -> "redirect:/database/index";
            case "HR_DEP" -> "redirect:/employee/index";
            case "SALES_DEP" -> "redirect:/database/index";
            case "DIRECTOR" -> "redirect:/database/index";
            case "MERCHANDISER" -> "redirect:/database/index";
            case "REPAIR_DEP" -> "redirect:/database/index";
            case "CUSTOMER_SERVICE_DEP" -> "redirect:/database/index";
            default -> "redirect:/database/index";
        };
    }

    public String getRoleType(Authentication auth) {
        return auth.getAuthorities().toArray()[0].toString();
    }
}