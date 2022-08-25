package com.service.busantrip.model;

import java.util.List;

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
	//외부계좌 거래내역 불러오기
	//거래내역 생성(결제시)
	//거래내역 메모 수정
	//내 계좌 조회
	//계좌(포인트지갑) 잔액 조회
	//계좌(포인트지갑) 잔액 충전
	//결제
	public int transfer()//계좌(포인트지갑) 이체
	
}
