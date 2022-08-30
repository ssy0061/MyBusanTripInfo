package com.service.busantrip.domain;

import java.util.Date;

public class Transaction {
	private int transactionId;
	private Date transactionTime;
	private int transactionAmt;
	private String transactionMemo;
	private String transactionStore;
	
	private String accountNumber;
	private String storeId;

	private Account account;
	private Store store;
	
	public Transaction() {}

	public Transaction(int transactionId, Date transactionTime, int transactionAmt, String transactionMemo,
			String accountNumber, String storeId, String transactionStore) {
		super();
		this.transactionId = transactionId;
		this.transactionTime = transactionTime;
		this.transactionAmt = transactionAmt;
		this.transactionMemo = transactionMemo;
		this.accountNumber = accountNumber;
		this.storeId = storeId;
		this.transactionStore = transactionStore;
	}

	public Transaction(Date transactionTime, int transactionAmt,
			String accountNumber, String storeId, String transactionStore) {
		super();
		this.transactionTime = transactionTime;
		this.transactionAmt = transactionAmt;
		this.accountNumber = accountNumber;
		this.storeId = storeId;
		this.transactionStore = transactionStore;
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
