package com.example.mulitplex_service.services;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mulitplex_service.entity.UserVouchers;
import com.example.mulitplex_service.entity.Users;
import com.example.mulitplex_service.entity.Vouchers;
import com.example.mulitplex_service.repository.UserRepository;
import com.example.mulitplex_service.repository.UserVoucherRepository;
import com.example.mulitplex_service.repository.VoucherRepository;
import com.example.mulitplex_service.utils.VoucherResponse;

@Service
public class VoucherServiceImpl implements VoucherService {

    @Autowired
    private VoucherRepository voucherRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserVoucherRepository userVouchersRepository;

    @Override
    public Vouchers createVoucher(Vouchers voucher) {
        return voucherRepository.save(voucher);
    }

    @Override
    public UserVouchers assignVoucherToUser(Long userId, Long voucherId) {
        Users user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
        Vouchers voucher = voucherRepository.findById(voucherId).orElseThrow(() -> new IllegalArgumentException("Voucher not found"));

        UserVouchers userVoucher = new UserVouchers();
        userVoucher.setUser(user);
        userVoucher.setVoucher(voucher);
        userVoucher.setRedeemed(false); 

        return userVouchersRepository.save(userVoucher);
    }

    @Override
    public List<UserVouchers> getUserVouchers(Long userId) {
        return userVouchersRepository.findByUserId(userId);
    }

    @Override
    public UserVouchers redeemVoucher(Long userVoucherId) {
        UserVouchers userVoucher = userVouchersRepository.findById(userVoucherId)
            .orElseThrow(() -> new IllegalArgumentException("UserVoucher not found"));

        if (userVoucher.getRedeemed()) {
            throw new IllegalArgumentException("Voucher has already been redeemed");
        }

        userVoucher.setRedeemed(true);
        userVoucher.setRedeemedAt(LocalDateTime.now());

        return userVouchersRepository.save(userVoucher);
    }

    @Override
    public List<Vouchers> getAllVouchers() {
       List<Vouchers> voucherList = voucherRepository.findAll();
       return voucherList;
    }

   @Override
public VoucherResponse findVoucher(String voucherCode) {
    Optional<UserVouchers> uv = userVouchersRepository.findVoucher(voucherCode);

    if (uv.isEmpty()) {
        return new VoucherResponse("Voucher doesn't exist. Try another.", false, 0,0);
    } else if (uv.get().getVoucher().getExpirationDate().isBefore(LocalDateTime.now())) {
        return new VoucherResponse("Voucher is already expired.", false, 0, 0);
    } else if (uv.get().getRedeemed()) {
        return new VoucherResponse("Voucher is already redeemed.", false, 0, 0);
    } else if (uv.get().getVoucher().getType().equals("FOOD_COUPON")) {
        return new VoucherResponse("Food coupon cannot be used here.", false, 0, 0);
    } else if (uv.get().getVoucher().getType().equals("PARKING_COUPON")) {
        return new VoucherResponse("Parking coupon cannot be used here.", false, 0, 0);
    } else if (uv.get().getVoucher().getType().equals("SHOPPING_VOUCHER")) {
        return new VoucherResponse("Shopping coupon cannot be used here.", false, 0, 0);
    } else {
        return new VoucherResponse("You got an instant discount of " + uv.get().getAmount(), true, uv.get().getAmount(), uv.get().getId());
    }
}

    
}