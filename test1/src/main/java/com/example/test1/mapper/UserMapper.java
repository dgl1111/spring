package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Student;
import com.example.test1.model.User;



@Mapper
public interface UserMapper {
	List<User> selectUserList();
	
	User selectUser(HashMap<String, Object> map);  
	
	User infoUser(HashMap<String, Object> map);  

	
	//여러개를 리턴받을떄는 List<>에 담아서 리턴
	
	//데이터를 호출하는 service
	
}
