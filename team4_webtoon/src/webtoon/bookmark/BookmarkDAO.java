package webtoon.bookmark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import webtoon.bookmark.BookmarkVO;
import webtoon.episode.WTepVO;

public class BookmarkDAO {
	
	private static BookmarkDAO instance=new BookmarkDAO();
	public static BookmarkDAO getInstance() {
		return instance;
	}
	
	private BookmarkDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	public boolean checkBM(String id, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean BMyn=false;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from like_check where id=? and cl_num=? and bm_ch=1");
			pstmt.setString(1, id);
			pstmt.setInt(2, cl_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				BMyn=true;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return BMyn;
	}
	
	public void addBMtoDB(String id,int mw_num,int cl_num,String mw_title,String cl_title, String wt_writer) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("insert into bookmark values(bm_num_seq.nextval,?,?,?,?,?,?,sysdate)");			
			pstmt.setString(1,id);
			pstmt.setInt(2, mw_num);
			pstmt.setString(3,mw_title);
			pstmt.setInt(4, cl_num);
			pstmt.setString(5,cl_title);
			pstmt.setString(6,wt_writer);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}

	public WTepVO getInfo(int mw_num, int cl_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		WTepVO info=new WTepVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num,mw.mw_title,c.cl_num,c.cl_title,c.cl_writer from main_webtoon mw, content c where mw.mw_num=cl_title_id and mw.mw_num=? and c. cl_num=?");
					pstmt.setInt(1, mw_num);
					pstmt.setInt(2, cl_num);
					rs = pstmt.executeQuery();				
					if (rs.next()) {
						info.setMw_title_id(rs.getInt("mw_num"));
						info.setMwTitle(rs.getString("mw_title"));
						info.setClNO(rs.getInt("cl_num"));
						info.setClTitle(rs.getString("cl_title"));
						info.setClWriter(rs.getString("cl_writer"));
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
		return info;
	} //웹툰 상세정보(태그,장르,줄거리 등)를 리턴하는 메소드
	
	
	//like_check 테이블에 bm_ch 추가
	public void addBMch (String id, int mw_num, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//boolean ynbm=false;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from like_check where id=? and mw_num=? and cl_num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			rs=pstmt.executeQuery();
			System.out.println("[1] like_check에서 조회");
			if(rs.next()) {
				//ynbm=true;
				//if(ynbm) {
				System.out.println("[2-1] like_check에서 조회 결과값에서 star_ch=1이 있으면");
					pstmt=conn.prepareStatement("update like_check set bm_ch=1 where id=? and mw_num=? and cl_num=? and star_ch=1");
					pstmt.setString(1, id);
					pstmt.setInt(2, mw_num);
					pstmt.setInt(3, cl_num);
					pstmt.executeUpdate();
					System.out.println("[3-1] bm_ch=1로 업데이트");
			}else {
				System.out.println("[2-2] like_check에 star_ch=1인 결과가 없어서 새롭게 신규로 bm_ch=1로 ");
					pstmt=conn.prepareStatement("insert into like_check(id,mw_num,cl_num,bm_ch) values(?,?,?,1)");
					pstmt.setString(1, id);
					pstmt.setInt(2, mw_num);
					pstmt.setInt(3, cl_num);
					pstmt.executeUpdate();
					System.out.println("[3-2] like_check에 신규로 bm_ch=1 등록 성공");
				//}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
	}
	
	
	
	
	
}
