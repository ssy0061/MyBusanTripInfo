package com.service.busantrip.domain;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberTele;
	private String memberAddr;
	private String memberChar;
	
	public Member() { }
	
	public Member(String memberId, String memberPw, String memberName, String memberTele, String memberAddr,
			String memberChar) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberTele = memberTele;
		this.memberAddr = memberAddr;
		this.memberChar = memberChar;
	}

	
	
	public Member(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberTele() {
		return memberTele;
	}

	public void setMemberTele(String memberTele) {
		this.memberTele = memberTele;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public String getMemberChar() {
		return memberChar;
	}

	public void setMemberChar(String memberChar) {
		this.memberChar = memberChar;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberTele=" + memberTele + ", memberAddr=" + memberAddr + ", memberChar=" + memberChar + "]";
	}
}
