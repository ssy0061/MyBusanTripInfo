package com.service.busantrip.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bnk")
public class HomeController {
	
	@GetMapping("{page}")
	public String goTo(@PathVariable("page") String page) {
		String goPage = "home/home";
		if(page.equals("search")) {
			goPage="search/search";
		}else if(page.equals("trip")) {
			goPage="trip/story";
		}else if(page.equals("place")) {
			goPage="place/place";
		}else if(page.equals("login")) {
			goPage="home/login";
		}
		return goPage;
	}
}
