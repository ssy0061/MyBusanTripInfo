package com.service.busantrip.domain;

import java.util.Date;

public class Transaction {
	
	private int transactionId;

	private String accountNumber;
	private String storeId;
	private String memberId;
	
	private Date transactionTime;
	private String transactionStore;
	private int transactionAmt;
	private String transactionMemo;

	private Account account;
	private Store store;

	public Transaction() {
	}


	public Transaction(int transactionId, String accountNumber, String storeId, String memberId, Date transactionTime,
			String transactionStore, int transactionAmt, String transactionMemo) {
		super();
		this.transactionId = transactionId;
		this.accountNumber = accountNumber;
		this.storeId = storeId;
		this.memberId = memberId;
		this.transactionTime = transactionTime;
		this.transactionStore = transactionStore;
		this.transactionAmt = transactionAmt;
		this.transactionMemo = transactionMemo;
	}


	public Transaction(String accountNumber, String storeId, Date transactionTime,  
			String transactionStore, int transactionAmt) {
		super();
		this.transactionTime = transactionTime;
		this.transactionAmt = transactionAmt;
		this.accountNumber = accountNumber;
		this.storeId = storeId;
		this.transactionStore = transactionStore;
	}
	
	

	public Transaction(int transactionId, String transactionMemo) {
		super();
		this.transactionId = transactionId;
		this.transactionMemo = transactionMemo;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public Date getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(Date transactionTime) {
		this.transactionTime = transactionTime;
	}

	public int getTransactionAmt() {
		return transactionAmt;
	}

	public void setTransactionAmt(int transactionAmt) {
		this.transactionAmt = transactionAmt;
	}

	public String getTransactionMemo() {
		return transactionMemo;
	}

	public void setTransactionMemo(String transactionMemo) {
		this.transactionMemo = transactionMemo;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public String getTransactionStore() {
		return transactionStore;
	}

	public void setTransactionStore(String transactionStore) {
		this.transactionStore = transactionStore;
	}

	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", transactionTime=" + transactionTime
				+ ", transactionAmt=" + transactionAmt + ", transactionMemo=" + transactionMemo + ", transactionStore="
				+ transactionStore + ", accountNumber=" + accountNumber + ", storeId=" + storeId + "]";
	}

}
