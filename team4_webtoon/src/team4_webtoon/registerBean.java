package team4_webtoon;

import java.sql.Timestamp;

public class registerBean {
	private int user_no;
	private String id;			//���̵�
	private String password;	//��й�ȣ
	private String email;		//�̸���
	private String age;			//����
	private String name;		//�̸�	
	private Timestamp user_reg;		//��������
	private int state;
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getUser_reg() {
		return user_reg;
	}
	public void setUser_reg(Timestamp user_reg) {
		this.user_reg = user_reg;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	

	

}