package webtoon.notice;

import java.sql.*;
import java.text.SimpleDateFormat;
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
	
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
	
	public List getNotice(int start, int end) throws Exception{
		conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List noticeList = null;
		try {
			conn = getConnection();
			String sql = "select nt_num, nt_title, nt_reg, nt_content, nt_writer, nt_category, r "
					+ "from (select nt_num, nt_title, nt_reg, nt_content, nt_writer, nt_category, rownum r "
					+ "from (select nt_num, nt_title, nt_reg, nt_content, nt_writer, nt_category "
					+ "from notice order by nt_reg desc) order by nt_reg desc) where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeList = new ArrayList(end);
				do {
				noticeVO vo = new noticeVO();
				vo.setNt_num(rs.getInt("nt_num"));
				vo.setNt_title(rs.getString("nt_title"));
				vo.setNt_reg(rs.getTimestamp("nt_reg"));
				vo.setNt_content(rs.getString("nt_content"));
				vo.setNt_writer(rs.getString("nt_writer"));
				vo.setNt_category(rs.getInt("nt_category"));
				noticeList.add(vo);
			} while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		return noticeList;
	}
	
	
	
	
	public List getNotice1(int end) throws Exception{
		conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List noticeList = null;
		try {
			conn = getConnection();
			String sql = "select nt_num, nt_title, nt_reg, nt_content, nt_writer, nt_category, r "
					+ "from (select nt_num, nt_title, nt_reg, nt_content, nt_writer, nt_category, rownum r "
					+ "from (select nt_num, nt_title, nt_reg, nt_content, nt_writer, nt_category "
					+ "from notice order by nt_reg desc) order by nt_reg desc) where r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeList = new ArrayList(end);
				do {
				noticeVO vo = new noticeVO();
				vo.setNt_num(rs.getInt("nt_num"));
				vo.setNt_title(rs.getString("nt_title"));
				vo.setNt_reg(rs.getTimestamp("nt_reg"));
				vo.setNt_content(rs.getString("nt_content"));
				vo.setNt_writer(rs.getString("nt_writer"));
				vo.setNt_category(rs.getInt("nt_category"));
				noticeList.add(vo);
			} while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		return noticeList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public noticeVO content(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		noticeVO member = null;
		
		int dbpasswd = 0;
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from notice where nt_num = ?");
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new noticeVO();
				dbpasswd = rs.getInt("nt_num");
				member.setNt_content(rs.getString("nt_content"));
				member.setNt_title(rs.getString("nt_title"));
			
			}else
				x = -1;
					
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if( rs != null) try {rs.close();} catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return member;
	}
	
	
	public int count() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	public void insertNotice(noticeVO notice) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"insert into notice values(notice_seq.nextval,?,sysdate,?,?,?)");
			pstmt.setString(1, notice.getNt_title());
			pstmt.setString(2, notice.getNt_content());
			pstmt.setString(3, notice.getNt_writer());
			pstmt.setInt(4, notice.getNt_category());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if (conn != null) try { conn.close();} catch(SQLException ex) {}
		}
	}
	
	
	public void changeCategory(noticeVO notice) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update notice set nt_category =? where nt_num = ?");
			pstmt.setInt(1, notice.getNt_category());
			pstmt.setInt(2, notice.getNt_num());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}	
		}
	}
	
	public void changeTitle(noticeVO notice) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update notice set nt_title =? where nt_num = ?");
			pstmt.setString(1, notice.getNt_title());
			pstmt.setInt(2, notice.getNt_num());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}	
		}
	}
	
	public void changeContent(noticeVO notice) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update notice set nt_content =? where nt_num = ?");
			pstmt.setString(1, notice.getNt_content());
			pstmt.setInt(2, notice.getNt_num());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}	
		}
	}
	
	public void deleteNotice(noticeVO notice) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from notice where nt_num =?");
			pstmt.setInt(1,notice.getNt_num());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}	
		}
	}
	

	
}
