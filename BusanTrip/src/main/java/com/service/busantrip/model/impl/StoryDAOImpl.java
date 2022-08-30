package com.service.busantrip.model.impl;

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
	public void addStory(@Param("storyName") String storyName, 
			 			 @Param("storyId") String storyId, 
			 			 @Param("memberId") String memberId) {
		
		sqlSession.insert(NS+"addStory");
	}

	@Override
	public List<Member> findStoryMember(String storyId) {

		return sqlSession.selectList(NS+"findStoryMember", storyId);
	}

	@Override
	public void addStoryMember( @Param("storyId") String storyId,  
								@Param("memberId") String memberId) {

		sqlSession.insert(NS+"addStoryMember");
	}

	@Override
	public Member findStoryInviteMember() {
	
		return sqlSession.selectOne(NS+"findStoryInviteMember", null);
	}

	@Override
	public void addDiary(@Param("storyId") String storyId, 
			 			 @Param("diaryName") String diaryName) {
		
		sqlSession.insert(NS+"addDiary");
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
	public void addPhotoToDiaryTransaction(@Param("diaryTransactionId") String diaryTransactionId, 
										   @Param("photoUrl") String photoUrl) {
		
		sqlSession.insert(NS+"addPhotoToDiaryTransaction");
	}

	@Override
	public void deletePhotoToDiaryTransaction(String photoId) {
		sqlSession.delete(NS+"deletePhotoToDiaryTransaction", photoId);
	}
		
}
