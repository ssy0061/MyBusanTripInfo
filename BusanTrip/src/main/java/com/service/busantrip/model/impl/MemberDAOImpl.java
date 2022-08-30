package com.service.busantrip.model.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.dto.req.TransactionReqDTO;
import com.service.busantrip.model.MemberDAO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	private final String NS = "sql.member.mapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void join(Member member) {
		sqlSession.insert(NS+"join", member);
	}

	@Override
	public Member login(Member member) {
		return sqlSession.selectOne(NS+"login", member);
	}

	@Override
	public void logout() {
		//
	}

	@Override
	public void updateCharacter(Member member) {	// hashmap으로 변경해야함
		sqlSession.update(NS+"updateCharacter", member);
	}

	@Override
	public List<Transaction> findAllTransaction(String accountNumber) {
		return sqlSession.selectList(NS+"findAllTransaction", accountNumber);
	}

	@Override
	public List<Transaction> findTransactionBySpecificPeriod(String accountNumber, String startDay, String finishDay) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accountNumber", accountNumber);
		map.put("startDay", startDay);
		map.put("finishDay", finishDay);
		return sqlSession.selectList(NS+"findTransactionBySpecificPeriod", map);
	}

	@Override
	public List<Transaction> findTransactionByMonthPeriod(String accountNumber, int month) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accountNumber", accountNumber);
		map.put("month", month);
		return sqlSession.selectList(NS+"findTransactionByMonthPeriod", map);
	}

	@Override
	public void addExternalTransaction(Transaction transaction, String accountNumber) {
		TransactionReqDTO dto = new TransactionReqDTO(transaction, accountNumber);
		sqlSession.insert(NS+"addExternalTransaction", dto);
	}

	@Override
	public void pay(String accountNumber, int balance) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accountNumber", accountNumber);
		map.put("balance", balance);
		sqlSession.update(NS+"pay", map);
	}

//	@Override
//	public void addTransaction(Transaction transaction, String accountNumber) {
//		TransactionReqDTO dto = new TransactionReqDTO(transaction, accountNumber);
//		sqlSession.insert(NS+"addTransaction", dto);
//	}

	@Override
	public void addTransaction(Transaction transaction) {
		sqlSession.insert(NS+"addTransaction", transaction);
	}
	
	@Override
	public void updateTransactionMemo(Transaction transaction) {
		sqlSession.update(NS+"updateTransactionMemo", transaction);
	}

	@Override
	public List<Account> findAccount(String memberId) {
		return sqlSession.selectList(NS+"findAccount", memberId);
	}

	@Override
	public int getBalance(String accountNumber) {
		return sqlSession.selectOne(NS+"getBalance", accountNumber);
	}

	@Override
	public int charge(String accountNumber, int balance) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accountNumber", accountNumber);
		map.put("balance", balance);
		return sqlSession.update(NS+"charge");
	}
}
