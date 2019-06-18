package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import oracle.net.aso.r;
import team4_webtoon.registerBean;
import webtoon.like.likeDAO;

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
		else if(select.equals("2")){		//select 가 나머지일 때(2) = 태그, 더 추가 하고 싶으면 equals("2")로 두고 추가한다. 
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
		else if(select.equals("3")){		//select가 3일 때, 장르
			String sql2 = "select * from web_ger where value=?";		//입력받은 장르명이 몇번인지를 체크하기 위한 sql문
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, search);
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()) {											//검색한 장르가 있다면
				int gerNum = rs2.getInt(1);
				String sql = "select mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_gen=?";	//장르를 기준으로 main_webtoon 탐색
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,gerNum);
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
			
		}
		
		if(rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		
		
		return list;
	}
	
	//내 웹툰 보여주는 메서드
	//작가 이름을 받아서 출력
	public ArrayList<SearchVO> getAdd(String mywebtoon) throws SQLException{
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		conn = ConnectionUtil.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select mw_num, mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_writer = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, mywebtoon);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			SearchVO vo = new SearchVO();
			vo.setNum(rs.getInt("mw_num"));
			vo.setTitle(rs.getString("mw_title"));
			vo.setWriter(rs.getString("mw_writer"));
			vo.setGen(rs.getString("mw_gen"));
			vo.setTag(rs.getString("mw_tag"));
			list.add(vo);
		}
		return list;
	}
	
	
	//찜한 작품 출력
	//like_wb에서 아이디의 lwb_wb_num (작품번호)를 출력한다. 이 출력한 것을 main_webtoon에 넣어 (mw_num = lwb_wb_num임) 나온 것들을 출력한다.
	public ArrayList<SearchVO> getlike(String id) throws SQLException{
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		conn = ConnectionUtil.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select mw_num, mw_title, mw_writer, mw_gen, mw_tag from main_webtoon where mw_num in(select lwb_wb_num from like_wb where lwb_id = ?)");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			SearchVO vo = new SearchVO();
			vo.setNum(rs.getInt("mw_num"));
			vo.setTitle(rs.getString("mw_title"));
			vo.setWriter(rs.getString("mw_writer"));
			vo.setGen(rs.getString("mw_gen"));
			vo.setTag(rs.getString("mw_tag"));
			list.add(vo);
		}
		return list;
	}
	
	
	
	
	
	
	//웹툰 삭제 메서드
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
	
	//웹툰 수정 메서드
	public SearchVO adjust(String title, String writer) throws Exception{
		SearchVO member = null;
		
		String dbpasswd = "";
		
		int x = -1;
		
		try {
			conn = ConnectionUtil.getConnection();
			pstmt = conn.prepareStatement("select * from main_webtoon where mw_title = ?");
			pstmt.setString(1, title);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new SearchVO();
				dbpasswd = rs.getString("mw_writer");
				member.setGen(rs.getString("mw_gen"));
				member.setSub_title(rs.getString("mw_sub_title"));
				member.setTag(rs.getString("mw_tag"));
				member.setWeek(rs.getInt("mw_week"));
				member.setSum(rs.getString("mw_sum"));
				member.setNum(rs.getInt("mw_num"));
				
			if(dbpasswd.equals(writer)) {
				x = 1;
			}
			else
				x = 0;
			}
			else
			x = -1;	
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		if( rs != null) try {rs.close();} catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try {conn.close();} catch(SQLException ex) {}
	}
	return member;
}
	
	//태그 변경 메서드
	public void changeTag(SearchVO member) throws Exception{
		try {
			conn = ConnectionUtil.getConnection();
			pstmt = conn.prepareStatement("update main_webtoon set mw_tag=? where mw_title = ?");
			pstmt.setString(1, member.getTag());
			pstmt.setString(2, member.getTitle());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try { conn.close();} catch(SQLException ex) {}
		}
	}
	
	//요일 변경 메서드
	public void changeWeek(SearchVO member) throws Exception{
		try {
			conn = ConnectionUtil.getConnection();
			pstmt = conn.prepareStatement("update main_webtoon set mw_week = ? where mw_title = ?");
			pstmt.setInt(1, member.getWeek());
			pstmt.setString(2, member.getTitle());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try { conn.close();} catch(SQLException ex) {}
		}
	}
	
	//소제목 변경 메서드
	public void changeSub(SearchVO member) throws Exception{
		try {
			conn = ConnectionUtil.getConnection();
			pstmt = conn.prepareStatement("update main_webtoon set mw_sub_title = ? where mw_title = ? ");
			pstmt.setString(1, member.getSub_title());
			pstmt.setString(2, member.getTitle());
			pstmt.executeUpdate();
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try { conn.close();} catch(SQLException ex) {}		
		}
	}
	
	//장르 변경 메서드
	public void changeGen(SearchVO member) throws Exception{
		try {
			conn = ConnectionUtil.getConnection();
			pstmt = conn.prepareStatement("update main_webtoon set mw_gen = ? where mw_title = ? ");
			pstmt.setString(1, member.getGen());
			pstmt.setString(2, member.getTitle());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try { conn.close();} catch(SQLException ex) {}				
		}
	}
	
	//줄거리 변경 메서드
	public void changeSum(SearchVO member) throws Exception{
		try {
			conn = ConnectionUtil.getConnection();
			pstmt = conn.prepareStatement("update main_webtoon set mw_sum = ? where mw_title = ? ");
			pstmt.setString(1, member.getSum());
			pstmt.setString(2, member.getTitle());
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try { conn.close();} catch(SQLException ex) {}		
		}
	}
	
}
