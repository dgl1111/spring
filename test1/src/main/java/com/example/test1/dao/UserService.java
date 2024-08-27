package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.User;


public interface UserService {
	// 게시글 조회
	List<User> searchUserList(HashMap<String, Object> map);
	

	HashMap<String, Object> searchUser(HashMap<String, Object> map); //Hashmap으로 받겠다로 정의
	
	HashMap<String, Object> viewUser(HashMap<String, Object> map); 


}