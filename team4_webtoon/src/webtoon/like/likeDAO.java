package webtoon.like;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class likeDAO {
	
	static private likeDAO instance =  new likeDAO();
	
	public static likeDAO getInstance() {
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
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}//connection 풀을 제공하는 메소드
	
	public void insertlikeWebtoon(likeVO like_wb) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into like_wb values(like_wb_seq.nextval,?,?)");
			pstmt.setInt(1,  like_wb.getLwb_wb_num());
			pstmt.setString(2, like_wb.getLwb_id());
			
			pstmt.executeUpdate();
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	
	
	
	public ArrayList<likeVO> getAddrs(int num, String id) throws SQLException{
		ArrayList<likeVO> list = new ArrayList<likeVO>();
		Connection conn = null;
		conn = getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select * from like_wb where lwb_wb_num= ? and lwb_id = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, num);
		pstmt.setString(2,  id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			likeVO vo = new likeVO();
			vo.setLwb_num(rs.getInt("lwb_num"));
			vo.setLwb_wb_num(rs.getInt("lwb_wb_num"));
			vo.setLwb_id(rs.getString("lwb_id"));
			list.add(vo);
		}
		return list;
		
		
	}
	
	
	public ArrayList<likeVO> getNum(String id) throws SQLException{
		ArrayList<likeVO> list = new ArrayList<likeVO>();
		Connection conn = null;
		conn = getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select * from like_wb where lwb_id = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1,  id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			likeVO vo = new likeVO();
			vo.setLwb_num(rs.getInt("lwb_num"));
			vo.setLwb_wb_num(rs.getInt("lwb_wb_num"));
			vo.setLwb_id(rs.getString("lwb_id"));
			list.add(vo);
		}
		return list;
		
		
	}
	
	
	
	
	
	public likeVO like(int num, String id) throws Exception{
		likeVO member = null;

		try {
			Connection conn = null;
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from like_wb where lwb_wb_num = ? and lwb_id = ?");
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new likeVO();
				member.setLwb_id(rs.getString("lwb_id"));
				member.setLwb_num(rs.getInt("lwb_num"));
				member.setLwb_wb_num(rs.getInt("lwb_wb_num"));
			}
			

		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if( rs != null) try {rs.close();} catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return member;
	}
	
	public void deleteLike(int num, String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from like_wb where lwb_wb_num = ? and lwb_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
	}

	
	
}
