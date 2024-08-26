package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;


@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentMapper studentMapper;
	//하나만 만들어서 다 처리 해준다.
	
	@Override
	public List<Student> searchStudentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentList();
	}

	@Override
	public Student searchQwer() {
		// TODO Auto-generated method stub
		Student s = studentMapper.qwer();	//선언 구현 studentMapper에 있는.qwer() 요청
		return s;
	}
	
	@Override
	public HashMap<String, Object> searchStu(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// TODO Auto-generated method stub
		try {
			Student s = studentMapper.selectStu(map);
			resultMap.put("stu", s);
			resultMap.put("result", "sucess");
			String msg = (s != null) ? "조회했습니다" : "학번을 확인하세요";
			resultMap.put("message", msg);
		} catch (Exception e) {
	
			resultMap.put("result", "fail");
			resultMap.put("message", "db조회 오류");
			
	}
		return resultMap;
	}

	@Override
	public List<Emp> searchEmp() {
	
		return studentMapper.selectEmp();
	}

	@Override
	public HashMap<String, Object> searchSubject() {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> subject = studentMapper.selectSubject();
		List<Student> student = studentMapper.selectStudentList();
		
		resultMap.put("subList", subject);
		resultMap.put("stuList", student);
		
		return resultMap;
		
	}
	

	

}
