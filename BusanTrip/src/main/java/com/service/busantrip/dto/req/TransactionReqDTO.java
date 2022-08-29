package com.service.busantrip.dto.req;

import com.service.busantrip.domain.Transaction;

public class TransactionReqDTO {
	private Transaction transaction;
	private String accountNumber;
	
	public TransactionReqDTO() {}
	
	public TransactionReqDTO(Transaction transaction, String accountNumber) {
		super();
		this.transaction = transaction;
		this.accountNumber = accountNumber;
	}
	
	public Transaction getTransaction() {
		return transaction;
	}
	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	@Override
	public String toString() {
		return "TransactionReqDTO [transaction=" + transaction + ", accountNumber=" + accountNumber + "]";
	}
	
}
