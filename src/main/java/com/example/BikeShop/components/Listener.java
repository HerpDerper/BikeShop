package com.example.BikeShop.components;

import com.example.BikeShop.repositories.*;
import com.example.BikeShop.seeders.ClientUserSeeder;
import com.example.BikeShop.seeders.ColorSeeder;
import com.example.BikeShop.seeders.MalfunctionSeeder;
import com.example.BikeShop.seeders.StatusSeeder;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class Listener {

   // private final PasswordEncoder passwordEncoder;

    private final UserRepository userRepository;

    private final ClientRepository clientRepository;

    private final ColorRepository colorRepository;

    private final StatusRepository statusRepository;

    private final MalfunctionRepository malfunctionRepository;

    public Listener(/*PasswordEncoder passwordEncoder,*/ UserRepository userRepository,
                    ClientRepository clientRepository, ColorRepository colorRepository,
                    StatusRepository statusRepository, MalfunctionRepository malfunctionRepository) {
     //   this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.clientRepository = clientRepository;
        this.colorRepository = colorRepository;
        this.statusRepository = statusRepository;
        this.malfunctionRepository = malfunctionRepository;
    }

    @EventListener
    public void handleContextRefresh(ContextRefreshedEvent event) {
      //  ClientUserSeeder.seed(passwordEncoder, userRepository, clientRepository);
        ColorSeeder.seed(colorRepository);
        StatusSeeder.seed(statusRepository);
        MalfunctionSeeder.seed(malfunctionRepository);
    }
}
