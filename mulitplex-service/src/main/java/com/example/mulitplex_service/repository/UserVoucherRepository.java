package com.example.mulitplex_service.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.UserVouchers;
@Repository
public interface UserVoucherRepository extends JpaRepository<UserVouchers, Long> {
    @Query("SELECT uv FROM UserVouchers uv WHERE uv.user.id = :userId")
    List<UserVouchers> findByUserId(@Param("userId") Long userId);

    @Query(value = "CALL getVoucherByName(:voucherCode)", nativeQuery = true)
    Optional<UserVouchers> findVoucher(@Param("voucherCode") String voucherCode);
}
