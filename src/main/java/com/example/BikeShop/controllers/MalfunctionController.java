package com.example.BikeShop.controllers;

import com.example.BikeShop.models.Booking;
import com.example.BikeShop.models.Malfunction;
import com.example.BikeShop.models.Status;
import com.example.BikeShop.repositories.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@PreAuthorize("hasAnyAuthority('REPAIR_DEP') or hasAnyAuthority('DIRECTOR')")
@RequestMapping("/malfunction")
@Controller
public class MalfunctionController {

    private final BookingRepository bookingRepository;


    public MalfunctionController(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    @PostMapping("edit")
    public String malfunctionEdit(@RequestParam Booking booking,
                                  @RequestParam List<Malfunction> malfunctions) {
        booking.setMalfunctionList(malfunctions);
        bookingRepository.save(booking);
        return "redirect:/booking/index";
    }
}
