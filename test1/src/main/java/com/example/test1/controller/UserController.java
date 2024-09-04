package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.UserService;
import com.example.test1.model.User;

import com.google.gson.Gson;

@Controller //너 주소만드는 역할이야 annotation으로 controller 붙인다.
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userLoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {	
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.login(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/login.do") //"/" 주소에 요청이 들어왔을때 밑에 실행
    public String login(Model model) throws Exception{

        return "/login";	//확장자 생략
    }
	
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{

        return "/join";	//확장자 생략
    }
	
	@RequestMapping("/jusoPopup.do") 
	public String juso(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
	}
	
	@RequestMapping("/addr.do") 
	public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/join-btn";
	}
	
	@RequestMapping(value = "/user-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {	//map안에 keyword 담겨있다.
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUserList(map);
		
		return new Gson().toJson(resultMap);
	}

	@RequestMapping("/user-list.do") 
    public String userList(Model model) throws Exception{

        return "/user-list";	//확장자 생략
    }
	
	@RequestMapping(value = "/boardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.boardList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/boardList.do") 
    public String boardList(Model model) throws Exception{

        return "/board-list";	//확장자 생략
    }
	
	@RequestMapping(value = "/remove-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {	//map안에 keyword 담겨있다.
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.removeUser(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.userInfo(map);
		
		return new Gson().toJson(resultMap);
	}
	
	// 작성자 상세보기

	@RequestMapping("/user-view.do") 
    public String userView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		//PK값을 받을 준비가 되어있어야 한다.   파라미터로 받고 싶으면
		request.setAttribute("userId", map.get("userId"));
        return "/user-view";
        //파라미터로 받은 값을 넘겨줘야 한다. jsp에도 쓸수있게 request 객체 만든다.
    }
	
	
	

}


