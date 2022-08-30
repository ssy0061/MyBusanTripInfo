package com.service.busantrip;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.busantrip.domain.Transaction;
import com.service.busantrip.dto.req.TransactionReqDTO;
import com.service.busantrip.model.MemberDAO;
import com.service.busantrip.model.StoreDAO;

@SpringBootTest
class BusanTripApplicationTests {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private StoreDAO storeDAO;
	
	
	/***** MemberDAOImpl Unit test ******/
//	@Test
//	void join() {
//		Member member = new Member("member666", "pass666", "여섯", "010-6666-6666", "부산시 기장군");
//		memberDAO.join(member);
//	}
	
//	@Test
//	void login() {
//		Member member = new Member("member666", "pass666");
//		System.out.println("login \n" + memberDAO.login(member));
//	}
	
	
//	@Test	
//	void updateCharacter() {	/////////////////////////////////////////////// 테스트 해야함!!
//		Member member = new Member("member666", "pass666");
//		System.out.println("login \n" + memberDAO.login(member));
//	}
	
//	@Test
//	void findAllTransaction() {
//		System.out.println(memberDAO.findAllTransaction("acc222"));
//	}
	
	
//	@Test
//	void findTransactionBySpecificPeriod() {
//		System.out.println(memberDAO.findTransactionBySpecificPeriod("acc111", "2019-01-01", "2019-12-12"));
//	}

//	@Test
//	void findTransactionByMonthPeriod() {
//		System.out.println("findTransactionByMonthPeriod \n" + memberDAO.findTransactionByMonthPeriod("acc222", 6));
//	}

//	@Test
//	void addExternalTrasaction() { /////////////////////////////////////////////// 테스트 해야함!!
//		
//	}

//	@Test
//	void pay() { 
//		 memberDAO.pay("acc222", 10000);
//	}
	
//	@Test
//	void addTransaction() { 
//		Date date = new Date();
//
//		Transaction transaction = new Transaction(date, 21000, "acc222", "284", "스타벅스광안리점");
//		memberDAO.addTransaction(transaction);
//	}
	
	
	/***** StoreDAOImpl Unit test ******/
	
//	public List<Store> findStoreTransaction(String accountNumber, String storeId);
	
//	@Test
//	void findStoreInfo() {
//		List<Store> list = storeDAO.findStoreInfo("2");
//		
//		for(Store st: list) { System.out.println(st); }
//	}
	
//	public List<Store> findStorePopularByRegion(String region); // 인기가게 지역별
//	public List<Store> findStorePopularByPeriod();
//	public List<Store> findStorePopularByCategory(String category); // 인기가게 카테고리별
//	public List<Store> findStorePopularByPersonal(Transaction transaction); // 개인별 가게 방문 순위
//	public void addWishlist(String storeId, String memberId);
//	public List<Store> findWishlistInfo(String storeId);
	
}
