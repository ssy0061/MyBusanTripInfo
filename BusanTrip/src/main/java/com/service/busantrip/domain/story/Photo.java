package com.service.busantrip.domain.story;

public class Photo {
	private int photoId;
	private String photoUrl;
	private int diaryTransactionId;
	
	private DiaryTransaction diaryTransaction;

	public Photo() {
	}

	public Photo(int photoId, String photoUrl, int diaryTransactionId) {
		super();
		this.photoId = photoId;
		this.photoUrl = photoUrl;
		this.diaryTransactionId = diaryTransactionId;
	}

	
	
	public int getDiaryTransactionId() {
		return diaryTransactionId;
	}

	public void setDiaryTransactionId(int diaryTransactionId) {
		this.diaryTransactionId = diaryTransactionId;
	}

	public int getPhotoId() {
		return photoId;
	}

	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public DiaryTransaction getDiaryTransaction() {
		return diaryTransaction;
	}

	public void setDiaryTransaction(DiaryTransaction diaryTransaction) {
		this.diaryTransaction = diaryTransaction;
	}

	@Override
	public String toString() {
		return "Photo [photoId=" + photoId + ", photoUrl=" + photoUrl + ", diaryTransactionId=" + diaryTransactionId
				+ "]";
	}

}
