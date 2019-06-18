package webtoon.helpdesk;

import java.sql.SQLException;
import java.util.ArrayList;

import ForExtends.addContext;

public class ToadminDAO extends addContext {
	
	private ToadminDAO() {}
	
	private static ToadminDAO instance = new ToadminDAO();
	
	public static ToadminDAO getInstance() {
		return instance;
	}
	
	public void setdetail(String title, String content, int cat, String company, String name, String tel, String mail, String file) {
		try {
			conn = getConnection();
			String sql = "insert into proposal(pr_num, pr_title,pr_content,pr_cat,pr_cname,pr_name,pr_ctel,pr_mail,pr_file, pr_reg)"
					+ " values(proposal_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, cat);
			pstmt.setString(4, company);
			pstmt.setString(5, name);
			pstmt.setString(6, tel);
			pstmt.setString(7, mail);
			pstmt.setString(8, file);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}
	
	public void setdetail(String title, String content, int cat, String name, String tel, String mail, String file) {
		try {
			conn = getConnection();
			String sql = "insert into proposal(pr_num, pr_title,pr_content,pr_cat,pr_name,pr_ctel,pr_mail,pr_file,pr_reg)"
					+ " values(proposal_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, cat);
			pstmt.setString(4, name);
			pstmt.setString(5, tel);
			pstmt.setString(6, mail);
			pstmt.setString(7, file);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}
	
	public ArrayList<helpVO> getDetail(){
		ArrayList<helpVO> list = new ArrayList<helpVO>();
		try {
			conn = getConnection();
			String sql = "select * from proposal order by pr_num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				helpVO vo = new helpVO();
				vo.setNum(rs.getInt("pr_num"));
				vo.setTitle(rs.getString("pr_title"));
				vo.setContent(rs.getString("pr_content"));
				vo.setCat(rs.getInt("pr_cat"));
				vo.setCname(rs.getString("pr_cname"));
				vo.setName(rs.getString("pr_name"));
				vo.setTel(rs.getString("pr_ctel"));
				vo.setMail(rs.getString("pr_mail"));
				vo.setFile(rs.getString("pr_file"));
				vo.setReg(rs.getTimestamp("pr_reg"));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return list;
	}
	
	
}
