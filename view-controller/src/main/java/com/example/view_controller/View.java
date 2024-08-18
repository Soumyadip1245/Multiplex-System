package com.example.view_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.example.view_controller.entity.Users;
import com.example.view_controller.service.user.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class View {

    @Autowired
    private UserService userService;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/")
    public String home() {
        return "common/login";
    }

    @GetMapping("/login")
    public String login() {
        return "common/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        Users u = userService.loginUser(username, password);
        if (u == null) {
            model.addAttribute("error", "User not found with the provided credentials");
            return "common/login";
        } else {
            System.out.println(u.toString());
            session.setAttribute("user", u);
            session.setAttribute("role", u.getRole());
            return switch (u.getRole().toUpperCase()) {
                case "OWNER" ->
                    "redirect:/owner/dashboard";
                case "ADMIN" ->
                    "redirect:/admin/dashboard";
                default ->
                    "redirect:/user/dashboard";
            };
        }
    }

    @GetMapping("/register")
    public String register(Model model) {
        return "common/register";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String username, @RequestParam String password, @RequestParam String email, Model model) {
        Users user = new Users();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        userService.registerUser(user);
        return "common/login";
    }

    @GetMapping("/access-denied")
    public String accessDenied() {
        return "common/access-denied";
    }

   

}
