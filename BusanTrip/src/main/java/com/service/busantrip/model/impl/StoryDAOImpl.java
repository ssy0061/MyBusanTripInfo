package com.service.busantrip.model.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;
import com.service.busantrip.domain.story.Photo;
import com.service.busantrip.dto.req.DiaryTransactionReqDTO;
import com.service.busantrip.model.StoryDAO;
@Repository
public class StoryDAOImpl implements StoryDAO{
	
	private final String NS = "sql.member.mapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void addStory(String storyName, String storyId, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storyName", storyName);
		map.put("storyId", storyId);
		map.put("memberId", memberId);
		sqlSession.insert(NS+"addStory", map);
	}

	@Override
	public List<Member> findStoryMember(String storyId) {

		return sqlSession.selectList(NS+"findStoryMember", storyId);
	}

	@Override
	public void addStoryMember(String storyId, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storyId", storyId);
		map.put("memberId", memberId);
		sqlSession.insert(NS+"addStoryMember", map);
	}

	@Override
	public Member findStoryInviteMember(String memberId) {
		return sqlSession.selectOne(NS+"findStoryInviteMember", memberId);
	}

	@Override
	public void addDiary(String storyId, String diaryName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storyId", storyId);
		map.put("diaryName", diaryName);
		sqlSession.insert(NS+"addDiary", map);
	}

	@Override
	public List<Diary> findDiaryList(Diary diary) {
		return sqlSession.selectList(NS+"findDiaryList", diary);
	}

	@Override
	public List<DiaryTransaction> findDiaryTransaction(DiaryTransaction diaryTransaction) {
	
		return sqlSession.selectList(NS+"findDiaryTransaction", diaryTransaction);
	}

	@Override
	public List<Photo> findDiaryPhoto(String transactionId) {
		return sqlSession.selectList(NS+"findDiaryPhoto", transactionId);
	}

	@Override
	public void addDiaryTransaction(Transaction transaction, String diaryId, String memberName) {
		DiaryTransactionReqDTO dto = new DiaryTransactionReqDTO(transaction, diaryId, memberName);
		sqlSession.insert(NS+"addDiaryTransaction", dto);
	}

	@Override
	public void addPhotoToDiaryTransaction(String diaryTransactionId, String photoUrl) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("diaryTransactionId", diaryTransactionId);
		map.put("photoUrl", photoUrl);
		sqlSession.insert(NS+"addPhotoToDiaryTransaction", map);
	}

	@Override
	public void deletePhotoToDiaryTransaction(String photoId) {
		sqlSession.delete(NS+"deletePhotoToDiaryTransaction", photoId);
	}
		
}
