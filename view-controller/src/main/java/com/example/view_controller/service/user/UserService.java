package com.example.view_controller.service.user;

import java.util.List;

import com.example.view_controller.entity.Users;

public interface UserService {

    Users registerUser(Users user);
    Users registerUserWithadmin(Users user, List<Long> multiplexID);
    Users loginUser(String username, String password);
}
