package com.service.busantrip.model.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;
import com.service.busantrip.domain.story.Photo;
import com.service.busantrip.domain.story.Story;
import com.service.busantrip.model.MemberDAO;
import com.service.busantrip.model.StoryDAO;
import com.service.busantrip.model.StoryService;
@Service
public class StoryServiceImpl implements StoryService{
	@Autowired
	private StoryDAO storyDAO;
	@Autowired
	private MemberDAO memberDAO;
	
		
	@Override
	public int addStory(String storyName, String memberId, String subtitle) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storyName", storyName);
		map.put("subtitle", subtitle);
		storyDAO.addStory(storyName, subtitle);
		int storyId = storyDAO.findStoryId(storyName);
	//	System.out.println("storyId:: " + storyId + ", storyName:: " + storyName);
		String memberName = memberDAO.findMemberName(memberId);
		
		HashMap<String, Object> leaderMap = new HashMap<String, Object>();
		leaderMap.put("storyId", storyId);
		leaderMap.put("memberId", memberId);
		leaderMap.put("memberName", memberName);
		
		storyDAO.addStoryMemberLeader(storyId, memberId, memberName);
		return storyId;
	}
	
	@Override
	public void deleteStory(int storyId) {
		storyDAO.deleteStory(storyId);
	}
	
	@Override
	public void updateStory(String memberList, int storyId) {
		storyDAO.updateStory(memberList, storyId);
	}
	
	@Override
	public String getStoryName(String storyId) {
		return storyDAO.getStoryName(storyId);
	}

	@Override
	public List<Member> findStoryMember(String storyId) {
		return storyDAO.findStoryMember(storyId);
	}

	@Override
	public void addStoryMember(String storyId, String memberId) {
		String memberName = memberDAO.findMemberName(memberId);
		storyDAO.addStoryMember(storyId, memberId, memberName);
		
	}
	
	@Override
	public List<Story> findAllStoryList(String memberId) {
		return storyDAO.findAllStoryList(memberId);
	}

	@Override
	public Member findStoryInviteMember(String memberId) {
		return storyDAO.findStoryInviteMember(memberId);
	}

	@Override
	public void addDiary(String storyId, String diaryName) {
		storyDAO.addDiary(storyId, diaryName);
	}

	@Override
	public List<Diary> findAllDiaryList(String storyId) {
		return storyDAO.findAllDiaryList(storyId);
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
