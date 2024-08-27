package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

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
	
	@RequestMapping("/login.do") //"/" 주소에 요청이 들어왔을때 밑에 실행
    public String login(Model model) throws Exception{

        return "/login";	//확장자 생략
    }
	
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{

        return "/join";	//확장자 생략
    }
	
	


	

	

}


