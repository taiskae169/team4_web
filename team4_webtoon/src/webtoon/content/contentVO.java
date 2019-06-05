package webtoon.content;

import java.sql.Timestamp;

public class contentVO {
	private int cl_num;  //회차번호
	private String cl_title; //소제목(에피소드 제목)
	private int cl_title_id; //웹툰 고유번호
	private String cl_content; //웹툰 내용(파일이름, 경로)
	private Timestamp cl_reg; //등록일자
	private int cl_like; //좋아요 수
	private String cl_writer; //작가
	private int mw_view; //조회수
	private int mw_star; //평점
	private int mw_star_p; //평점 참여자
	private String wt_ep_img; //회차별 대표 썸네일
	
	public int getCl_num() {
		return cl_num;
	}
	public void setCl_num(int cl_num) {
		this.cl_num = cl_num;
	}
	public String getCl_title() {
		return cl_title;
	}
	public void setCl_title(String cl_title) {
		this.cl_title = cl_title;
	}
	public int getCl_title_id() {
		return cl_title_id;
	}
	public void setCl_title_id(int cl_title_id) {
		this.cl_title_id = cl_title_id;
	}
	public String getCl_content() {
		return cl_content;
	}
	public void setCl_content(String cl_content) {
		this.cl_content = cl_content;
	}
	public Timestamp getCl_reg() {
		return cl_reg;
	}
	public void setCl_reg(Timestamp cl_reg) {
		this.cl_reg = cl_reg;
	}
	public int getCl_like() {
		return cl_like;
	}
	public void setCl_like(int cl_like) {
		this.cl_like = cl_like;
	}
	public String getCl_writer() {
		return cl_writer;
	}
	public void setCl_writer(String cl_writer) {
		this.cl_writer = cl_writer;
	}
	public int getMw_view() {
		return mw_view;
	}
	public void setMw_view(int mw_view) {
		this.mw_view = mw_view;
	}
	public int getMw_star() {
		return mw_star;
	}
	public void setMw_star(int mw_star) {
		this.mw_star = mw_star;
	}
	public int getMw_star_p() {
		return mw_star_p;
	}
	public void setMw_star_p(int mw_star_p) {
		this.mw_star_p = mw_star_p;
	}
	public String getWt_ep_img() {
		return wt_ep_img;
	}
	public void setWt_ep_img(String wt_ep_img) {
		this.wt_ep_img = wt_ep_img;
	}

}
