package com.example.BikeShop.repositories;

import com.example.BikeShop.models.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

    User findUserByUsername(String username);
}

