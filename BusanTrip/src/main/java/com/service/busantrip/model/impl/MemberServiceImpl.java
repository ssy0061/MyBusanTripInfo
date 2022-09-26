package com.service.busantrip.model.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.model.MemberDAO;
import com.service.busantrip.model.MemberService;
import com.service.busantrip.model.StoreDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public Boolean findIdExist(String memberId) { //
		
		if(memberDAO.findIdExist(memberId).size() >= 1) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public int join(Member member) {	//
		Date now = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");
		String nowDate = simpleDateFormat.format(now); 
		String memberId = member.getMemberId();
		memberDAO.join(member);
		memberDAO.addAccount(memberId, memberId+nowDate);
		return 1;
	}
	
	@Override
	public Member login(Member member) {	//
		return memberDAO.login(member);
	}

	@Override
	public void logout() {	//
		//
	}
	
	@Override
	public Member findMemberInfo(String memberId) {	//
		return memberDAO.findMemberInfo(memberId);
	}
	
	@Override
	public void updateCharacter(String memberChar, String memberId) {	//
		memberDAO.updateCharacter(memberChar, memberId);
	}

	@Override
	public List<Transaction> findAllTransaction(String accountNumber) {	//
		return memberDAO.findAllTransaction(accountNumber);
	}
	
	@Override
	public Transaction findTransactionByTransactionId(int transactionId) {
		return memberDAO.findTransactionByTransactionId(transactionId);
	}

	@Override
	public List<Transaction> findTransactionBySpecificPeriod(String accountNumber, 	//
													 String startDay, 
													 String finishDay) {
		return memberDAO.findTransactionBySpecificPeriod(accountNumber, startDay, finishDay);
	}

	@Override
	public List<Transaction> findTransactionByMonthPeriod(String accountNumber, 	//위 메소드로 이거까지 대응 가능
													 int month) {
		return memberDAO.findTransactionByMonthPeriod(accountNumber, month);
	}
	
	@Override
	public void addExternalTransaction(Transaction transaction, String accountNumber) {	//
		memberDAO.addExternalTransaction(transaction, accountNumber);
	}

	@Override
	public void pay(String memberId, int amt, String storeName) {	//
		Date date = new Date();
		String accountNumber = memberDAO.findPointAccount(memberId);
		int pBalance = memberDAO.findBalance(accountNumber);
		int balance = pBalance-amt;
		memberDAO.pay(accountNumber, balance);
		
		String storeId = storeDAO.findStoreId(storeName);
		Transaction transaction = new Transaction(accountNumber, storeId, memberId, date, storeName, amt);
		memberDAO.addTransaction(transaction);
		
		int totalVisit = memberDAO.findTotalVisit(transaction);
		memberDAO.updateTotalVisit(transaction, totalVisit);
	}

	@Override
	public void updateTransactionMemo(Transaction transaction) {	//
		memberDAO.updateTransactionMemo(transaction);
	}

	@Override
	public List<Account> findAllAccount(String memberId) {	//
		return memberDAO.findAllAccount(memberId);
	}

	@Override
	public int getBalance(String accountNumber) {
		return memberDAO.findBalance(accountNumber);
	}
	
	@Override
	public int getPointBalance(String memberId) {
		return memberDAO.findPointBalance(memberId);
	}

	@Override
	public void charge(String memberId, int amt) {	//
		String accountNumber = memberDAO.findPointAccount(memberId);
		int pBalance = memberDAO.findBalance(accountNumber);
		int balance = pBalance+amt;
		memberDAO.charge(accountNumber, balance);
	}

	@Override
	public List<Map<String, Object>> findMemberVisitStats(String memberId) {
		return memberDAO.findMemberVisitStats(memberId);
	}

	@Override
	public void updateMemberInfo(String memberPw, String memberTele, String memberAddr, String memberId) {
		memberDAO.updateMemberInfo(memberPw, memberTele, memberAddr, memberId);
	}

	@Override
	public List<Map<String, Object>> findInputDataToML(String memberId) {
		return memberDAO.findInputDataToML(memberId);
	}

}
