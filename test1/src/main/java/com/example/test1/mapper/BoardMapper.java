package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	// 게시글 삭제
	void deleteBoard(HashMap<String, Object> map);
	
	// 게시글 등록
	void insertBoard(HashMap<String, Object> map);
	
	//PK로 검색하면 1개. List로 감쌀 이유가 없다.
	Board selectBoardInfo(HashMap<String, Object> map);
	
	int selectBoardListCnt(HashMap<String, Object> map);
	
	List<Board> selectCommentList(HashMap<String, Object> map);
	
	
	
	
	
	
}