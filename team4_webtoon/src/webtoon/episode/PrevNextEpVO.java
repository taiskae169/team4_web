package webtoon.episode;

public class PrevNextEpVO {
	private int ClN; //cl_num (웹툰 에피소드 고유번호)
	private String ClT; //cl_title (웹툰 에피소드 제목)
	private int clTid; //cl_title_id (웹툰 고유번호)
	private int prevClN; //prev_cl_num (이전 웹툰 에피소드 고유번호 )
	private String  prevClT; //prev_cl_title (이전 웹툰 에피소드 제목)
	private int nextClN; //next_cl_num (이후 웹툰 에피소드 고유번호)
	private String nextClT; //next_cl_title (이후 웹툰 에피소드 제목)

	public int getClN() {
		return ClN;
	}
	public void setClN(int clN) {
		ClN = clN;
	}
	public String getClT() {
		return ClT;
	}
	public void setClT(String clT) {
		ClT = clT;
	}
	public int getClTid() {
		return clTid;
	}
	public void setClTid(int clTid) {
		this.clTid = clTid;
	}
	public int getPrevClN() {
		return prevClN;
	}
	public void setPrevClN(int prevClN) {
		this.prevClN = prevClN;
	}
	public String getPrevClT() {
		return prevClT;
	}
	public void setPrevClT(String prevClT) {
		this.prevClT = prevClT;
	}
	public int getNextClN() {
		return nextClN;
	}
	public void setNextClN(int nextClN) {
		this.nextClN = nextClN;
	}
	public String getNextClT() {
		return nextClT;
	}
	public void setNextClT(String nextClT) {
		this.nextClT = nextClT;
	}
}
