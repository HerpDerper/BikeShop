package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Booking;
import org.springframework.data.repository.CrudRepository;

public interface BookingRepository extends CrudRepository<Booking, Long> {

}