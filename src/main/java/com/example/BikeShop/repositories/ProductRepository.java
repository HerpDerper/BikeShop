package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<Product, Long> {
}
