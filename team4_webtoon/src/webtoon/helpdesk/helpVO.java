package webtoon.helpdesk;

public class helpVO {
	private int num;			//제안 테이블 고유번호
	private String title;		//문의 제목
	private String content;		//문의 내용
	private int cat;			//문의 카테고리
	private String cname;		//문의 회사 이름
	private String name;		//문의자 이름
	private String tel;			//문의자 연락처
	private String mail;		//문의자 메일
	private String file;		//첨부파일 이름
	
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCat() {
		return cat;
	}
	public void setCat(int cat) {
		this.cat = cat;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
	
}
