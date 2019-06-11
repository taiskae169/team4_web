package webtoon.notice;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class noticeDAO {

	private noticeDAO() {}
	
	static private noticeDAO instance = new noticeDAO();
	
	public static noticeDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	Statement st;
	
	private Connection getConnection() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public ArrayList<noticeVO> getNotice(){
		conn = getConnection();
		ArrayList<noticeVO> list = new ArrayList<noticeVO>();
		try {
			String sql = "select * from notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				noticeVO vo = new noticeVO();
				vo.setNt_num(rs.getInt("nt_num"));
				vo.setNt_title(rs.getString("nt_title"));
				vo.setNt_reg(rs.getTimestamp("nt_reg"));
				vo.setNt_content(rs.getString("nt_content"));
				vo.setNt_writer(rs.getString("nt_writer"));
				vo.setNt_category(rs.getInt("nt_category"));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		return list;
	}
}
