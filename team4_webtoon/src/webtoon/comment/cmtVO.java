package webtoon.comment;

import java.sql.Timestamp;


public class cmtVO {
	
	private int num;			//코멘트 번호
	private int like;			//좋아요 숫자
	private int hate;			//싫어요 숫자
	private Timestamp reg;		//생성 날짜
	private String id;			//작성자 ID
	private int state;			//숨김여부 설정, 0은 정상/1은 숨김
	private int mw_num;			//코멘트가 작성된 웹툰 번호
	private int cl_num;			//코멘트가 작성된 웹툰 회차번호(0일시 해당 웹툰 리뷰 페이지)
	private String content;		//코멘트 내용
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getHate() {
		return hate;
	}
	public void setHate(int hate) {
		this.hate = hate;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getMw_num() {
		return mw_num;
	}
	public void setMw_num(int mw_num) {
		this.mw_num = mw_num;
	}
	public int getCl_num() {
		return cl_num;
	}
	public void setCl_num(int cl_num) {
		this.cl_num = cl_num;
	}
	
	
	
	
}
