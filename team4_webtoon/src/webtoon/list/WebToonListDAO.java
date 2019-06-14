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
		
	}//전채 정식 연재 웹툰 갯수를 리턴
	
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
			pstmt.setString(11, main_webtoon.getSum());
			pstmt.setInt(12, main_webtoon.getView());

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
		//리스트 번호와 만화 번호를 같이 입력해 놓기 위해 map을 사용 key : 리스트 번호(rownum), value : 웹툰 번호
		try {
		conn = getConnection();
		HashSet<Integer> hs = new HashSet<Integer>();
		//중복되어 나오는 것을 방지하기 위해 hashmap 사용
		
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
			//전체 웹툰 갯수까지 랜덤값 생성하여 recom에 대입, (rownum으로 나오는 숫자는 1부터 이므로 +1을 하여 대입)
			hs.add(mp.get(recom));
			//랜덤값을 받아 hashset인 hs 리스트에 웹툰 번호를 받음
			
		}//hashset의 갯수가 5개가 될때까지 반복하여 
		
		Iterator<Integer> it = hs.iterator();
		//차례대로 hs를 출력하기 위해 iterator 사용
		sql = "insert into today_recom values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, today);
		int co = 2;//이미 1번째는 해결됬으므로 2부터 넣기 위해 설정
		while(it.hasNext()) {	//it에 5개가 들어있으므로 5번만 출력됨
			pstmt.setInt(co, it.next());
			//it 안에 있는 값을 입력
			co++;
			//co값을 증가시킨다.
		}
		pstmt.executeUpdate();
		
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
			
	}//오늘의 추천 웹툰 리스트 저장 
	
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
				//rs에서 웹툰 번호를 확인하여 mw_num에 대입
				pstmt.setInt(1, mw_num);
				ResultSet rs2 = pstmt.executeQuery();
				//rs1의 값을 계속 사용해야하므로 rs2를 생성
				
				if(rs2.next()) {
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
					//추천 웹툰 정보를 list에 저장
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
	}//오늘의 추천 리스트 리턴
	
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
				//result에 조회수를 더함
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return result;
	}//장르별 총 조회수를 리턴
	
	public ArrayList<WebtoonListForAdminVO> getListForAdmin(){
		conn = getConnection();
		ArrayList<WebtoonListForAdminVO> list = new ArrayList<WebtoonListForAdminVO>();
		try {
			String sql = "select mw_num num, mw_title title, gen, week, writer, value mag from"
					+ " (select mw_num, mw_title, gen, value week, writer, mw_mag from"
					+ " (select mw_num, mw_title, value gen, mw_week, mw_writer writer, mw_mag from"
					+ " main_webtoon, web_ger where mw_gen=web_st), web_week where mw_week = web_week.num), web_mag where mw_mag = mag_st";
			// num, title, gen, week, writer, mag를 찾는 sql문
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				WebtoonListForAdminVO vo = new WebtoonListForAdminVO();
				vo.setNum(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setGen(rs.getString(3));
				vo.setWeek(rs.getString(4));
				vo.setWriter(rs.getString(5));
				vo.setMag(rs.getString(6));
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
	}//관리자용 웹툰 목록 페이지를 위한 메소드
	
	public ArrayList<String> getGen(){
		conn = getConnection();
		ArrayList<String> list = new ArrayList<String>();
		try {
			String sql = "select value from web_ger";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return list;
	}//웹툰 장르 정의 항목을 불러오는 메소드
	
	public ArrayList<String> getMag(){
		conn = getConnection();
		ArrayList<String> list = new ArrayList<String>();
		try {
			String sql = "select value from web_mag";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		
		return list;
	}//웹툰 장르 정의 항목을 불러오는 메소드
	
	public void updateGer(int num, int ger) {
		conn = getConnection();
		//int state = changeGer(ger);
		try {
			String sql = "update main_webtoon set mw_gen=? where mw_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ger);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//main_webtoon의 장르을 변경해주는 메소드
	
	public void updateWeek(int num, int week) {
		conn = getConnection();
		try {
			String sql = "update main_webtoon set mw_week=? where mw_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, week);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//main_webtoon의 mw_week 항목을 변경해주는 메소드
	
	
	public void updateMag(int num, int mag) {
		conn = getConnection();
		try {
			String sql = "update main_webtoon set mw_mag=? where mw_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mag);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) { try {rs.close();}catch(SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn !=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//main_webtoon의 mw_mag 항목을 변경해주는 메소드
	
	
}

	
	

