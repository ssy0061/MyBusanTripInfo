package com.service.busantrip.model;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;

public interface storyDAO { // 쿼리문이나 메소드 결정해서 인자값 결정해야함
	public void addStory(String storyName);
	public Member findStoryMember(String storyId);
	public void addStoryMember(String storyId, String memberId);
	public Member findStoryInviteMember(); //초대멤버검색.. 메소드명 다시 생각해보기
	public void addDiary(String storyId, String diaryName);
	public Diary findDiaryList(Diary diary);
	public Diary findDiaryDetail(Diary diary, DiaryTransaction diaryTransaction);
	public Diary findDiaryTimeline(Diary diary, DiaryTransaction diaryTransaction);
	public DiaryTransaction addDiaryTransaction(String diaryId, Transaction transaction, Member member);
	public DiaryTransaction addPhotoToDiaryTransaction(String diaryTransactionId, String photoUrl);
}
