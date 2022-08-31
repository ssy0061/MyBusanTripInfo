package com.service.busantrip.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.model.MemberService;

@RestController
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("login")
	public String login(String id, String pw, Model model, HttpSession session) {
		try {
			Member member = new Member(id, pw);
			System.out.println(member);
			Member loginData = memberService.login(member);
			//String loginData = "hello";
			if(loginData != null) {
				session.setAttribute("loginUser", loginData);
				session.setAttribute("memberId", id);
				return "redirect:/bnk/home";
			} else {
				return "redirect:/bnk/login";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "Error";	
		}	
	}
	@PostMapping("register")
	public String join(String memberId, String memberPw, String memberName, String memberTele, String memberAddr, Model model, HttpSession session) {
		try {
			Member member = new Member(memberId, memberPw, memberName, memberTele, memberAddr);
			int registerData = memberService.join(member);
			if(registerData == 1) {
				model.addAttribute("registerData", member.getMemberId());
				return "redirect:/bnk/login";
			}else {
				return "redirect:/bnk/register";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "Error";	
		}	
	}
	
	@PostMapping("findAllAccount")
	public List<Account> findAllAccount(String memberId, Model model, HttpSession session) {
		List<Account> accountList = memberService.findAllAccount(memberId);
		return accountList;
	}
}
