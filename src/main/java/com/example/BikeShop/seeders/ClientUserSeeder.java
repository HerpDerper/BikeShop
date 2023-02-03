package com.example.BikeShop.seeders;

import com.example.BikeShop.models.Client;
import com.example.BikeShop.models.Role;
import com.example.BikeShop.models.User;
import com.example.BikeShop.repositories.ClientRepository;
import com.example.BikeShop.repositories.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ClientUserSeeder {

    private static final List<Client> clientList = new ArrayList<>();

    private static final List<User> userList = new ArrayList<>();

    private static void init(PasswordEncoder passwordEncoder) {
        userList.add(new User("CLIENT1", passwordEncoder.encode("CLIENT1"), true, Collections.singleton(Role.CLIENT)));
        userList.add(new User("CLIENT2", passwordEncoder.encode("CLIENT2"), true, Collections.singleton(Role.CLIENT)));
        userList.add(new User("CLIENT3", passwordEncoder.encode("CLIENT3"), true, Collections.singleton(Role.CLIENT)));
        userList.add(new User("CLIENT4", passwordEncoder.encode("CLIENT4"), true, Collections.singleton(Role.CLIENT)));
        userList.add(new User("CLIENT5", passwordEncoder.encode("CLIENT5"), true, Collections.singleton(Role.CLIENT)));

        clientList.add(new Client("Иванов", "Иван", "Иванович", "+7(999)999-91-91", userList.get(0)));
        clientList.add(new Client("Петров", "Петр", "Петрович", "+7(999)999-92-92", userList.get(1)));
        clientList.add(new Client("Антонов", "Антон", "Антонович", "+7(999)999-93-93", userList.get(2)));
        clientList.add(new Client("Соколова", "Лариса", "Алексеевна", "+7(999)999-94-94", userList.get(3)));
        clientList.add(new Client("Волкова", "Вероника", "Вадимовна", "+7(999)999-95-95", userList.get(4)));
    }

    public static void seed(PasswordEncoder passwordEncoder, UserRepository userRepository, ClientRepository clientRepository) {
        init(passwordEncoder);
        for (int i = 0; i < userList.size(); i++) {
            if (userRepository.findByUsername(userList.get(i).getUsername()) == null) {
                userRepository.save(userList.get(i));
                clientRepository.save(clientList.get(i));
            }
        }
    }
}
