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
	private int diaryId;

	private Diary diary;

	public DiaryTransaction() {
	}

	public DiaryTransaction(int diarytransactionId, String memberId, String storeId, Date transactionTime,
			String transactionStore, int transactionAmt, String transactionMemo, int diaryId) {
		super();
		this.diarytransactionId = diarytransactionId;
		this.memberId = memberId;
		this.storeId = storeId;
		this.transactionTime = transactionTime;
		this.transactionStore = transactionStore;
		this.transactionAmt = transactionAmt;
		this.transactionMemo = transactionMemo;
		this.diaryId = diaryId;
	}
	
//	public DiaryTransaction(int diarytransactionId, String memberId,
//			String transactionStore, int transactionAmt, String transactionMemo) {
//		super();
//		this.diarytransactionId = diarytransactionId;
//		this.memberId = memberId;
//		this.transactionStore = transactionStore;
//		this.transactionAmt = transactionAmt;
//		this.transactionMemo = transactionMemo;
//	}
	

	public int getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
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
				+ ", transactionAmt=" + transactionAmt + ", transactionMemo=" + transactionMemo + ", diaryId=" + diaryId
				+ "]";
	}

}