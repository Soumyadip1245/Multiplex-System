package com.example.view_controller.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class LoadBalancingController {

    @Autowired
    private RestTemplate restTemplate;

    @PostMapping("/createBooking")
    public String createBooking(@RequestBody Map<String, Object> payload) {
        String confirmUrl = "http://MULTIPLEX-SERVICE/createBooking";
        String response = restTemplate.postForObject(confirmUrl, payload, String.class);

        return response;
    }
      @GetMapping("/voucher-status/{voucherCode}")
    public ResponseEntity<String> checkVoucherStatus(@PathVariable String voucherCode) {
        String voucherUrl = "http://MULTIPLEX-SERVICE/voucher-status/" + voucherCode;
        String response = restTemplate.getForObject(voucherUrl, String.class);
        return ResponseEntity.ok(response);
    }
    @GetMapping("/click/{seatId}/{showDate}/{showTime}/{movieId}/{screenId}/{userId}")
    public ResponseEntity<String> handleSeatClick(
            @PathVariable String seatId,
            @PathVariable String showDate,
            @PathVariable String showTime,
            @PathVariable String movieId,
            @PathVariable String screenId,
            @PathVariable String userId) {        
        String multiplexUrl = String.format("http://MULTIPLEX-SERVICE/click/%s/%s/%s/%s/%s/%s",
                                             seatId, showDate, showTime, movieId, screenId, userId);
        String response = restTemplate.getForObject(multiplexUrl, String.class);
        
        return ResponseEntity.ok(response);
    }
    @GetMapping("/findAllShowtimesByMovieId/{movieId}")
    public ResponseEntity<String> findAllShowtimesByMovieId(@PathVariable String movieId) {
        String multiplexUrl = String.format("http://MULTIPLEX-SERVICE/findAllShowtimesByMovieId/%s", movieId);        
        String response = restTemplate.getForObject(multiplexUrl, String.class);
        
        return ResponseEntity.ok(response);
    }
    @GetMapping("/get-available-time-slots/{screenId}/{date}")
    public ResponseEntity<String> getAvailableTimeSlots(@PathVariable String screenId, @PathVariable String date) {
        String multiplexUrl = String.format("http://MULTIPLEX-SERVICE/get-available-time-slots/%s/%s", screenId, date);
        
        String response = restTemplate.getForObject(multiplexUrl, String.class);
        
        return ResponseEntity.ok(response);
    }
    @GetMapping("/updateMembership/{userId}/{membershipType}")
    public ResponseEntity<String> getAvailableTimeSlots(@PathVariable long userId, @PathVariable String membershipType) {
        String multiplexUrl = String.format("http://MULTIPLEX-SERVICE/updateMembership/"+userId+"/"+membershipType);
        
        String response = restTemplate.getForObject(multiplexUrl, String.class);
        
        return ResponseEntity.ok(response);
    }
     @GetMapping("/load-balancing")
    public List<String> testLoadBalancing(Model model) {
        List<String> responses = new ArrayList<>();

        for (int i = 0; i < 100; i++) {
            String url = "http://MULTIPLEX-SERVICE/multiplex-logs/1";
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
            responses.add("Response " + i + ": " + response.getBody());
        }

        return responses;
    }
}