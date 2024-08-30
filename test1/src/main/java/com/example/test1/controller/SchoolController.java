package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.SchoolService;
import com.google.gson.Gson;

@Controller
public class SchoolController {
	
	@Autowired
	SchoolService schoolService;
	
	// 게시글 목록 페이지
	@RequestMapping("/school-stu.do") 
    public String schoolList(Model model) throws Exception{

        return "/school-stu";
    }
	

	@RequestMapping(value = "/school-stu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String schoolList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = schoolService.searchSchoolList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/school-stuView.do") 
    public String schoolView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));

        return "/school-stuView";
    }
	

	@RequestMapping(value = "/school-stuView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String schoolView2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = schoolService.searchSchoolView(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/school-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = schoolService.deleteSchoolList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/stu-schoolView.do") 
    public String schoolStuView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));

        return "/stu-schoolView";
    }
	

	@RequestMapping(value = "/stu-schoolView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String schoolStuView2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = schoolService.searchSchoolStu(map);
		
		return new Gson().toJson(resultMap);
	}
	

}
