package webtoon.list;

public class MWdetailVO {
	private int mNum; //웹툰 고유번호
	private String wtTitle; //웹툰 제목
	private String wtAuthor; //웹툰 작가명
	private String day; //연재일
	private String wtGenre; //웹툰 장르
	private String wtTag; //웹툰 태그
	private String wtSumm; //웹툰 줄거리
	private int wtStar; //웹툰 평균 별점(에피소드별 별점의 평균값)
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getWtTitle() {
		return wtTitle;
	}
	public void setWtTitle(String wtTitle) {
		this.wtTitle = wtTitle;
	}
	public String getWtAuthor() {
		return wtAuthor;
	}
	public void setWtAuthor(String wtAuthor) {
		this.wtAuthor = wtAuthor;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWtGenre() {
		return wtGenre;
	}
	public void setWtGenre(String wtGenre) {
		this.wtGenre = wtGenre;
	}
	public String getWtTag() {
		return wtTag;
	}
	public void setWtTag(String wtTag) {
		this.wtTag = wtTag;
	}
	public String getWtSumm() {
		return wtSumm;
	}
	public void setWtSumm(String wtSumm) {
		this.wtSumm = wtSumm;
	}
	public int getWtStar() {
		return wtStar;
	}
	public void setWtStar(int wtStar) {
		this.wtStar = wtStar;
	}
}
