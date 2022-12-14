package com.service.busantrip.domain.story;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.service.busantrip.domain.Member;

public class StoryMember {
	private int storymemberId;
	private String storymemberAuth;
	private String memberId;
	private String storyId;
	private String storymemberName;
	
	@JsonIgnore
	private Member member;
	@JsonIgnore
	private Story story;
	
	public StoryMember() { }

	public StoryMember(int storymemberId, String storymemberAuth, String memberId, String storyId, Member member,
			Story story, String storymemberName) {
		super();
		this.storymemberId = storymemberId;
		this.storymemberAuth = storymemberAuth;
		this.memberId = memberId;
		this.storyId = storyId;
		this.member = member;
		this.story = story;
		this.storymemberName = storymemberName;
	}


	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStoryId() {
		return storyId;
	}

	public void setStoryId(String storyId) {
		this.storyId = storyId;
	}

	public int getStorymemberId() {
		return storymemberId;
	}

	public void setStorymemberId(int storymemberId) {
		this.storymemberId = storymemberId;
	}

	public String getStorymemberAuth() {
		return storymemberAuth;
	}

	public void setStorymemberAuth(String storymemberAuth) {
		this.storymemberAuth = storymemberAuth;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public String getStorymemberName() {
		return storymemberName;
	}

	public void setStorymemberName(String storymemberName) {
		this.storymemberName = storymemberName;
	}

	@Override
	public String toString() {
		return "StoryMember [storymemberId=" + storymemberId + ", storymemberAuth=" + storymemberAuth + ", memberId="
				+ memberId + ", storyId=" + storyId + ", storymemberName=" + storymemberName + "]";
	}

}
