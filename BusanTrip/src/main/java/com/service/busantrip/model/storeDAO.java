package com.service.busantrip.model;

import java.util.List;

import com.service.busantrip.domain.Store;
import com.service.busantrip.domain.Transaction;

public interface storeDAO {

	public List<Store> findStoreTransaction(Transaction tranaction, String accountNumber, String storeId);
	public List<Store> findStoreInfo(Store store, String storeId);
	public List<Store> findStorePopularByRegion(Store store, String region); // 인기가게 지역별
	public List<Store> findStorePopularByPeriod(Store store, Transaction transaction); //인자값 필요한지 의문?.. List<Store>맞는지 의문?? // 인기가게 기간별
	public List<Store> findStorePopularByCategory(Store store); // 인기가게 카테고리별
	public List<Store> findStorePopularByPersonal(Transaction transaction); // 개인별 가게 방문 순위
	public void addWishlist(String storeId, String memeberId);
	public List<Store> findWishlistInfo(String memberId, String storeId);
}
