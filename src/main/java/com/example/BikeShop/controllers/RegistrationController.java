package com.example.BikeShop.controllers;

import com.example.BikeShop.models.Client;
import com.example.BikeShop.models.Role;
import com.example.BikeShop.models.User;
import com.example.BikeShop.repositories.ClientRepository;
import com.example.BikeShop.repositories.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Collections;

@Controller
public class RegistrationController {

    private final PasswordEncoder passwordEncoder;

    private final UserRepository userRepository;

    private final ClientRepository clientRepository;

    public RegistrationController(UserRepository userRepository, ClientRepository clientRepository,
                                  PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.clientRepository = clientRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/registration")
    public String registration(@ModelAttribute("user") User user, @ModelAttribute("client") Client client) {
        return "user/Create";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("user") @Valid User user, BindingResult bindingResultUser,
                               @ModelAttribute("client") @Valid Client client, BindingResult bindingResultClient,
                               @RequestParam String passwordSubmit,
                               Model model) {
        if (userRepository.findByUsername(user.getUsername()) != null) {
            bindingResultUser.addError(new ObjectError("username", "Данный логин уже занят"));
            model.addAttribute("errorMessageUsername", "Данный логин уже занят");
        }
        if (!passwordSubmit.equals(user.getPassword())) {
            bindingResultUser.addError(new ObjectError("password", "Пароли не совпадают"));
            model.addAttribute("errorMessagePassword", "Пароли не совпадают");
        }
        if (bindingResultUser.hasErrors() || bindingResultClient.hasErrors())
            return "user/Create";
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.CLIENT));
        userRepository.save(user);
        client.setUser(user);
        clientRepository.save(client);
        return "redirect:/login";
    }

    @GetMapping("/edit")
    public String edit(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("user", userRepository.findByUsername(authentication.getName()));
        return "user/Edit";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute("user") @Valid User user, BindingResult bindingResultUser,
                       @RequestParam(required = false) String password,
                       @RequestParam(required = false) String passwordSubmit,
                       Model model) {
        if (userRepository.findByUsername(user.getUsername()) != null &&
                !userRepository.findByUsername(user.getUsername()).getIdUser().equals(user.getIdUser())) {
            bindingResultUser.addError(new ObjectError("username", "Данный логин уже занят"));
            model.addAttribute("errorMessageUsername", "Данный логин уже занят");
        }
        if (!passwordSubmit.equals(password)) {
            bindingResultUser.addError(new ObjectError("password", "Пароли не совпадают"));
            model.addAttribute("errorMessagePasswordSubmit", "Пароли не совпадают");
        }
        if (!password.equals("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()â€\\\"[{}]:;'.,?/*~$^+=<>]).{8,255}$\"")) {
            bindingResultUser.addError(new ObjectError("password", "Пароли не совпадают"));
            model.addAttribute("errorMessagePassword", "Пароли не совпадают");
        }
        if (bindingResultUser.hasErrors())
            return "user/Edit";
        if (password.isBlank())
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/main";
    }
}