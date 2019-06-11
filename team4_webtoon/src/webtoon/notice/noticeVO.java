package webtoon.notice;

import java.sql.Timestamp;

public class noticeVO {
	private int nt_num;
	private String nt_title;
	private Timestamp nt_reg;
	private String nt_content;
	private String nt_writer;
	private int nt_category;
	public int getNt_num() {
		return nt_num;
	}
	public void setNt_num(int nt_num) {
		this.nt_num = nt_num;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public Timestamp getNt_reg() {
		return nt_reg;
	}
	public void setNt_reg(Timestamp nt_reg) {
		this.nt_reg = nt_reg;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public String getNt_writer() {
		return nt_writer;
	}
	public void setNt_writer(String nt_writer) {
		this.nt_writer = nt_writer;
	}
	public int getNt_category() {
		return nt_category;
	}
	public void setNt_category(int nt_category) {
		this.nt_category = nt_category;
	}
	
	
	
	
	
}
