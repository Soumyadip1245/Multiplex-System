package com.example.view_controller.service.user;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.view_controller.config.SimpleEncrypter;
import com.example.view_controller.entity.Multiplexes;
import com.example.view_controller.entity.Users;
import com.example.view_controller.repository.MultiplexRepository;
import com.example.view_controller.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MultiplexRepository multiplexRepository;

    @Override
    public Users registerUser(Users user) {
        user.setPassword(SimpleEncrypter.encrypt(user.getPassword()));
        userRepository.registerUser(user.getUsername(), user.getPassword(), user.getEmail(), user.getRole());
        return user;
    }

    @Override
    public Users loginUser(String username, String password) {
        Users user = userRepository.findByUsername(username);
        if (user != null && SimpleEncrypter.decrypt(user.getPassword()).equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public Users registerUserWithadmin(Users user, List<Long> multiplexID) {
        List<Multiplexes> selectedMultiplexes = new ArrayList<>();
        for (Long id : multiplexID) {
            selectedMultiplexes.add(multiplexRepository.findById(id).orElse(null));
        }
        user.setPassword(SimpleEncrypter.encrypt(user.getPassword()));
        user.setCreatedAt(LocalDateTime.now());
        user.setAdminMultiplexes(selectedMultiplexes);
        userRepository.save(user);
        for (Multiplexes multiplex : selectedMultiplexes) {
            multiplex.getAdmins().add(user);
            multiplexRepository.save(multiplex);
        }

        return user;
    }
}
