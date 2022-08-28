package com.service.busantrip.model;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;

public interface storyDAO { // 쿼리문이나 메소드 결정해서 인자값 결정해야함
	public void addStory();
	public Member findStoryMember();
	public void addStoryMember();
	public Member findStoryInviteMember(); //초대멤버검색.. 메소드명 다시 생각해보기
	public void addDiary();
	public Diary findDiaryList();
	public Diary findDiaryDetail();
	public Diary findDiaryTimeline();
	public DiaryTransaction addDiarytransaction();
	public DiaryTransaction addPhotoToDiarytransaction();
	public void dutch();
}
