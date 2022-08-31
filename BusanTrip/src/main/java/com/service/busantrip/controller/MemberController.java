package com.service.busantrip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
//	@GetMapping("/")
//	public String index() {
//		
//		return "home/home";
//	}
	
	@RequestMapping("login.do")
	public String login() {
		
		return "/login.jsp";
	}
	
	
}
