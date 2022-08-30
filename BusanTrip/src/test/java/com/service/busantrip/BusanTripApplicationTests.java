package com.service.busantrip;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.busantrip.domain.Member;
import com.service.busantrip.model.MemberDAO;

@SpringBootTest
class BusanTripApplicationTests {

	@Autowired
	private MemberDAO memberDAO;
	
//	@Test
//	void findTransactionBySpecificPeriod() {
//		System.out.println(memberDAO.findTransactionBySpecificPeriod("acc111", "2019-01-01", "2019-12-12"));
//	}
//	
//	@Test
//	void findTransactionByMonthPeriod() {
//		System.out.println("findTransactionByMonthPeriod \n" + memberDAO.findTransactionByMonthPeriod("acc222", 6));
//	}
//	
//	@Test
//	void findAllTransaction() {
//		System.out.println(memberDAO.findAllTransaction("acc222"));
//	}
//	
//
	@Test
	void login() {
		Member member = new Member("gwak222", "pass222");
		System.out.println("login \n" + memberDAO.login(member));
	}
}
