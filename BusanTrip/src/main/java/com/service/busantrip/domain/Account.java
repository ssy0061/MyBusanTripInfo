package com.service.busantrip.domain;

public class Account {
	private String accountNumber;
	private String accountBank;
	private int accountBalance;
	private String accountInner;
	private String memberId;

	private Member member;
	
	public Account() {}

	public Account(String accountNumber, String accountBank, int accountBalance, String accountInner, String memberId,
			Member member) {
		super();
		this.accountNumber = accountNumber;
		this.accountBank = accountBank;
		this.accountBalance = accountBalance;
		this.accountInner = accountInner;
		this.memberId = memberId;
		this.member = member;
	}

	public String getAccountBank() {
		return accountBank;
	}

	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}

	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public int getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(int accountBalance) {
		this.accountBalance = accountBalance;
	}

	public String getAccountInner() {
		return accountInner;
	}

	public void setAccountInner(String accountInner) {
		this.accountInner = accountInner;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}


	@Override
	public String toString() {
		return "Account [accountNumber=" + accountNumber + ", accountBalance=" + accountBalance + ", accountInner="
				+ accountInner + ", memberId=" + memberId + "]";
	}
}
