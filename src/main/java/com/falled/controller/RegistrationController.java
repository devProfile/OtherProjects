package com.falled.controller;


import com.falled.domain.Role;
import com.falled.domain.User;
import com.falled.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;

@Controller
public class RegistrationController {



    @Autowired
    private UserRepository userRepository;
    @GetMapping("/registration")
    public String getRegistrationPage(){
        return "/registration";
    }


    @PostMapping("/registration")
    public String addUser(User user, Model model){
        User userFromDb = userRepository.findByUsername(user.getUsername());
        if(userFromDb != null){
            model.addAttribute("user", "User already exists");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepository.save(user);


        return "redirect:/login";
    }
}
