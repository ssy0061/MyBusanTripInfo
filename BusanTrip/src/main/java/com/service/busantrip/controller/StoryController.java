package com.service.busantrip.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.busantrip.domain.story.Diary;
import com.service.busantrip.domain.story.Story;
import com.service.busantrip.model.StoryService;

@Controller
@RequestMapping("story")
public class StoryController {
	@Autowired
	StoryService storyService;
	
	@PostMapping("findAllStory")
	@ResponseBody
	public List<Story> findAllStoryList(String memberId, Model model, HttpSession session) {
		//String memberId = (String) session.getAttribute("memberId");
		List<Story> list = storyService.findAllStoryList(memberId);
		
		System.out.println("memberId:: " + memberId);
		
		return list;
	}
	
	@PostMapping("findAllDiaryList")
	@ResponseBody
	public List<Diary> findAllDiaryList(String storyId, Model model, HttpSession session) {
		//String memberId = (String) session.getAttribute("memberId");
		List<Diary> list = storyService.findAllDiaryList(storyId);
		
		System.out.println("storyId:: " + storyId);
		
		return list;
	}
}
