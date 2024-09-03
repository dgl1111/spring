package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AreaMapper;
import com.example.test1.model.Area;



@Service
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	AreaMapper areaMapper;

	@Override
	public HashMap<String, Object> searchAreaList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area> list = null;	
		
		if(!map.get("si").equals("") && !map.get("gu").equals("")) {
			list = areaMapper.dongList(map);
		}else if(!map.get("si").equals("")){
			list = areaMapper.guList(map);
		}else {
			list = areaMapper.siList(map);
		};
		
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	

}
