package com.service.busantrip.dto.req;

import com.service.busantrip.domain.Transaction;

public class DiaryTransactionReqDTO {
	private Transaction transaction;
	private String diaryId;
	private String memberName;
	
	public DiaryTransactionReqDTO() {}

	public DiaryTransactionReqDTO(Transaction transaction, String diaryId, String memberName) {
		super();
		this.transaction = transaction;
		this.diaryId = diaryId;
		this.memberName = memberName;
	}

	
	public Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

	public String getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(String diaryId) {
		this.diaryId = diaryId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "DiaryTransactionReqDTO [transaction=" + transaction + ", diaryId=" + diaryId + ", memberName="
				+ memberName + "]";
	}

}
