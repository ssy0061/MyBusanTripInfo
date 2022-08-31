package com.service.busantrip.domain.story;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Diary {
	private int	diaryId;
	private String diaryName;
	private Date diaryMakedate;
	private int storyId;
	
	@JsonIgnore
	private Story story;
	
	public Diary() { }

	public Diary(int diaryId, String diaryName, Date diaryMakedate, int storyId) {
		super();
		this.diaryId = diaryId;
		this.diaryName = diaryName;
		this.diaryMakedate = diaryMakedate;
		this.storyId = storyId;
	}

	
	
	
	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public int getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}

	public String getDiaryName() {
		return diaryName;
	}

	public void setDiaryName(String diaryName) {
		this.diaryName = diaryName;
	}

	public Date getDiaryMakedate() {
		return diaryMakedate;
	}

	public void setDiaryMakedate(Date diaryMakedate) {
		this.diaryMakedate = diaryMakedate;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	@Override
	public String toString() {
		return "Diary [diaryId=" + diaryId + ", diaryName=" + diaryName + ", diaryMakedate=" + diaryMakedate
				+ ", storyId=" + storyId + "]";
	}


}
