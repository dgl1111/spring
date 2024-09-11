package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Area2;


@Mapper
public interface AreaMapper2 {
	List<Area2> siList(HashMap<String, Object> map);
	List<Area2> guList(HashMap<String, Object> map);
	List<Area2> dongList(HashMap<String, Object> map);
	List<Area2> nList(HashMap<String, Object> map);

}
