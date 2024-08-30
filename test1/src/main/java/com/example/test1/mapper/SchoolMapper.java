package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.School;

@Mapper
public interface SchoolMapper {

	List<School> selectSchool(HashMap<String, Object> map);
	
	School selectSchoolStu(HashMap<String, Object> map);
	
	void removeSchoolList(HashMap<String, Object> map);
	
	School schoolStuInfo(HashMap<String, Object> map);
	
}
