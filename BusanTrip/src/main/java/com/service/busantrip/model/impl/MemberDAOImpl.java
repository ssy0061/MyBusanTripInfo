package com.service.busantrip.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Member> findIdExist(String memberId) {
		return sqlSession.selectList(NS+"findIdExist", memberId);
	}
	
	@Override
	public int join(Member member) {
		return sqlSession.insert(NS+"join", member);
	}
	
	@Override
	public void addAccount(String memberId, String accountNumber) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("accountNumber", accountNumber);
		sqlSession.insert(NS+"addAccount", map);
	}
	
	@Override
	public Member findMemberInfo(String memberId) {
		return sqlSession.selectOne(NS+"findMemberInfo",memberId);
	}
	
	@Override
	public String findMemberName(String memberId) {
		return sqlSession.selectOne(NS+"findMemberName",memberId);
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
	public void updateCharacter(String memberChar, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberChar", memberChar);
		map.put("memberId", memberId);
		sqlSession.update(NS+"updateCharacter", map);
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
		String endDay = finishDay + " 23:59";
		map.put("finishDay", endDay);
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

	@Override
	public void addTransaction(Transaction transaction) {
		sqlSession.insert(NS+"addTransaction", transaction);
	}
	
	
	@Override
	public int findTotalVisit(Transaction transaction) {
		int totalVisit = sqlSession.selectOne(NS+"findTotalVisit", transaction);
		totalVisit += 1;
		return totalVisit;
	}
	
	@Override
	public void updateTotalVisit(Transaction transaction, int totalVisit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storeId", transaction.getStoreId());
		map.put("totalVisit", totalVisit);
		sqlSession.update(NS+"updateTotalVisit",map);
	}
	
	@Override
	public void updateTransactionMemo(Transaction transaction) {
		sqlSession.update(NS+"updateTransactionMemo", transaction);
	}

	@Override
	public List<Account> findAllAccount(String memberId) {
		return sqlSession.selectList(NS+"findAllAccount", memberId);
	}
	
	@Override
	public int findBalance(String accountNumber) {
		return sqlSession.selectOne(NS+"findBalance", accountNumber);
	}
	
	@Override
	public int findPointBalance(String memberId) {
		return sqlSession.selectOne(NS+"findPointBalance", memberId);
	}

	@Override
	public String findPointAccount(String memberId) {
		return sqlSession.selectOne(NS+"findPointAccount", memberId);
	}
	
	@Override
	public int charge(String accountNumber, int balance) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("balance", balance);
		map.put("accountNumber", accountNumber);
		return sqlSession.update(NS+"charge",map);
	}

	@Override
	public List<Map<String, Object>> findMemberVisitStats(String memberId) {
		return sqlSession.selectList(NS+"findMemberVisitStats", memberId);
	}

	@Override
	public void updateMemberInfo(String memberPw, String memberTele, String memberAddr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberPw", memberPw);
		map.put("memberTele", memberTele);
		map.put("memberAddr", memberAddr);
		sqlSession.update(NS+"updateMemberInfo",map);
	}
}
