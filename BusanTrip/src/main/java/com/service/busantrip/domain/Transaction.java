package com.service.busantrip.domain;

import java.util.Date;

public class Transaction {
	private int transactionId;
	private Date transactionTime;
	private int transactionAmt;
	private String transactionMemo;

	private Account account;
	private Store store;
	
	public Transaction() {}

	public Transaction(int transactionId, Date transactionTime, int transactionAmt, String transactionMemo,
			Account account, Store store) {
		super();
		this.transactionId = transactionId;
		this.transactionTime = transactionTime;
		this.transactionAmt = transactionAmt;
		this.transactionMemo = transactionMemo;
		this.account = account;
		this.store = store;
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

	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", transactionTime=" + transactionTime
				+ ", transactionAmt=" + transactionAmt + ", transactionMemo=" + transactionMemo + ", account=" + account
				+ ", store=" + store + "]";
	}
}
