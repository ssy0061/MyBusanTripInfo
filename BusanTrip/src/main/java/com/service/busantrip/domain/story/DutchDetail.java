package com.service.busantrip.domain.story;

public class DutchDetail {
	private int dutchdetailId;
	private int dutchdetailAmt;
	private String memberId;
	
	private Dutch dutch;
	
	public DutchDetail() { }

	public DutchDetail(int dutchdetailId, int dutchdetailAmt, String memberId, Dutch dutch) {
		super();
		this.dutchdetailId = dutchdetailId;
		this.dutchdetailAmt = dutchdetailAmt;
		this.memberId = memberId;
		this.dutch = dutch;
	}

	public int getDutchdetailId() {
		return dutchdetailId;
	}

	public void setDutchdetailId(int dutchdetailId) {
		this.dutchdetailId = dutchdetailId;
	}

	public int getDutchdetailAmt() {
		return dutchdetailAmt;
	}

	public void setDutchdetailAmt(int dutchdetailAmt) {
		this.dutchdetailAmt = dutchdetailAmt;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Dutch getDutch() {
		return dutch;
	}

	public void setDutch(Dutch dutch) {
		this.dutch = dutch;
	}

	@Override
	public String toString() {
		return "DutchDetail [dutchdetailId=" + dutchdetailId + ", dutchdetailAmt=" + dutchdetailAmt + ", memberId="
				+ memberId + ", dutch=" + dutch + "]";
	}
}
