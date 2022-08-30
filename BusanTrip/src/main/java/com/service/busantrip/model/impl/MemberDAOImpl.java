package com.service.busantrip.model.impl;

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
	public void login(Member member) {
		sqlSession.selectOne(NS+"login", member);
	}

	@Override
	public void logout() {
		//
	}

	@Override
	public void updateCharacter(Member member) {
		sqlSession.update(NS+"updateCharacter", member);
	}

	@Override
	public List<Transaction> findAllTransaction(String accountNumber) {
		return sqlSession.selectList(NS+"findAllTransaction", accountNumber);
	}

	@Override
	public List<Transaction> findTransactionBySpecificPeriod(@Param("accountNumber") String accountNumber, 
													 @Param("startDay") String startDay, 
													 @Param("finishDay") String finishDay) {
		return sqlSession.selectList(NS+"findTransactionBySpecificPeriod");
	}

	@Override
	public List<Transaction> findTransactionByMonthPeriod(@Param("accountNumber") String accountNumber, 
													 @Param("month") int month) {
		return sqlSession.selectList(NS+"findTransactionByMonthPeriod");
	}

	@Override
	public void addExternalTransaction(TransactionReqDTO dto) {
		sqlSession.insert(NS+"addExternalTransaction", dto);
	}

	@Override
	public void pay(@Param("accountNumber") String accountNumber, 
					@Param("balance") int balance) {
		sqlSession.update(NS+"pay");
	}

	@Override
	public void addTransaction(TransactionReqDTO dto) {
		sqlSession.insert(NS+"addTransaction", dto);
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
	public int charge(@Param("accountNumber") String accountNumber, 
					  @Param("balance") int balance) {
		return sqlSession.update(NS+"charge");
	}
}