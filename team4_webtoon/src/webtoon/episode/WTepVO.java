package webtoon.episode;

import java.sql.Timestamp;

public class WTepVO {
	private int clNO;  //회차번호
	private String clTitle; //소제목(에피소드 제목)
	private String mwTitle ;//웹툰 제목
	private int mw_title_id; //웹툰 고유번호
	private String clContent; //웹툰 내용(파일이름, 경로)
	private Timestamp clReg; //등록일자
	private int clLike; //좋아요 수
	private String clWriter; //작가
	private int ep_view; //조회수
	private int ep_star; //평점
	private int ep_sp; //평점 참여자
	private int ep_ssum; //평점 참여자 별 별점 합계
	
	public int getClNO() {
		return clNO;
	}
	public void setClNO(int clNO) {
		this.clNO = clNO;
	}
	public String getClTitle() {
		return clTitle;
	}
	public void setClTitle(String clTitle) {
		this.clTitle = clTitle;
	}
	public String getMwTitle() {
		return mwTitle;
	}
	public void setMwTitle(String mwTitle) {
		this.mwTitle = mwTitle;
	}
	public int getMw_title_id() {
		return mw_title_id;
	}
	public void setMw_title_id(int mw_title_id) {
		this.mw_title_id = mw_title_id;
	}
	public String getClContent() {
		return clContent;
	}
	public void setClContent(String clContent) {
		this.clContent = clContent;
	}
	public Timestamp getClReg() {
		return clReg;
	}
	public void setClReg(Timestamp clReg) {
		this.clReg = clReg;
	}
	public int getClLike() {
		return clLike;
	}
	public void setClLike(int clLike) {
		this.clLike = clLike;
	}
	public String getClWriter() {
		return clWriter;
	}
	public void setClWriter(String clWriter) {
		this.clWriter = clWriter;
	}
	public int getEp_view() {
		return ep_view;
	}
	public void setEp_view(int ep_view) {
		this.ep_view = ep_view;
	}
	public int getEp_star() {
		return ep_star;
	}
	public void setEp_star(int ep_star) {
		this.ep_star = ep_star;
	}
	public int getEp_sp() {
		return ep_sp;
	}
	public void setEp_sp(int ep_sp) {
		this.ep_sp = ep_sp;
	}
	public int getEp_ssum() {
		return ep_ssum;
	}
	public void setEp_ssum(int ep_ssum) {
		this.ep_ssum = ep_ssum;
	}

}
