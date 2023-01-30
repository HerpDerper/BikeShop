package com.example.BikeShop.components;

import com.example.BikeShop.repositories.ColorRepository;
import com.example.BikeShop.repositories.StatusRepository;
import com.example.BikeShop.seeders.ColorSeeder;
import com.example.BikeShop.seeders.StatusSeeder;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class Listener {

    private final ColorRepository colorRepository;

    private final StatusRepository statusRepository;

    public Listener(ColorRepository colorRepository, StatusRepository statusRepository) {
        this.colorRepository = colorRepository;
        this.statusRepository = statusRepository;
    }

    @EventListener
    public void handleContextRefresh(ContextRefreshedEvent event) {
        ColorSeeder.seed(colorRepository);
        StatusSeeder.seed(statusRepository);
    }
}
