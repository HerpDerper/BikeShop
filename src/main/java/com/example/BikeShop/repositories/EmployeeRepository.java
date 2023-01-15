package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Employee;
import org.springframework.data.repository.CrudRepository;

public interface EmployeeRepository extends CrudRepository<Employee,Long> {
}