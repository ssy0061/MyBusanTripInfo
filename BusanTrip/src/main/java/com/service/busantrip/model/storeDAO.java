package com.service.busantrip.model;

import java.util.List;

import com.service.busantrip.domain.Store;
import com.service.busantrip.domain.Transaction;

public interface storeDAO {

	public List<Store> findStoreTransaction(String accountNumber, String storeId);
	public List<Store> findStoreInfo(String storeId);
	public List<Store> findStorePopularByRegion(String region); // 인기가게 지역별
	public List<Store> findStorePopularByPeriod();
	public List<Store> findStorePopularByCategory(String category); // 인기가게 카테고리별
	public List<Store> findStorePopularByPersonal(Transaction transaction); // 개인별 가게 방문 순위
	public void addWishlist(String storeId, String memberId);
	public List<Store> findWishlistInfo(String storeId);
}

// store id, member id, account number ==> vo