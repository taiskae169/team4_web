package webtoon.comment;

public class CmtCheckVO {
	private String id;		//좋아요 작성한 ID
	private int like_ch;	//좋아요 여부 0일시 미참여, 1일시 좋아요, 2일시 싫어요
	private int star_ch;	//별점 참여 여부
	private int mw_num;		//참여한 웹툰 번호
	private int cl_num;		//참여한 
	private int cmt_num; 	//참여한 코멘트 번호
	
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLike_ch() {
		return like_ch;
	}
	public void setLike_ch(int like_ch) {
		this.like_ch = like_ch;
	}
	public int getStar_ch() {
		return star_ch;
	}
	public void setStar_ch(int star_ch) {
		this.star_ch = star_ch;
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
