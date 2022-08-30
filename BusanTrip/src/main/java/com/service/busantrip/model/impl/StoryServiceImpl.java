package com.service.busantrip.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;
import com.service.busantrip.domain.story.Photo;
import com.service.busantrip.dto.req.DiaryTransactionReqDTO;
import com.service.busantrip.model.StoryDAO;
import com.service.busantrip.model.StoryService;
@Service
public class StoryServiceImpl implements StoryService{
	@Autowired
	private StoryDAO storyDAO;
		
	@Override
	public void addStory(String storyName, String storyId, String memberId) {
		storyDAO.addStory(storyName, storyId, memberId);
		
	}

	@Override
	public List<Member> findStoryMember(String storyId) {
		return storyDAO.findStoryMember(storyId);
	}

	@Override
	public void addStoryMember(String storyId, String memberId) {
		storyDAO.addStoryMember(storyId, memberId);
		
	}

	@Override
	public Member findStoryInviteMember() {
		return storyDAO.findStoryInviteMember();
	}

	@Override
	public void addDiary(String storyId, String diaryName) {
		storyDAO.addDiary(storyId, diaryName);
	}

	@Override
	public List<Diary> findDiaryList(Diary diary) {
		return storyDAO.findDiaryList(diary);
	}

	@Override
	public List<DiaryTransaction> findDiaryTransaction(DiaryTransaction diaryTransaction) {
		return storyDAO.findDiaryTransaction(diaryTransaction);
	}

	@Override
	public List<Photo> findDiaryPhoto(String transactionId) {
		return storyDAO.findDiaryPhoto(transactionId);
	}

	@Override
	public void addDiaryTransaction(Transaction transaction, String diaryId, String memberName) {
		storyDAO.addDiaryTransaction(transaction, diaryId, memberName);
		
	}

	@Override
	public void addPhotoToDiaryTransaction(String diaryTransactionId, String photoUrl) {
		storyDAO.addPhotoToDiaryTransaction(diaryTransactionId, photoUrl);
		
	}

	@Override
	public void deletePhotoToDiaryTransaction(String photoId) {
		storyDAO.deletePhotoToDiaryTransaction(photoId);
		
	}

		
}
