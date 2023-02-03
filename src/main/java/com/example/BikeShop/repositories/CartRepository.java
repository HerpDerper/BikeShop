package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Long> {

    Iterable<Cart> findByClientUserUsername(String username);

    Iterable<Cart> findByClientUserUsernameAndProductActive(String username, boolean active);
}