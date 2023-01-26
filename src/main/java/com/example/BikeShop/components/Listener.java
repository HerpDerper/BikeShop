package com.example.BikeShop.components;

import com.example.BikeShop.repositories.ColorRepository;
import com.example.BikeShop.seeders.ColorSeeder;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class Listener {

    private final ColorRepository colorRepository;

    public Listener(ColorRepository colorRepository) {
        this.colorRepository = colorRepository;
    }

    @EventListener
    public void handleContextRefresh(ContextRefreshedEvent event) {
        ColorSeeder.seed(colorRepository);
    }
}
