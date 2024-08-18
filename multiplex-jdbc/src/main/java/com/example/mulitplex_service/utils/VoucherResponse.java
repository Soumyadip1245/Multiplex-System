package com.example.mulitplex_service.utils;

public class VoucherResponse {
    private String message;
    private boolean success;
    private double amount;
    private long voucher;

    public VoucherResponse(String message, boolean success,double amount, long voucher) {
        this.message = message;
        this.success = success;
        this.amount = amount;
        this.voucher = voucher;
    }
    public long getVoucher(){
        return voucher;
    }
    public double getAmount(){
        return amount;
    }

    public String getMessage() {
        return message;
    }

    public boolean isSuccess() {
        return success;
    }
}

