package com.service.busantrip.domain.story;

public class Dutch {
	private int dutchId;
	private int dutchAmt;
	
	private Diary diary;
	
	public Dutch() { }

	public Dutch(int dutchId, int dutchAmt, Diary diary) {
		super();
		this.dutchId = dutchId;
		this.dutchAmt = dutchAmt;
		this.diary = diary;
	}

	public int getDutchId() {
		return dutchId;
	}

	public void setDutchId(int dutchId) {
		this.dutchId = dutchId;
	}

	public int getDutchAmt() {
		return dutchAmt;
	}

	public void setDutchAmt(int dutchAmt) {
		this.dutchAmt = dutchAmt;
	}

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

	@Override
	public String toString() {
		return "Dutch [dutchId=" + dutchId + ", dutchAmt=" + dutchAmt + ", diary=" + diary + "]";
	}

}
