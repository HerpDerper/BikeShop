package com.example.BikeShop.controllers;

import com.example.BikeShop.models.Employee;
import com.example.BikeShop.repositories.EmployeeRepository;
import com.example.BikeShop.repositories.UserRepository;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@PreAuthorize("hasAnyAuthority('HR_DEP')")
@RequestMapping("/employee")
@Controller
public class EmployeeController {

    private final EmployeeRepository employeeRepository;

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    public EmployeeController(EmployeeRepository employeeRepository, UserRepository userRepository,
                              PasswordEncoder passwordEncoder) {
        this.employeeRepository = employeeRepository;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("index")
    public String employeeIndex(Model model) {
        model.addAttribute("employees", employeeRepository.findAll());
        return "employee/Index";
    }

    @GetMapping("/filter")
    public String employeeFilter(@RequestParam(required = false) String username, Model model) {
        Iterable<Employee> employees;
        if (username != null && !username.equals(""))
            employees = employeeRepository.findByUserUsernameContains(username);
        else
            employees = employeeRepository.findAll();
        model.addAttribute("employees", employees);
        return "employee/Index";
    }

    @GetMapping("sort")
    public String clientTariffIFilter(@RequestParam String sortProperty, @RequestParam boolean sortType, Model model) {
        Iterable<Employee> employees;
        switch (sortProperty) {
            case "Фамилия" -> sortProperty = "surname";
            case "Имя" -> sortProperty = "name";
            case "Отчество" -> sortProperty = "patronymic";
            case "Дата рождения" -> sortProperty = "dateBirth";
        }
        if (sortType)
            employees = employeeRepository.findAll(Sort.by(sortProperty).ascending());
        else
            employees = employeeRepository.findAll(Sort.by(sortProperty).descending());
        model.addAttribute("employees", employees);
        return "employee/Index";
    }
}
