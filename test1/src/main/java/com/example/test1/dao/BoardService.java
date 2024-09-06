package com.example.test1.dao;

import java.util.HashMap;

public interface BoardService {
	// 게시글 목록
	HashMap<String,Object> searchBoardList(HashMap<String,Object> map);
	// 게시글 삭제
	HashMap<String,Object> removeBoard(HashMap<String,Object> map);
	// 게시글 등록
	HashMap<String,Object> addBoard(HashMap<String,Object> map);
	//게시글 상세보기
	HashMap<String,Object> searchBoardInfo(HashMap<String,Object> map); //pk값 보내주려면 파라미터 필요.
	//파일 업로드
	HashMap<String,Object> addBoardFile(HashMap<String,Object> map);
	
	HashMap<String,Object> removeCheck(HashMap<String,Object> map);
	
	
}