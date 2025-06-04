package org.sdko.www;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        return "index";
    }
    
    @GetMapping("/oss")
    public String oss(Model model) {
        return "oss";
    }

    @GetMapping("/sitemap")
    public String sitemap(Model model) {
        return "sitemap";
    }
    
    @GetMapping("/sws")
    public String sws(Model model) {
        return "sws";
    }
    
    @GetMapping("/privacy")
    public String privacy(Model model) {
        return "privacy";
    }
} 