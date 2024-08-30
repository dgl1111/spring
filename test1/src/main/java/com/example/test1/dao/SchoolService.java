package com.example.test1.dao;

import java.util.HashMap;

public interface SchoolService {
	
	HashMap<String,Object> searchSchoolList(HashMap<String,Object> map);
	
	HashMap<String,Object> searchSchoolView(HashMap<String,Object> map);
	
	HashMap<String,Object> deleteSchoolList(HashMap<String,Object> map);
	
	HashMap<String,Object> searchSchoolStu(HashMap<String,Object> map);
	
	
}
