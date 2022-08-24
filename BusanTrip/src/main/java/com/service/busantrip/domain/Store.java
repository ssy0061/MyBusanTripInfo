package com.service.busantrip.domain;

public class Store {
	private String storeId;
	private String storeName;
	private String storeTele;
	private String storeAddr;
	private String storeWorkshop;
	private String storeHoliday;
	private Double storeLatitude;
	private Double storeLongitude;
	private String storeCategory;
	private int storeTotalvisit;
	
	public Store() {}
	
	public Store(String storeId, String storeName, String storeTele, String storeAddr, String storeWorkshop,
			String storeHoliday, Double storeLatitude, Double storeLongitude, String storeCategory,
			int storeTotalvisit) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.storeTele = storeTele;
		this.storeAddr = storeAddr;
		this.storeWorkshop = storeWorkshop;
		this.storeHoliday = storeHoliday;
		this.storeLatitude = storeLatitude;
		this.storeLongitude = storeLongitude;
		this.storeCategory = storeCategory;
		this.storeTotalvisit = storeTotalvisit;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreTele() {
		return storeTele;
	}

	public void setStoreTele(String storeTele) {
		this.storeTele = storeTele;
	}

	public String getStoreAddr() {
		return storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	public String getStoreWorkshop() {
		return storeWorkshop;
	}

	public void setStoreWorkshop(String storeWorkshop) {
		this.storeWorkshop = storeWorkshop;
	}

	public String getStoreHoliday() {
		return storeHoliday;
	}

	public void setStoreHoliday(String storeHoliday) {
		this.storeHoliday = storeHoliday;
	}

	public Double getStoreLatitude() {
		return storeLatitude;
	}

	public void setStoreLatitude(Double storeLatitude) {
		this.storeLatitude = storeLatitude;
	}

	public Double getStoreLongitude() {
		return storeLongitude;
	}

	public void setStoreLongitude(Double storeLongitude) {
		this.storeLongitude = storeLongitude;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public int getStoreTotalvisit() {
		return storeTotalvisit;
	}

	public void setStoreTotalvisit(int storeTotalvisit) {
		this.storeTotalvisit = storeTotalvisit;
	}

	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName + ", storeTele=" + storeTele + ", storeAddr="
				+ storeAddr + ", storeWorkshop=" + storeWorkshop + ", storeHoliday=" + storeHoliday + ", storeLatitude="
				+ storeLatitude + ", storeLongitude=" + storeLongitude + ", storeCategory=" + storeCategory
				+ ", storeTotalvisit=" + storeTotalvisit + "]";
	}
}