package com.example.test_jenkin;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @GetMapping("/testtt")
    public ResponseEntity register() {
        return ResponseEntity.ok("ngon roi");
    }
}
