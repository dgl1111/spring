package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AreaMapper2;
import com.example.test1.model.Area2;
import com.example.test1.model.Board;





@Service
public class Area2ServiceImpl implements Area2Service {
	
	@Autowired
	AreaMapper2 areaMapper2;


	@Override
	public HashMap<String, Object> searchAreaList2(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area2> list = null;	
		
		if(map.get("loca").equals("si")) {
			list = areaMapper2.siList(map);
		}else if(map.get("loca").equals("gu")) {
			list = areaMapper2.guList(map);
		}else {
			list = areaMapper2.dongList(map);
		}
		
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}


	@Override
	public HashMap<String, Object> searchWeather(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area2> list = areaMapper2.nList(map);
		
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	

}

