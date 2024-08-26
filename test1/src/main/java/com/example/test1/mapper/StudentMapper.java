package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;


@Mapper
public interface StudentMapper {
	List<Student> selectStudentList();
	
	Student qwer(); // mybatis에 있는 id="qwer"이랑 qwer()을 연결  
	
	Student selectStu(HashMap<String, Object> map);  
	
	List<Emp> selectEmp();
	
	List<Student> selectSubject();
	
	//여러개를 리턴받을떄는 List<>에 담아서 리턴
	
	//데이터를 호출하는 service
	
}
