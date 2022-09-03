package com.service.busantrip.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.busantrip.domain.Member;
import com.service.busantrip.domain.story.Diary;
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
	
	String memberListAll="";
	
	@PostMapping("deleteStory")
	@ResponseBody
	public void deleteStory(int storyId, Model model, HttpSession session) {
		System.out.println("deleteStory:: " + storyId);
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
		memberListAll += memberId+" ";
		
		return storyId;
	}
	
	@PostMapping("addStoryMember")
	@ResponseBody
	public int addStoryMember(String storyId, @RequestParam(value="memberList[]") List<String> memberList, Model model, HttpSession session) {
		int count = 0;
		
		for(String memberId: memberList) {
			storyService.addStoryMember(storyId, memberId);
			memberListAll += memberId + " ";
			count+=1;
		}
		
		System.out.println("str_memberList:: " + memberListAll);
		storyService.updateStory(memberListAll, Integer.parseInt(storyId));
	
		return count;
	}
	
	@PostMapping("getStoryName")
	@ResponseBody
	public String getStoryName(String storyId) {
		return storyService.getStoryName(storyId);
	}
	
	
	
	@PostMapping("findStoryMember")
	@ResponseBody
	public List<Member> findStoryMember(String storyId, Model model, HttpSession session){
		//System.out.println("storyId:: " + storyId);
		System.out.println("hhstoryId:: " + storyId);
		List<Member> list = storyService.findStoryMember(storyId);
		
		System.out.println(list);
		
		return list;
	}
	
	@PostMapping("addDiary")
	@ResponseBody
	public void addDiary(String storyId, String diaryName, Model model, HttpSession session) {
		//System.out.println("storyId:: " + storyId + " diaryName:: " + diaryName);
		
		storyService.addDiary(storyId, diaryName);
	}

	@PostMapping("findAllStory")
	@ResponseBody
	public List<Story> findAllStoryList(String memberId, Model model, HttpSession session) {
		//String memberId = (String) session.getAttribute("memberId");
		List<Story> list = storyService.findAllStoryList(memberId);
		//System.out.println("memberId:: " + memberId);
		
		return list;
	}
	
	@PostMapping("findAllDiaryList")
	@ResponseBody
	public List<Diary> findAllDiaryList(String storyId, Model model, HttpSession session) {
		//String memberId = (String) session.getAttribute("memberId");
		List<Diary> list = storyService.findAllDiaryList(storyId);
		//System.out.println("storyId:: " + storyId);
		
		return list;
	}
}
