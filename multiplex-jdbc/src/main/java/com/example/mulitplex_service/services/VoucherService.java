package com.example.mulitplex_service.services;

import java.util.List;

import com.example.mulitplex_service.entity.UserVouchers;
import com.example.mulitplex_service.entity.Vouchers;
import com.example.mulitplex_service.utils.VoucherResponse;

public interface VoucherService {
    Vouchers createVoucher(Vouchers voucher);

    UserVouchers assignVoucherToUser(Long userId, Long voucherId);

    List<UserVouchers> getUserVouchers(Long userId);

    UserVouchers redeemVoucher(Long userVoucherId);
    List<Vouchers> getAllVouchers();

    VoucherResponse findVoucher(String voucherCode);
}