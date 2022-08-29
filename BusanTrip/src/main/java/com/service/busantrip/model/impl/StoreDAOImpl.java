package com.service.busantrip.model.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.busantrip.domain.Store;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.model.StoreDAO;

@Repository
public class StoreDAOImpl implements StoreDAO{
	private final String NS = "sql.member.mapper.";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<Store> findStoreTransaction(@Param("accountNumber") String accountNumber, 
											@Param("storeId") String storeId) {
	
		return sqlsession.selectList(NS+"findStoreTransaction");
	}

	@Override
	public List<Store> findStoreInfo(String storeId) {

		return sqlsession.selectList(NS+"findStoreInfo", storeId);
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
	public List<Store> findStorePopularByPersonal(Transaction transaction) {
	
		return sqlsession.selectList(NS+"findStorePopularByPersonal", transaction);
	}

	@Override
	public void addWishlist(@Param("storeId") String storeId, 
							@Param("memberId") String memberId) {

		sqlsession.insert(NS+"addWishlist");
	}

	@Override
	public List<Store> findWishlistInfo(String storeId) {

		return sqlsession.selectList(NS+"findWishlistInfo", storeId);
	}

}
