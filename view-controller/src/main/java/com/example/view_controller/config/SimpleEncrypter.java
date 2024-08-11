package com.example.view_controller.config;

public class SimpleEncrypter {

    private static final String SECRET_KEY = "1212";

    public static String encrypt(String input) {
        char[] key = SECRET_KEY.toCharArray();
        char[] inputChars = input.toCharArray();

        char[] result = new char[input.length()];

        for (int i = 0; i < inputChars.length; i++) {
            result[i] = (char) (inputChars[i] ^ key[i % key.length]);
        }

        return new String(result);
    }

    public static String decrypt(String input) {
        return encrypt(input); 
    }
}
