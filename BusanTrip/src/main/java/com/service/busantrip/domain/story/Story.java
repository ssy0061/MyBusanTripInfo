package com.service.busantrip.domain.story;

public class Story {
	private int storyId;
	private String storyName;
	private String storySubtitle;
	
	public Story() { }
	
	public Story(int storyId, String storyName, String storySubtitle) {
		super();
		this.storyId = storyId;
		this.storyName = storyName;
		this.storySubtitle = storySubtitle;
	}
	
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
	
	public String getStorySubtitle() {
		return storySubtitle;
	}

	public void setStorySubtitle(String storySubtitle) {
		this.storySubtitle = storySubtitle;
	}

	@Override
	public String toString() {
		return "Story [storyId=" + storyId + ", storyName=" + storyName + ", storySubtitle=" + storySubtitle + "]";
	}

}
