package com.service.busantrip.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.busantrip.domain.Store;
import com.service.busantrip.model.StoreService;

@Controller
@RequestMapping("store")
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@PostMapping("findStoreInfo") //가게 세부정보
	@ResponseBody
	public List<Store> findStoreInfo(String storeId, Model model, HttpSession session) {
		List<Store> storeInfo = storeService.findStoreInfo(storeId);
		return storeInfo;
	}
	
	@PostMapping("findStoreTransaction") //가게 세부정보 조회시 해당 가게 거래내역..
	@ResponseBody
	public List<Store> findStoreTransaction(String memberId, String storeId, Model model, HttpSession session) {
		List<Store> storeTransaction = storeService.findStoreTransaction(memberId, storeId);
		return storeTransaction;
	}
	
	@PostMapping("findStorePopularByPersonal") //개인별 자주 방문가게
	@ResponseBody
	public List<Map<String, Object>> findStorePopularByPersonal(String memberId) {
		List<Map<String, Object>> storePopularByPersonal = storeService.findStorePopularByPersonal(memberId);
		return storePopularByPersonal;
	}
	
	@PostMapping("findStorePopularByRegion") //지역별 인기가게
	@ResponseBody
	public List<Store> findStorePopularByRegion(String region) {
		List<Store> storePopularByRegion = storeService.findStorePopularByRegion(region);
		return storePopularByRegion;
	}
	
	@PostMapping("findStorePopularByPeriod") //기간별 인기가게
	@ResponseBody
	public List<Store> findStorePopularByPeriod() {
		List<Store> storePopularByPeriod = storeService.findStorePopularByPeriod();
		return storePopularByPeriod;
	}
	
	@PostMapping("findStorePopularByCategory") //카테고리별 인기가게
	@ResponseBody
	public List<Store> findStorePopularByCategory(String category) {
		List<Store> storePopularByCategory = storeService.findStorePopularByCategory(category);
		return storePopularByCategory;
	}
	

}
