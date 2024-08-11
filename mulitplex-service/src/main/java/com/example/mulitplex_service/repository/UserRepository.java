package com.example.mulitplex_service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Long>{
    @Query(value = "CALL GetAdmins()", nativeQuery = true)
    List<Users> findAdmins();
}
