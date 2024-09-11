package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.test1.constants.ResMessage;
import com.example.test1.mapper.ItemMapper;
import com.example.test1.model.Code;
import com.example.test1.model.Item;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	ItemMapper itemMapper;

	@Override
	public HashMap<String, Object> searchItemList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Item> list = itemMapper.selectItemList(map);
		try {
			
			resultMap.put("list", list);
			resultMap.put("result", "success");
			resultMap.put("message", ResMessage.SUCCESS);
			
		} catch (DataAccessException e) {
			// TODO: handle exception
			resultMap.put("message", ResMessage.DB_ACCESS_ERROR);
			resultMap.put("result", "fail");
			
		}catch (PersistenceException e) {
			// TODO: handle exception
			resultMap.put("message", ResMessage.MYBATIS_ERROR);
			resultMap.put("result", "fail");
			
		}catch (Exception e) {
			// TODO: handle exception
			resultMap.put("message", ResMessage.FAIL);
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchCodeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Code> codeList = itemMapper.selectCodeList(map);
			resultMap.put("codeList", codeList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
