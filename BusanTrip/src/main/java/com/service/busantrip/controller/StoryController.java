package com.service.busantrip.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.Transaction;
import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.DiaryTransaction;
import com.service.busantrip.domain.story.Photo;
import com.service.busantrip.domain.story.Story;
import com.service.busantrip.model.MemberService;
import com.service.busantrip.model.StoryService;

@Controller
@RequestMapping("story")
public class StoryController {
	@Autowired
	StoryService storyService;
	@Autowired
	MemberService memberService;

	String memberListAll = "";

	@PostMapping("deleteStory")
	@ResponseBody
	public void deleteStory(int storyId, Model model, HttpSession session) {
//		System.out.println("deleteStory:: " + storyId);
		storyService.deleteStory(storyId);
	}

	@PostMapping("findIdExist")
	@ResponseBody
	public Boolean findIdExist(String memberId, Model model, HttpSession session) {
		return memberService.findIdExist(memberId);
	}

	@PostMapping("addStory")
	@ResponseBody
	public String addStory(String storyName, String memberId, Model model, HttpSession session) {
		memberListAll = "";
		String storyId = storyService.addStory(storyName, memberId, memberId);
		memberListAll += memberId + " ";

		return storyId;
	}

	@PostMapping("addStoryMember")
	@ResponseBody
	public int addStoryMember(String storyId, @RequestParam(value = "memberList[]") List<String> memberList,
			Model model, HttpSession session) {
		int count = 0;

		for (String memberId : memberList) {
			storyService.addStoryMember(storyId, memberId);
			memberListAll += memberId + " ";
			count += 1;
		}

//		System.out.println("str_memberList:: " + memberListAll);
		storyService.updateStory(memberListAll, Integer.parseInt(storyId));

		return count;
	}

	@PostMapping("findStoryName")
	@ResponseBody
	public String findStoryName(String storyId) {
		return storyService.findStoryName(storyId);
	}

	@PostMapping("findDiaryName")
	@ResponseBody
	public String findDiaryName(String diaryId) {
		return storyService.findDiaryName(diaryId);
	}

	@PostMapping("findStoryMember")
	@ResponseBody
	public List<Member> findStoryMember(String storyId, Model model, HttpSession session) {
//		System.out.println("findStoryMember..storyId:: " + storyId);

		List<Member> list = storyService.findStoryMember(storyId);

//		System.out.println(list);

		return list;
	}

	@PostMapping("addDiary")
	@ResponseBody
	public void addDiary(String storyId, String diaryName, Model model, HttpSession session) {
		// System.out.println("storyId:: " + storyId + " diaryName:: " + diaryName);

		storyService.addDiary(storyId, diaryName);
	}

	@PostMapping("findAllStory")
	@ResponseBody
	public List<Story> findAllStoryList(String memberId, Model model, HttpSession session) {
		// String memberId = (String) session.getAttribute("memberId");
		List<Story> list = storyService.findAllStoryList(memberId);
		// System.out.println("memberId:: " + memberId);

		return list;
	}

	@PostMapping("findAllDiaryList")
	@ResponseBody
	public List<Diary> findAllDiaryList(String storyId, Model model, HttpSession session) {
		// String memberId = (String) session.getAttribute("memberId");
		List<Diary> list = storyService.findAllDiaryList(storyId);
		// System.out.println("storyId:: " + storyId);

		return list;
	}

	/////////////////////////////////////////////////////////////////

	@PostMapping("findAllDiaryTransaction")
	@ResponseBody
	public List<DiaryTransaction> findAllDiaryTransaction(int diaryId) {

		return storyService.findAllDiaryTransaction(diaryId);
	}

	@PostMapping("findDiaryTransactionByMember")
	@ResponseBody
	public List<DiaryTransaction> findDiaryTransactionByMember(String memberId) {

		return storyService.findDiaryTransactionByMember(memberId);
	}

	@PostMapping("findDiaryPhoto")
	@ResponseBody
	public List<Photo> findDiaryPhoto(String transactionId) {
		return storyService.findDiaryPhoto(transactionId);
	}

	@PostMapping("addDiaryTransaction")
	@ResponseBody
	public void addDiaryTransaction(Transaction transaction, String diaryId, String memberName) {
		storyService.addDiaryTransaction(transaction, diaryId, memberName);

	}

	
	/*
	 * @PostMapping("addDiaryTransactionDTO")
	 * 
	 * @ResponseBody public void addDiaryTransactionDTO(@RequestBody
	 * DiaryTransactionReqDTO dto){
	 * storyService.addDiaryTransaction(dto.getTransaction(), dto.getDiaryId(),
	 * dto.getMemberName()); }
	 */
	
	@PostMapping("addDiaryTransactionMap")
	 @ResponseBody public void addDiaryTransactionDTO(@RequestParam Map<String, Object> param){
		/* System.out.println("in ctr:: " + (Transaction)param.get("transaction")); */
		/* System.out.println("in ctr:: " + transaction); */
		int transactionId = Integer.parseInt((String)param.get("transactionId"));
		Transaction transaction = memberService.findTransactionByTransactionId(transactionId);
		
		System.out.println("in ctr:: " + transaction);
		
		 storyService.addDiaryTransaction(transaction, 
				 						(String)param.get("diaryId"), 
				 						(String)param.get("memberName"));
	 }
	 

	@PostMapping("addPhotoToDiaryTransaction")
	@ResponseBody
	public void addPhotoToDiaryTransaction(@RequestPart(value = "photo", required = false) MultipartFile mFile, 
										   @RequestPart(value = "diaryTransactionId") String diaryTransactionId, 
										   HttpServletRequest request) {
		System.out.println(mFile);
		System.out.println(diaryTransactionId);
		/* MultipartFile mFile = photo.getUploadFile(); */
		System.out.println("MultipartFile... " + mFile);
		
		if(mFile.isEmpty()!=true) { //업로드 된 파일이 있다면
			System.out.println("업로드한 파일명 " + mFile.getOriginalFilename());
		}
		
		String root = ("/img");
		System.out.println("root " + root);
		
		/* String path = root + "\\diaryphoto\\"; */
		String path = "C:\\Users\\busanbank\\git\\MyBusanTripInfo\\BusanTrip\\src\\main\\resources\\static\\img\\diaryphoto\\";
		
		//우리가 쓸려고 만든 변수
		String photoUrl = "/img/diaryphoto/"+mFile.getOriginalFilename();
		
		File copyFile = new File(path + mFile.getOriginalFilename());
		
		try {
			mFile.transferTo(copyFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		System.out.println("path " + path);
		
		storyService.addPhotoToDiaryTransaction(diaryTransactionId, photoUrl);
	}

	@PostMapping("deletePhotoToDiaryTransaction")
	@ResponseBody
	public void deletePhotoToDiaryTransaction(String photoId) {
		storyService.deletePhotoToDiaryTransaction(photoId);

	}
}
