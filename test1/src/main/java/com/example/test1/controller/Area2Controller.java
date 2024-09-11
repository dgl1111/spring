package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.Area2Service;
import com.google.gson.Gson;


@Controller
public class Area2Controller {
	
	@Autowired
	Area2Service area2Service;
	
	@RequestMapping("/area2.do") 
    public String area2List(Model model) throws Exception{

        return "/area2";
    }
	

	@RequestMapping("/areaW.do") 
    public String area2W(Model model) throws Exception{

        return "/area2";
    }
	
	@RequestMapping(value = "/area2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String area2List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = area2Service.searchAreaList2(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/areaW.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String area2W(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = area2Service.searchWeather(map);
		
		return new Gson().toJson(resultMap);
	}
	

}
