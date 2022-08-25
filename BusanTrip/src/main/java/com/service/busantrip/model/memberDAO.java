package com.service.busantrip.model;

import java.util.List;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;

public interface memberDAO {
	public void registerMember(Member member); //회원가입
	public int login(Member member); //로그인
	public void logout(); //로그아웃
	public int updateCharacter(Member memeber); //캐릭터 교체 
	public List<Transaction> findAllTransaction(Transaction transaction); //사용자 전체 거래내역 조회
	public List<Transaction> findTransactionByPeriod(Transaction transaction, String startDay, String finishDay); //사용자 지정기간 거래내역 조회
	public List<Transaction> findTransactionByPeriod(Transaction transaction, int month);// 사용자 지정기간 거래내역 조회
	public void addExternalTransaction(Transaction transaction, String accountNumber);//외부계좌 거래내역 불러오기
	public void addTransaction(Transaction transaction, String accountNumber);//거래내역 생성(결제시)
	public void updateTransactionMemo(String transactionId, String accountNumber); //거래내역 메모 수정
	public List<Account> findAccount(String memberId); //내 계좌 조회
	public int getBalance(String memberId, String accountNumber, int amt); //계좌(포인트지갑) 잔액 조회
	public int charge(String memberId, String accountNumber, int amt); //계좌(포인트지갑) 잔액 충전
	public void pay(Account account, String memberId); //결제
	public int transfer(int amt, String sender, String receiver); //계좌(포인트지갑) 이체
	
}
