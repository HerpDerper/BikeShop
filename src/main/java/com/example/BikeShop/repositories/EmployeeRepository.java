package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee,Long> {

    Iterable<Employee> findByUserUsernameContains (String username);
}