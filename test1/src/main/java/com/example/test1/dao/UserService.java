package com.example.test1.dao;

import java.util.HashMap;


public interface UserService {
	HashMap<String, Object> searchUser(HashMap<String, Object> map); //Hashmap으로 받겠다로 정의
	
	HashMap<String, Object> viewUser(HashMap<String, Object> map); 
	
	// 사용자 목록
	HashMap<String, Object> searchUserList(HashMap<String, Object> map);
	
	//게시글 목록
	HashMap<String, Object> boardList(HashMap<String, Object> map);
	
	//사용자 삭제
	HashMap<String, Object> removeUser(HashMap<String, Object> map);
	
	HashMap<String, Object> userInfo(HashMap<String, Object> map);
	
	//사용자 로그인
	HashMap<String, Object> login(HashMap<String, Object> map);

}