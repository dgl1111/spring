package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.School;

@Service
public class SchoolServiceImpl implements SchoolService{
	
	@Autowired
	SchoolMapper schoolMapper;
	
	
	@Override
	public HashMap<String, Object> searchSchoolList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		List<School> list = schoolMapper.selectSchool(map);
		int count = schoolMapper.selectSchoolCnt(map);
		
		
		resultMap.put("count", count);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}


	@Override
	public HashMap<String, Object> searchSchoolView(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		School stu = schoolMapper.selectSchoolStu(map);
		resultMap.put("stu", stu);
		resultMap.put("result", "success");
		
		return resultMap;
		
	}


	@Override
	public HashMap<String, Object> deleteSchoolList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			schoolMapper.removeSchoolList(map);
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		
		return resultMap;

}


	@Override
	public HashMap<String, Object> searchSchoolStu(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		School info = schoolMapper.schoolStuInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		
		return resultMap;
		
	}


	
}
