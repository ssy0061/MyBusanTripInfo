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
import com.service.busantrip.domain.story.Story;
import com.service.busantrip.dto.req.DiaryTransactionReqDTO;
import com.service.busantrip.model.StoryDAO;
@Repository
public class StoryDAOImpl implements StoryDAO{
	
	private final String NS = "sql.story.mapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public String addStory(String storyName, String memberId, String subtitle) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storyName", storyName);
		map.put("subtitle", subtitle);
		sqlSession.insert(NS+"addStory", map);
		
		String storyId = sqlSession.selectOne(NS+"getStoryId", storyName);
		System.out.println("storyId:: " + storyId + ", storyName:: " + storyName);
	
		String memberName = sqlSession.selectOne("sql.member.mapper."+"getMemberName", memberId);
		
		HashMap<String, Object> leaderMap = new HashMap<String, Object>();
		leaderMap.put("storyId", storyId);
		leaderMap.put("memberId", memberId);
		leaderMap.put("memberName", memberName);
		
		sqlSession.insert(NS+"addStoryMemberLeader",leaderMap);
		
		return storyId;
	}
	
	@Override
	public void deleteStory(int storyId) {
		System.out.println("delete in " + storyId);
		sqlSession.delete(NS+"deleteStory", storyId);
		
	}
	
	@Override
	public void updateStory(String memberList, int storyId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberList);
		map.put("storyId", storyId);
		System.out.println("memberList:: " + memberList + ", storyId :: " + storyId);
		
		sqlSession.update(NS+"updateStory", map);
	}
	
	@Override
	public String getStoryName(String storyId) {
		return sqlSession.selectOne(NS+"getStoryName", storyId);
	}

	@Override
	public List<Member> findStoryMember(String storyId) {

		return sqlSession.selectList(NS+"findStoryMember", storyId);
	}

	@Override
	public void addStoryMember(String storyId, String memberId) {
		String memberName = sqlSession.selectOne("sql.member.mapper."+"getMemberName", memberId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("storyId", storyId);
		map.put("memberId", memberId);
		map.put("memberName", memberName);
		sqlSession.insert(NS+"addStoryMember", map);
	}

	@Override
	public List<Story> findAllStoryList(String memberId) {
		return sqlSession.selectList(NS+"findAllStoryList", memberId);
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
	public List<Diary> findAllDiaryList(String storyId) {
		return sqlSession.selectList(NS+"findAllDiaryList", storyId);
	}

	@Override
	public List<DiaryTransaction> findDiaryTransaction(DiaryTransaction diaryTransaction) {
	
		return sqlSession.selectList(NS+"findDiaryTransaction", diaryTransaction);
	}

	
	
	// 이밑으로 테스트 안되어있음
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
