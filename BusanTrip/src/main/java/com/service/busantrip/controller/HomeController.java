package com.service.busantrip.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bnk")
public class HomeController {
	
	@RequestMapping("home")
	public String home() {
		return "home/home";
	}
	@RequestMapping("search")
	public String search() {
		return "search/search";
	}
	
	@RequestMapping("trip")
	public String trip() {
		return "trip/story";
	}
	@RequestMapping("place")
	public String place() {
		return "place/place";
	}
	@RequestMapping("login")
	public String login() {
		return "home/login";
	}
	@RequestMapping("register")
	public String register() {
		return "home/register";
	}
	@RequestMapping("trip/{storyId}")
	public String diaryDetail(@PathVariable("storyId") String storyId) {
		return "trip/diary_main";
	}
	@RequestMapping("error")
	public String error() {
		return "error";
	}
	//@RequestMapping("") 마이페이지 이동.. 페이지가 현재 없음..
}
