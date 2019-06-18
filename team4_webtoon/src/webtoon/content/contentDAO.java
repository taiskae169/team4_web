package webtoon.content;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class contentDAO {
	private contentDAO() {}
	
	static private contentDAO instance = new contentDAO();
	
	public static contentDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	private Connection getConnection() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//자동 회차 리턴
	public int getAuto(int cl_title_id) {
		conn = getConnection();
		int result = 0;
		try {
			String sql = "select count(*) from content where cl_title_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cl_title_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1) + 1;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}			
		}
		return result;
	}
	
	//회차 등록 메서드
	public void insertwb(contentVO content) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into content values(cl_num_seq.nextval,?,?,?,sysdate,?,?,?,?,?,?,?)");
			pstmt.setString(1, content.getCl_title());
			pstmt.setInt(2, content.getCl_title_id());
			pstmt.setString(3, content.getCl_content());
			pstmt.setInt(4, content.getCl_like());
			pstmt.setString(5, content.getCl_writer());
			pstmt.setInt(6, content.getMw_view());
			pstmt.setInt(7, content.getMw_star());
			pstmt.setInt(8, content.getMw_star_p());
			pstmt.setString(9, content.getWt_ep_img());
			pstmt.setInt(10, content.getMw_star_sum());
			
			pstmt.executeUpdate();
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
	}
	
	public void deleteContent(int mw_num) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;		
		try {
			conn = getConnection();
			String sql = "delete from content where cl_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mw_num);
			pstmt.executeUpdate();
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
	}
	
	public contentVO adjust(int cl_num) throws Exception{
		contentVO member = null;
		int dbpasswd = 0;
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select  * from content where cl_num = ?");
			pstmt.setInt(1, cl_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new contentVO();
				member.setCl_title(rs.getString("cl_title"));
				member.setCl_content(rs.getString("cl_content"));
				
			}
			

		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if( rs != null) try {rs.close();} catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return member;
	}
	
	
	
}
