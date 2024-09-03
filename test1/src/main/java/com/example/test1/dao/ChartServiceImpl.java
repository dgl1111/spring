package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ChartMapper;
import com.example.test1.model.Chart;

import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService{
	
	@Autowired
	ChartMapper chartMapper;

	@Override
	public HashMap<String, Object> chartList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Chart> list = chartMapper.selectChartList(map);
		
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}
	
}