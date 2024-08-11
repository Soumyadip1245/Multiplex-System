package com.example.view_controller.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.view_controller.entity.Users;

import jakarta.transaction.Transactional;
@Repository
public interface UserRepository extends JpaRepository<Users, Long>{
    @Query(value = "CALL find_by_username(:p_username)", nativeQuery = true)
    Users findByUsername(@Param("p_username") String username);

    @Modifying
    @Transactional
    @Query(value = "CALL register_user(:username, :password, :email, :role)", nativeQuery = true)
    void registerUser(@Param("username") String username, 
                      @Param("password") String password, 
                      @Param("email") String email,
                      @Param("role") String role);
}
