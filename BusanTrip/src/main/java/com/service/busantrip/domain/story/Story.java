package com.service.busantrip.domain.story;

public class Story {
	private int storyId;
	private String storyName;
	
	public Story() { }
	
	public Story(int storyId, String storyName) {
		super();
		this.storyId = storyId;
		this.storyName = storyName;
	}

	public int getStoryId() {
		return storyId;
	}

	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}

	public String getStoryName() {
		return storyName;
	}

	public void setStoryName(String storyName) {
		this.storyName = storyName;
	}

	@Override
	public String toString() {
		return "Story [storyId=" + storyId + ", storyName=" + storyName + "]";
	}
}
