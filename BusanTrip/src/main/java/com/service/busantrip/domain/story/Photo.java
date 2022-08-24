package com.service.busantrip.domain.story;

public class Photo {
	private int photoId;
	private String photoUrl;
	
	private Diary diary;
	
	public Photo() { }

	public Photo(int photoId, String photoUrl, Diary diary) {
		super();
		this.photoId = photoId;
		this.photoUrl = photoUrl;
		this.diary = diary;
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

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

	@Override
	public String toString() {
		return "Photo [photoId=" + photoId + ", photoUrl=" + photoUrl + ", diary=" + diary + "]";
	}
}
