package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Image;
import com.example.BikeShop.models.Product;
import org.springframework.data.repository.CrudRepository;

public interface ImageRepository extends CrudRepository<Image, Long> {

    Image findImageByProduct(Product product);
}
