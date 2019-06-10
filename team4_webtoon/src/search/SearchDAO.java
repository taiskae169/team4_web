package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class SearchDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static SearchDAO instance = new SearchDAO();
	
	public static SearchDAO getInstance() {return instance;}
	
	
	public ArrayList<SearchVO> getAddrs(String search, String select) throws SQLException{
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		conn = ConnectionUtil.getConnection();
		if(select.equals("0")) {	//select 가 0 일 때 = 제목일 때
		StringBuffer sql = new StringBuffer();
		sql.append("select mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_title like '%' || :search || '%' ");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1,search);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			SearchVO vo = new SearchVO();
			vo.setTitle(rs.getString("mw_title"));
			vo.setWriter(rs.getString("mw_writer"));
			vo.setGen(rs.getString("mw_gen"));
			vo.setTag(rs.getString("mw_tag"));
			list.add(vo);
			
			}
		}
		
		else if(select.equals("1")) {	//select가 1 일 때 = 작가일 때
		StringBuffer sql = new StringBuffer();
		sql.append("select mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_writer like '%' || :search || '%' ");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1,search);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			SearchVO vo = new SearchVO();
			vo.setTitle(rs.getString("mw_title"));
			vo.setWriter(rs.getString("mw_writer"));
			vo.setGen(rs.getString("mw_gen"));
			vo.setTag(rs.getString("mw_tag"));
			list.add(vo);
			
			}
		}
		else {		//select 가 나머지일 때(2) = 태그, 더 추가 하고 싶으면 equals("2")로 두고 추가한다. 
			StringBuffer sql = new StringBuffer();
			sql.append("select mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_tag like '%' || :search || '%' ");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,search);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchVO vo = new SearchVO();
				vo.setTitle(rs.getString("mw_title"));
				vo.setWriter(rs.getString("mw_writer"));
				vo.setGen(rs.getString("mw_gen"));
				vo.setTag(rs.getString("mw_tag"));
				list.add(vo);
			}
		}
		if(rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		
		return list;
	}
	
	public ArrayList<SearchVO> getAdd(String mywebtoon) throws SQLException{
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		conn = ConnectionUtil.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_writer = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, mywebtoon);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			SearchVO vo = new SearchVO();
			vo.setTitle(rs.getString("mw_title"));
			vo.setWriter(rs.getString("mw_writer"));
			vo.setGen(rs.getString("mw_gen"));
			vo.setTag(rs.getString("mw_tag"));
			list.add(vo);
		}
		return list;
	}
	
	public int deleteWB(String title, String writer) throws Exception{

		String dbpasswd = "";
		int x = -1;
		try {
			conn = ConnectionUtil.getConnection();
			
			pstmt = conn.prepareStatement("select mw_writer from main_webtoon where mw_title = ?");
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("mw_writer");
				if(dbpasswd.equals(writer)) {
					pstmt = conn.prepareStatement("delete from main_webtoon where mw_title=?");
					pstmt.setString(1, title);
					pstmt.executeUpdate();
					x = 1;
				}else
					x = 0;
			}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) try {rs.close();} catch(SQLException ex) {}
				if (pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if (conn != null) try {conn.close();} catch(SQLException ex) {}
			}
			return x;
		
	}
	


	}
