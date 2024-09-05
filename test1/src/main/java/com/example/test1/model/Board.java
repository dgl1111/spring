package com.example.test1.model;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String title;
	private String contents;
	private String userId;
	private String userName;
	private int hit;
	private String category;
	private String favorite;
	private String tag1;
	private String tag2;
	private String noticeYn;
	private String cdateTime;
	private String udateTime;
	private String email;
	
	private String commentNo;
	private String pCommentNo;
	
	private int fileNo;
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileorgName() {
		return fileorgName;
	}
	public void setFileorgName(String fileorgName) {
		this.fileorgName = fileorgName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public String getThumbNailYN() {
		return thumbNailYN;
	}
	public void setThumbNailYN(String thumbNailYN) {
		this.thumbNailYN = thumbNailYN;
	}
	private String fileName;
	private String fileorgName;
	private String filePath;
	private int fileSize;
	private String fileExt;
	private String thumbNailYN;
	
}
