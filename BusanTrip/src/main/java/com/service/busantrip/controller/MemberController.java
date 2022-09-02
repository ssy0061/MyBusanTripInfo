package com.service.busantrip.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.model.MemberService;
import com.service.busantrip.model.StoryService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private StoryService storyService;
	
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
				session.setAttribute("memberChar", loginData.getMemberChar());
				return "redirect:/bnk/home";
			} else {
				return "redirect:/bnk/login";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/error";	
		}	
	}
	
	@PostMapping("logout")
	@ResponseBody
	public String logout(Model model, HttpSession session) {
			session.invalidate();
			return "/bnk/home";
	}
	
	@PostMapping("getMemberName")
	@ResponseBody
	public String getMemberName(String memberId, Model model, HttpSession session) {
		String memberName = memberService.getMemberName(memberId);
		return memberName;
	}
	
	@PostMapping("getBalance")
	@ResponseBody
	public int getBalance(String accountNumber, Model model, HttpSession session) {
		int balance = memberService.getBalance(accountNumber);
		return balance;
	}
	
	@PostMapping("getPointBalance")
	@ResponseBody
	public int getPointBalance(String memberId, Model model, HttpSession session) {
		int balance = memberService.getPointBalance(memberId);
		return balance;
	}
	
	@PostMapping("findIdExist")
	@ResponseBody
	public Boolean findIdExist(String memberId, Model model, HttpSession session) {
		return memberService.findIdExist(memberId);
	}
	
	@PostMapping("join")
	public String join(String memberId, String memberPw, String memberName, String memberTele, String memberAddr, Model model, HttpSession session) {
		try {
			Member member = new Member(memberId, memberPw, memberName, memberTele, memberAddr);
			int registerData = memberService.join(member);
			String defaultAlbumName = "나의 머니앨범";
			if(registerData == 1) {
				model.addAttribute("registerData", member.getMemberId());
				storyService.addStory(defaultAlbumName, memberId, memberId);
				
				return "redirect:/bnk/login";
			}else {
				return "redirect:/bnk/register";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "/bnk/error";	
		}	

	}
	
	@PostMapping("updateCharacter")
	@ResponseBody
	public String updateCharacter(String memberChar, String memberId, Model model, HttpSession session) {
		memberService.updateCharacter(memberChar, memberId);
		model.addAttribute("memberChar",memberChar);
		return "redirect: /bnk/home/mypage"; //마이페이지 링크 추후 수정 필요..
	}
	
	@PostMapping("addExternalTransaction")
	@ResponseBody
	public void addExternalTransaction(String accountNumber, String accountBank, String memberId, String storeId, Date transactionTime,
									String transactionStore, int transactionAmt, String transactionMemo) {
		Transaction transaction = new Transaction(accountNumber, storeId, memberId, transactionTime,
				transactionStore, transactionAmt, transactionMemo);
		memberService.addExternalTransaction(transaction, accountNumber);
//		return return 페이지 필요?...
	}
	
	@PostMapping("pay")
	@ResponseBody
	public void pay(String memberId, int amt, String storeName, Model model, HttpSession session) {
		memberService.pay(memberId, amt, storeName);
	} // 여기서 addTransaction도 같이 시행..
	
	@PostMapping("charge")
	@ResponseBody
	public void charge(String memberId, int amt, Model model, HttpSession session) {
		memberService.charge(memberId, amt);
	}
	
	@PostMapping("updateTransactionMemo")
	@ResponseBody
	public void updateTransactionMemo(int transactionId, String transactionMemo, Model model, HttpSession session) {
		Transaction transaction = new Transaction(transactionId, transactionMemo);
		memberService.updateTransactionMemo(transaction);
	}
	
	@PostMapping("findAllAccount")
	@ResponseBody
	public List<Account> findAllAccount(String memberId, Model model, HttpSession session) {
		List<Account> accountList = memberService.findAllAccount(memberId);
		return accountList;
	}
	
	@PostMapping("findAllTransaction")
	@ResponseBody
	public List<Transaction> findAllTransaction(String accountNumber, Model model, HttpSession session) {
		List<Transaction> allTransactionList = memberService.findAllTransaction(accountNumber);
		return allTransactionList;
	}
	@PostMapping("findTransactionBySpecificPeriod")
	@ResponseBody
	public List<Transaction> findTransactionBySpecificPeriod(String accountNumber, String startDay, String finishDay, Model model, HttpSession session) {
		List<Transaction> allTransactionListByPeriod = memberService.findTransactionBySpecificPeriod(accountNumber, startDay, finishDay);
		return allTransactionListByPeriod;
	}
	
	@PostMapping("findMemberVisitStats")
	@ResponseBody
	public List<Map<String, Object>> findMemberVisitStats(String memberId, Model model, HttpSession session) {
		List<Map<String, Object>> memberVisitStats = memberService.findMemberVisitStats(memberId);
		return memberVisitStats;
	}
}
