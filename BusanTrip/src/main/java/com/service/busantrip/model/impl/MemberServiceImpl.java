package com.service.busantrip.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.dto.req.TransactionReqDTO;
import com.service.busantrip.model.MemberDAO;
import com.service.busantrip.model.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void join(Member member) {
		memberDAO.join(member);
	}

	@Override
	public void login(Member member) {
		memberDAO.login(member);
	}

	@Override
	public void logout() {
		//
	}

	@Override
	public void updateCharacter(Member member) {
		memberDAO.updateCharacter(member);
	}

	@Override
	public List<Transaction> findAllTransaction(String accountNumber) {
		return memberDAO.findAllTransaction(accountNumber);
	}

	@Override
	public List<Transaction> findTransactionByPeriod(String accountNumber, 
													 String startDay, 
													 String finishDay) {
		return memberDAO.findTransactionByPeriod(accountNumber, startDay, finishDay);
	}

	@Override
	public List<Transaction> findTransactionByPeriod(String accountNumber, 
													 int month) {
		return memberDAO.findTransactionByPeriod(accountNumber, month);
	}

	@Override
	public void addExternalTransaction(TransactionReqDTO dto) {
		memberDAO.addExternalTransaction(dto);
	}

	@Override
	public void pay(String accountNumber, 
					int balance) {
		memberDAO.pay(accountNumber, balance);
	}

	@Override
	public void addTransaction(TransactionReqDTO dto) {
		memberDAO.addTransaction(dto);
	}

	@Override
	public void updateTransactionMemo(Transaction transaction) {
		memberDAO.updateTransactionMemo(transaction);
	}

	@Override
	public List<Account> findAccount(String memberId) {
		return memberDAO.findAccount(memberId);
	}

	@Override
	public int getBalance(String accountNumber) {
		return memberDAO.getBalance(accountNumber);
	}

	@Override
	public int charge(String accountNumber, 
					  int balance) {
		return memberDAO.charge(accountNumber, balance);
	}
}
