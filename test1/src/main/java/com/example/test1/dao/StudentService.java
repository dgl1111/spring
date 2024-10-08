package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Emp;
import com.example.test1.model.Item;
import com.example.test1.model.Student;


public interface StudentService {
	// 게시글 조회
	List<Student> searchStudentList(HashMap<String, Object> map);
	
	Student searchQwer(); //선언
	
	HashMap<String, Object> searchStu(HashMap<String, Object> map); //Hashmap으로 받겠다로 정의
	
	List<Emp> searchEmp();
	
	HashMap<String, Object> searchSubject();
	

}
