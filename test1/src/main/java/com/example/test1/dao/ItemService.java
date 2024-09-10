package com.example.test1.dao;

import java.util.HashMap;

public interface ItemService {
	HashMap<String, Object> searchItemList(HashMap<String, Object> map);
	HashMap<String, Object> searchCodeList(HashMap<String, Object> map);
}
