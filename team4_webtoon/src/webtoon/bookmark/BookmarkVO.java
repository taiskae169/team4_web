package webtoon.bookmark;

import java.sql.Timestamp;

public class BookmarkVO {
    private int bmNum; //북마크 번호
    private String bmID; //북마크한 유저 아이디
    private int bmWNum; //북마크한 웹툰 번호
    private String bmWTitle; //북마크한 웹툰 제목
    private int bmCNum; //북마크한 웹툰 회차 번호
    private String bmCTitle; //북마크한 웹툰 회차 제목
    private String bmWriter; //북마크한 웹툰 회차 제목
    private Timestamp bmReg; //북마크한 날짜
    private String bmImg; //북마크된 에피소드 대표 이미지
	
    public int getBmNum() {
		return bmNum;
	}
	public void setBmNum(int bmNum) {
		this.bmNum = bmNum;
	}
	public String getBmID() {
		return bmID;
	}
	public void setBmID(String bmID) {
		this.bmID = bmID;
	}
	public int getBmWNum() {
		return bmWNum;
	}
	public void setBmWNum(int bmWNum) {
		this.bmWNum = bmWNum;
	}
	public String getBmWTitle() {
		return bmWTitle;
	}
	public void setBmWTitle(String bmWTitle) {
		this.bmWTitle = bmWTitle;
	}
	public int getBmCNum() {
		return bmCNum;
	}
	public void setBmCNum(int bmCNum) {
		this.bmCNum = bmCNum;
	}
	public String getBmCTitle() {
		return bmCTitle;
	}
	public void setBmCTitle(String bmCTitle) {
		this.bmCTitle = bmCTitle;
	}
	public String getBmWriter() {
		return bmWriter;
	}
	public void setBmWriter(String bmWriter) {
		this.bmWriter = bmWriter;
	}
	public Timestamp getBmReg() {
		return bmReg;
	}
	public void setBmReg(Timestamp bmReg) {
		this.bmReg = bmReg;
	}
	public String getBmImg() {
		return bmImg;
	}
	public void setBmImg(String bmImg) {
		this.bmImg = bmImg;
	}    
	
}
