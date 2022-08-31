package com.service.busantrip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.busantrip.domain.Member;
import com.service.busantrip.model.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		try {
			//Member selected = memberService.login(member);
			String selected = "hello";
			if(selected != null) {
				session.setAttribute("loginUser", selected);
				return "redirect:/bnk/home";
			} else {
				return "redirect:/bnk/login";
			}
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("title", "유저 관리 - 로그인 에러");			
			model.addAttribute("message", "문제 내용 - 로그인 중 에러 발생");
			return "Error";	
		}	

	}
	
	
}
