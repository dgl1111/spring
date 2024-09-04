package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.User;



@Mapper
public interface UserMapper {
	
	//List<User> selectUserList();
	
	User selectUser(HashMap<String, Object> map);  
	
	User infoUser(HashMap<String, Object> map);  

	List<User> selectUserList(HashMap<String, Object> map); //리턴타입은 user가 list에 담긴 형태
	
	List<Board> boardList(HashMap<String, Object> map);
	
	HashMap<String, Object> removeUserList(HashMap<String, Object> map);
	
	User userInfoList(HashMap<String, Object> map);
	
	User userLogin(HashMap<String, Object> map);
	
	void insertAddr(HashMap<String, Object> map);
	
	User userIdCheck(HashMap<String, Object> map);
	
	
	//검색결과가 여러개를 리턴받을떄는 List<>에 담아서 리턴
	
	//데이터를 호출하는 service
	
}
