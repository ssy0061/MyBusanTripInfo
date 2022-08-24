package com.service.busantrip.domain;

import java.util.Date;

public class Wishlist {
	private int wishlistId;


	private Member member;
	private Store store;
	
	public Wishlist() {}

	public Wishlist(int wishlistId, Member member, Store store) {
		super();
		this.wishlistId = wishlistId;
		this.member = member;
		this.store = store;
	}

	public int getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(int wishlistId) {
		this.wishlistId = wishlistId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	@Override
	public String toString() {
		return "Wishlist [wishlistId=" + wishlistId + ", member=" + member + ", store=" + store + "]";
	}
}
