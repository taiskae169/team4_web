package webtoon.list;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WebToonListDAO {
	private WebToonListDAO() {}
	
	static private WebToonListDAO instance = new WebToonListDAO();
	
	public static WebToonListDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	Statement st;
	SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd HH:mm");
	
	
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
	
	public int getCount(int week) {
		conn = getConnection(); 
		int result=0;
		try {
			String sql = "select count(*) from main_webtoon where MW_WEEK=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, week);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return result;
		
	}//요일별 웹툰 갯수를 리턴
	
	
	public int getCount() {
		conn = getConnection(); 
		int result=0;
		try {
			String sql = "select count(*) from main_webtoon";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return result;
		
	}//전채 웹툰 갯수를 리턴
	
	public ArrayList<WebToonListVO> getWeeklyWebtoon(int week){
		conn = getConnection();
		ArrayList<WebToonListVO> list = new ArrayList<WebToonListVO>();
		try {
			String sql = "select rownum r, mw_num, mw_title, mw_sub_title, mw_reg, mw_writer, value gen, mw_week, mw_like, "
					+ "mw_mag,mw_tag, mw_star, mw_star_p from (select rownum r, mw_num, mw_title, mw_sub_title, mw_reg, mw_writer, mw_gen, mw_week, mw_like, "
					+ "mw_mag,mw_tag, mw_star, mw_star_p from (select * from main_webtoon where MW_WEEK=? order by MW_LIKE asc)), WEB_GER where web_st = mw_gen";
			// 별점을 기준으로 내림차순, 요일별 웹툰을 찾는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, week);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				WebToonListVO vo = new WebToonListVO();
				vo.setNum(rs.getInt("mw_num"));
				vo.setTitle(rs.getString("mw_title"));
				vo.setSub_title(rs.getString("mw_sub_title"));
				vo.setReg(rs.getTimestamp("mw_reg"));
				vo.setWriter(rs.getString("mw_writer"));
				vo.setGen(rs.getString("gen"));
				vo.setWeek(rs.getInt("mw_week"));
				vo.setLike(rs.getInt("mw_like"));
				vo.setMag(rs.getInt("mw_mag"));
				vo.setTag(rs.getString("mw_tag"));
				vo.setStar(rs.getInt("mw_star"));
				vo.setStart_p(rs.getInt("mw_star_p"));
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

	}//요일별 웹툰 리스트를 리턴하는 메소드
	
	public void insertWebtoon(WebToonListVO main_webtoon) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"insert into main_webtoon values(main_webtoon_seq.nextval,?,?,sysdate,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, main_webtoon.getTitle());
			pstmt.setString(2, main_webtoon.getSub_title());
			pstmt.setString(3, main_webtoon.getWriter());
			pstmt.setString(4, main_webtoon.getGen());
			pstmt.setInt(5, main_webtoon.getWeek());
			pstmt.setInt(6, main_webtoon.getLike());
			pstmt.setInt(7, main_webtoon.getMag());
			pstmt.setString(8, main_webtoon.getTag());
			pstmt.setInt(9, main_webtoon.getStar());
			pstmt.setInt(10, main_webtoon.getStart_p());
			pstmt.setString(11, main_webtoon.getMw_sum());
			pstmt.setInt(12, main_webtoon.getWt_view());

			pstmt.executeUpdate();
			
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	

	public void setTodayrecom(String today) {
		int count = 0; //메인웹툰 갯수
		HashMap<Integer, Integer> mp = new HashMap<Integer, Integer>();
		try {
		conn = getConnection();
		HashSet<Integer> hs = new HashSet<Integer>();
		
		
		String sql = "select count(*) from main_webtoon where mw_week!=0";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		// 메인 웹툰의 총 갯수를 넣음
		
		sql = "select rownum r, mw_num from (select * from main_webtoon where mw_week!=0)";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			mp.put(rs.getInt("r"), rs.getInt("mw_num"));
		}
		//map 리스트에 순서와 mw_num을 입력한다.
		
		
		for(;hs.size()<5;) {
			int recom = (int)(Math.random()*count)+1;
			System.out.println("랜던숫자 :" + recom);
			hs.add(mp.get(recom));
			System.out.println("랜덤 웹툰번호 : " + mp.get(recom));
			
		}
		
		Iterator<Integer> it = hs.iterator();
		sql = "insert into today_recom values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, today);
		int co = 2;//5개까지 하기 위한 것
		System.out.println("test");
		while(it.hasNext()) {
			pstmt.setInt(co, it.next());
			co++;
		}
		pstmt.executeUpdate();
		
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
			
	}
	
	public ArrayList<WebToonListVO> getTodayrecom(String today) {
		ArrayList<WebToonListVO> list = new ArrayList<WebToonListVO>();
		try {
		conn = getConnection();
		String sql = "select * from today_recom where today=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, today);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			for(int i =1; i<6; i++) {
				sql = "select  mw_num, mw_title, mw_sub_title, mw_reg, mw_writer, value gen, mw_week, mw_like, mw_mag,mw_tag, mw_star, mw_star_p from "
						+ "(select * from main_webtoon where mw_num=?), WEB_GER where web_st = mw_gen";
				pstmt = conn.prepareStatement(sql);
				int mw_num = rs.getInt("wb"+i);
				//System.out.println(mw_num);
				pstmt.setInt(1, mw_num);
				ResultSet rs2 = pstmt.executeQuery();
				
				if(rs2.next()) {
					System.out.println(rs2.getInt("mw_num"));
					WebToonListVO vo = new WebToonListVO();
					vo.setNum(rs2.getInt("mw_num"));
					vo.setTitle(rs2.getString("mw_title"));
					vo.setSub_title(rs2.getString("mw_sub_title"));
					vo.setReg(rs2.getTimestamp("mw_reg")); 
					vo.setWriter(rs2.getString("mw_writer"));
					vo.setGen(rs2.getString("gen"));
					vo.setWeek(rs2.getInt("mw_week"));
					vo.setLike(rs2.getInt("mw_like"));
					vo.setMag(rs2.getInt("mw_mag"));
					vo.setTag(rs2.getString("mw_tag"));
					vo.setStar(rs2.getInt("mw_star"));
					vo.setStart_p(rs2.getInt("mw_star_p"));
					list.add(vo);
				}//if문 종료
			}//for문 종료
		}//if문 종료
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
			return list;
	}
	
	public int getGenView(int gen) {
		conn = getConnection(); 
		int result=0;
		try {
			String sql = "select * from main_webtoon where mw_gen = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gen);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result += rs.getInt("mw_view");
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return result;
	}
	
}

	
	

