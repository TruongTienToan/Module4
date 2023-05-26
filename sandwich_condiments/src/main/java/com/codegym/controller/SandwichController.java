package com.codegym.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/save")
public class SandwichController {

    public ModelAndView save(@RequestParam("condiment") String[] condiment) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("sandwich");
        modelAndView.addObject("message", "Checkbox values saved successfully");
        return modelAndView;
    }
}
