package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Student;
import com.example.test1.model.User;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	//하나만 만들어서 다 처리 해준다.
	
	@Override
	public List<User> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserList();
	}

	@Override
	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// TODO Auto-generated method stub
		try {
			User u = userMapper.selectUser(map);
			resultMap.put("user", u);
			resultMap.put("result", "sucess");
			String msg = (u != null) ? "조회했습니다" : "학번을 확인하세요";
			resultMap.put("message", msg);
		} catch (Exception e) {
	
			resultMap.put("result", "fail");
			resultMap.put("message", "db조회 오류");
			
	}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> viewUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	
		try {
			User u = userMapper.infoUser(map);
			resultMap.put("user", u);
			resultMap.put("result", "sucess");
			String msg = (u != null) ? "조회했습니다" : "학번을 확인하세요";
			resultMap.put("message", msg);
		} catch (Exception e) {
	
			resultMap.put("result", "fail");
			resultMap.put("message", "db조회 오류");
		
	}
		return resultMap;
	


	}

}
