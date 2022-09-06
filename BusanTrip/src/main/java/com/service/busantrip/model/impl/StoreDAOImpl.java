package com.service.busantrip.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.busantrip.domain.Store;
import com.service.busantrip.model.StoreDAO;

@Repository
public class StoreDAOImpl implements StoreDAO{
	private final String NS = "sql.store.mapper.";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<Store> findStoreTransaction(String memberId, String storeId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("storeId", storeId);
		return sqlsession.selectList(NS+"findStoreTransaction", map);
	}

	@Override
	public List<Store> findStoreInfo(String storeId) {

		return sqlsession.selectList(NS+"findStoreInfo", storeId);
	}

	@Override
	public String findStoreId(String storeName) {
		return sqlsession.selectOne(NS+"findStoreId", storeName);
	}
	
	@Override
	public List<Store> findStorePopularByRegion(String region) {

		return sqlsession.selectList(NS+"findStorePopularByRegion", region);
	}

	@Override
	public List<Store> findStorePopularByPeriod() {

		return sqlsession.selectList(NS+"findStorePopularByPeriod", null);
	}

	@Override
	public List<Store> findStorePopularByCategory(String category) {

		return sqlsession.selectList(NS+"findStorePopularByCategory", category);
	}

	@Override
	public List<Map<String, Object>> findStorePopularByPersonal(String memberId) {
	
		return sqlsession.selectList(NS+"findStorePopularByPersonal", memberId);
	}

	@Override
	public void addWishlist(String storeId, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storeId", storeId);
		map.put("memberId", memberId);
		sqlsession.insert(NS+"addWishlist", map);
	}

	@Override
	public void deleteWishlist(String storeId, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storeId", storeId);
		map.put("memberId", memberId);
		sqlsession.delete(NS+"deleteWishlist", map);
	}

	@Override
	public int findExistWishlist(String storeId, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storeId", storeId);
		map.put("memberId", memberId);
		return (sqlsession.selectOne(NS+"findExistWishlist", map) != null) ? 1 : 0;
		
	}
	
	@Override
	public List<Store> findAllWishlist(String memberId) {
		return sqlsession.selectList(NS+"findAllWishlist", memberId);
	}



}
