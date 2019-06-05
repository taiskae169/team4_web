package webtoon.list;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class WebToonListVO {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH-mm");
	
	private int num;	//메인 웹툰 번호(웹툰 아이디)
	private String title;	// 웹툰 제목
	private String sub_title; //웹툰 소제목
	private Timestamp reg;	//웹툰 등록 날짜
	private String writer; 	//작가
	private String gen;		//장르
	private int week;		//업데이트 요일
	private int like;		//좋아요 숫자
	private int mag;		//특집여부
	private String tag;		//태그
	private int star;		//총 별점
	private int start_p;	//별점 참여 인원
	private String sum; //웹툰 줄거리
	private int view;	//조회수	
	private String ep_img; //회차별 썸네일

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getMag() {
		return mag;
	}
	public void setMag(int mag) {
		this.mag = mag;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getStart_p() {
		return start_p;
	}
	public void setStart_p(int start_p) {
		this.start_p = start_p;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getEp_img() {
		return ep_img;
	}
	public void setEp_img(String ep_img) {
		this.ep_img = ep_img;
	}
	
	
	

}
