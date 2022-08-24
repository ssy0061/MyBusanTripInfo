package com.service.busantrip.domain.story;

import java.util.Date;

public class DiaryTransaction {
	private int	diarytransactionId;
	private String memberId;
	private String storeId;
	private Date transactionTime;
	private String transactionStore;
	private int	transactionAmt;
	private String transactionMemo;
	private String photoUrl;
	
	private Diary diary;
	
	public DiaryTransaction() { }

	public DiaryTransaction(int diarytransactionId, String memberId, String storeId, Date transactionTime,
			String transactionStore, int transactionAmt, String transactionMemo, String photoUrl, Diary diary) {
		super();
		this.diarytransactionId = diarytransactionId;
		this.memberId = memberId;
		this.storeId = storeId;
		this.transactionTime = transactionTime;
		this.transactionStore = transactionStore;
		this.transactionAmt = transactionAmt;
		this.transactionMemo = transactionMemo;
		this.photoUrl = photoUrl;
		this.diary = diary;
	}

	public int getDiarytransactionId() {
		return diarytransactionId;
	}

	public void setDiarytransactionId(int diarytransactionId) {
		this.diarytransactionId = diarytransactionId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public Date getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(Date transactionTime) {
		this.transactionTime = transactionTime;
	}

	public String getTransactionStore() {
		return transactionStore;
	}

	public void setTransactionStore(String transactionStore) {
		this.transactionStore = transactionStore;
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

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

	@Override
	public String toString() {
		return "DiaryTransaction [diarytransactionId=" + diarytransactionId + ", memberId=" + memberId + ", storeId="
				+ storeId + ", transactionTime=" + transactionTime + ", transactionStore=" + transactionStore
				+ ", transactionAmt=" + transactionAmt + ", transactionMemo=" + transactionMemo + ", photoUrl="
				+ photoUrl + ", diary=" + diary + "]";
	}
}
