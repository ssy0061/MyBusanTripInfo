package com.service.busantrip;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.busantrip.model.MemberDAO;
import com.service.busantrip.model.StoreDAO;
import com.service.busantrip.model.StoryDAO;

@SpringBootTest
class BusanTripApplicationTests {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private StoreDAO storeDAO;
	
	@Autowired
	private StoryDAO storyDAO;
	
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
//	void updateCharacter() {
//		memberDAO.updateCharacter("/img/gear.png", "member666");
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
//	void addExternalTrasaction() { //테스트 데이터 생성 후 테스트 해야함.
//		INSERT INTO
//	
//		SELECT
//	}

//	@Test
//	void pay() { 
//		 memberDAO.pay("acc222", 10000);
//	}
	
//	@Test
//	void addTransaction() { 
//		Date date = new Date();
//
//		Transaction transaction = new Transaction("acc222", date, 21000,  "306", "커피구루마");
//		memberDAO.addTransaction(transaction);
//	}
	
//	@Test
//	void updateTransactionMemo() { 
//		Transaction transaction = new Transaction(1, "junit_test");
//		memberDAO.updateTransactionMemo(transaction);
//	}
	
//	@Test
//	void findAccount() { 
//		System.out.println(memberDAO.findAccount("gwak222"));
//	}
	
//	@Test
//	void getBalance() { 
//		System.out.println(memberDAO.getBalance("acc222"));
//	}
	
//	@Test
//	void charge() { 
//		System.out.println(memberDAO.charge("acc222", 50000));
//	}
	
	
	
	
	
	
	
	
	/***** StoreDAOImpl Unit test ******/
	
//	public List<Store> findStoreTransaction(String accountNumber, String storeId);
	
//	@Test
//	void findStoreTransaction() { 
//		System.out.println(storeDAO.findStoreTransaction("acc222", "1"));
//	}
	
//	@Test
//	void findStoreInfo() { 
//		System.out.println(storeDAO.findStoreTransaction("acc222", "1"));
//	}
	
//	@Test
//	void findStorePopularByRegion() {
//		List<Store> list = storeDAO.findStorePopularByRegion("중구");
//		
//		for(Store st: list) { System.out.println(st); }
//	}
	
//	@Test
//	void findStorePopularByPeriod() {
//		List<Store> list = storeDAO.findStorePopularByPeriod();
//		
//		for(Store st: list) { System.out.println(st); }
//	}
	
//	@Test
//	void findStorePopularByCategory() {
//		List<Store> list = storeDAO.findStorePopularByCategory("카페");
//		
//		for(Store st: list) { System.out.println(st); }
//	}
	
//	@Test
//	void findStorePopularByPersonal() {
//		List<Map<String, Object>> list = storeDAO.findStorePopularByPersonal("acc222");
//		for(Map<String, Object> st: list) {
//			for(String key : st.keySet()) {
//				System.out.println(key);
//				System.out.println(st.get(key));
//			}
//		}
//		System.out.println(storeDAO.findStorePopularByPersonal("acc222"));
//	}
	
//	@Test
//	void addWishlist() {
//		 storeDAO.addWishlist("1","gwak222");
//	}
	
//	@Test
//	void findAllWishlist() {
//		 System.out.println(storeDAO.findAllWishlist("gwak222"));
//	}
	
	/***** StoryDAOImpl Unit test ******/
	
//	@Test
//	void addStory() {
//		 storyDAO.addStory("testStory", "gwak222");
//	}
	
//	@Test
//	void findStoryMember() {
//		 System.out.println(storyDAO.findStoryMember("3"));
//	}
	
//	@Test
//	void addStoryMember() {
//		 storyDAO.addStoryMember("3","heo333");
//	}
	
//	@Test
//	void findStoryInviteMember() {
//		 System.out.println(storyDAO.findStoryInviteMember("heo333"));
//	}
	
//	@Test
//	void addDiary() {
//		 storyDAO.addDiary("3", "test_diary");
//	}
	
//	@Test
//	void findDiaryList() {
//		System.out.println(storyDAO.findDiaryList("3"));
//	}
	
	//storyDAOImpl 에서는 addDiaryTransaction이후 메소드 모두 테스트 해야함..
}
