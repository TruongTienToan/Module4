package com.example.currencyconvert;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ComvertController {
    @GetMapping("/convert")
    public String showIndexPage() {
        return "currency_convert";
    }

    @PostMapping("/convert")
    public String convertCurrency(@RequestParam ("exchangeRate") double exchangeRate,
                                  @RequestParam ("usdAmount") double usdAmount,
                                  Model model) {
        double vndAmount = exchangeRate * usdAmount;
        model.addAttribute("vndAmount", vndAmount);
        return "result";
    }
}
