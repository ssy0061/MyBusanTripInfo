package com.service.busantrip.model;

import java.util.List;

import com.service.busantrip.domain.Account;
import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;

public interface memberDAO {
	public void registerMember(Member member); //회원가입
	public void login(Member member); //로그인
	public void logout(); //로그아웃
	public void updateCharacter(Member memeber); //캐릭터 교체 
	public List<Transaction> findAllTransaction(String accountNumber); //사용자 전체 거래내역 조회
	public List<Transaction> findTransactionByPeriod(String startDay, String finishDay); //사용자 지정기간 거래내역 조회
	public List<Transaction> findTransactionByPeriod(int month);// 사용자 지정기간 거래내역 조회
	
	public void addExternalTransaction(Transaction transaction, String accountNumber);//외부계좌 거래내역 불러오기
	
	//Service에서 두개 같이 불러야함
	public void pay(String accountNumber, int amt); //결제 ==> 거래내역도 같이 반영시킴...
	public void addTransaction(Transaction transaction, String accountNumber);//거래내역 생성(결제시)
	
	public void updateTransactionMemo(String transactionId, String accountNumber); //거래내역 메모 수정
	
	public List<Account> findAccount(String memberId); //내 계좌 조회
	public int getBalance(String accountNumber); //계좌(포인트지갑) 잔액 조회
	public int charge(String accountNumber, int amt); //계좌(포인트지갑) 잔액 충전
	public int transfer(int amt, String sender, String receiver); //계좌(포인트지갑) 이체
}
