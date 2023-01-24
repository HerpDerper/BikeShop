package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {

    Iterable<Product> findByNameContains(String name);
}
