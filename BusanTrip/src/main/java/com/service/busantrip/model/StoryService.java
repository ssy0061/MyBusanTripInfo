package com.service.busantrip.model;

import java.util.List;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;
import com.service.busantrip.domain.story.Photo;
import com.service.busantrip.dto.req.DiaryTransactionReqDTO;

public interface StoryService { // 쿼리문이나 메소드 결정해서 인자값 결정해야함
	public void addStory(String storyName, String storyId, String memberId);
	public List<Member> findStoryMember(String storyId);
	public void addStoryMember(String storyId, String memberId);
	public Member findStoryInviteMember(); //초대멤버검색.. 메소드명 다시 생각해보기
	public void addDiary(String storyId, String diaryName);
	public List<Diary> findDiaryList(Diary diary);
	public List<DiaryTransaction> findDiaryTransaction(DiaryTransaction diaryTransaction); 
	public List<Photo> findDiaryPhoto(String transactionId); 
	public void addDiaryTransaction(DiaryTransactionReqDTO dto);
	public void addPhotoToDiaryTransaction(String diaryTransactionId, String photoUrl);
	public void deletePhotoToDiaryTransaction(String photoId);
}
