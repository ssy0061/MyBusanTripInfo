package com.service.busantrip.domain;

public class Wishlist {
	private int wishlistId;
	private String memberId;
	private String storeId;

	private Member member;
	private Store store;
	
	public Wishlist() {}

	public Wishlist(int wishlistId, String memberId, String storeId, Member member, Store store) {
		super();
		this.wishlistId = wishlistId;
		this.memberId = memberId;
		this.storeId = storeId;
		this.member = member;
		this.store = store;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
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
		return "Wishlist [wishlistId=" + wishlistId + ", memberId=" + memberId + ", storeId=" + storeId + "]";
	}

	
}
