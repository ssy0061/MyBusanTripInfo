package com.service.busantrip.domain.story;

import com.service.busantrip.domain.Member;

public class StoryMember {
	private int storymemberId;
	private String storymemberAuth;
	
	private Member member;
	private Story story;
	
	public StoryMember() { }

	public StoryMember(int storymemberId, String storymemberAuth, Member member, Story story) {
		super();
		this.storymemberId = storymemberId;
		this.storymemberAuth = storymemberAuth;
		this.member = member;
		this.story = story;
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

	@Override
	public String toString() {
		return "StoryMember [storymemberId=" + storymemberId + ", storymemberAuth=" + storymemberAuth + ", member="
				+ member + ", story=" + story + "]";
	}

}
