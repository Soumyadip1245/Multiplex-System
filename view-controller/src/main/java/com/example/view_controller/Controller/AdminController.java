package com.example.view_controller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.example.view_controller.entity.Multiplexes;
import com.example.view_controller.entity.Users;
import com.example.view_controller.repository.MultiplexRepository;
import com.example.view_controller.service.user.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
@Autowired
    private HttpSession session;

    @Autowired
    private UserService userRepository;
    @Autowired
    private MultiplexRepository multiplexRepository;
    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        var user = (Users) session.getAttribute("user");
        if (user.getId() > 0) {
            String url = "http://localhost:3080/multiplex-owner/" + user.getId();
            System.out.println(url);
            ResponseEntity<Multiplexes[]> response = restTemplate.getForEntity(url, Multiplexes[].class);
            System.out.println(response.getBody());
            model.addAttribute("multiplexes", response.getBody());
        }
        model.addAttribute("userName", user.getUsername());
        return "adminDashboard";
    }
}
