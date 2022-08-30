package com.service.busantrip.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.busantrip.domain.Store;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.model.StoreDAO;
import com.service.busantrip.model.StoreService;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public List<Store> findStoreTransaction(String accountNumber, String storeId) {
		return storeDAO.findStoreTransaction(accountNumber, storeId);
	}

	@Override
	public List<Store> findStoreInfo(String storeId) {
		return storeDAO.findStoreInfo(storeId);
	}

	@Override
	public List<Store> findStorePopularByRegion(String region) {
		return storeDAO.findStorePopularByRegion(region);
	}

	@Override
	public List<Store> findStorePopularByPeriod() {
		return storeDAO.findStorePopularByPeriod();
	}

	@Override
	public List<Store> findStorePopularByCategory(String category) {
		return storeDAO.findStorePopularByCategory(category);
	}

	@Override
	public List<Store> findStorePopularByPersonal(Transaction transaction) {
		return storeDAO.findStorePopularByPersonal(transaction);
	}

	@Override
	public void addWishlist(String storeId, String memberId) {
		storeDAO.addWishlist(storeId, memberId);
		
	}

	@Override
	public List<Store> findWishlistInfo(String storeId) {
		return storeDAO.findWishlistInfo(storeId);
	}

}