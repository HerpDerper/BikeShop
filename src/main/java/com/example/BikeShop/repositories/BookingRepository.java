package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookingRepository extends JpaRepository<Booking, Long> {

}