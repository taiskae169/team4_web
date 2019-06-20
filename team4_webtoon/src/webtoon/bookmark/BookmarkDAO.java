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
			pstmt=conn.prepareStatement("select bm_ch from like_check where id=? and cl_num=?");
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
	
	public void addBMtoDB(WTepVO info,int mw_num,String id, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("insert into bookmark values(bm_num_seq.nextval,?,?,?,?,?,?,sysdate) where id=? and cl_num=?");
			pstmt.setString(1,id );
			pstmt.setInt(2, mw_num);
			pstmt.setString(3,info.getMwTitle());
			pstmt.setInt(4, cl_num);
			pstmt.setString(5,info.getClTitle());
			pstmt.setString(6,info.getClWriter());
			pstmt.setString(7, id);
			pstmt.setInt(8, cl_num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}

	public WTepVO getInfo(int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		WTepVO info=new WTepVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num,mw.mw_title,c.cl_num,c.cl_title,c.cl_writer from main_webtoon mw, content c where mw.mw_num=cl_title_id and mw.mw_num=?");
					pstmt.setInt(1, mw_num);
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
	
	
	//like_check 테이블에 star_ch 추가
	public void addBMch (String id, int mw_num, int cl_num ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ynbm=false;
		try {
			conn=getConnection();
			conn=getConnection();
			pstmt=conn.prepareStatement("select bm_ch from like_check where id=? and mw_num=? and cl_num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ynbm=true;
				if(ynbm) {
					pstmt=conn.prepareStatement("update like_check set bm_ch=1 where id=? and mw_num=? and cl_num=?");
					pstmt.setString(1, id);
					pstmt.setInt(2, mw_num);
					pstmt.setInt(3, cl_num);
					pstmt.executeUpdate();	
				}else {
					pstmt=conn.prepareStatement("insert  into like_check(id,mw_num,cl_num,bm_ch) values (?,?,?,1)");
					pstmt.setString(1, id);
					pstmt.setInt(2, mw_num);
					pstmt.setInt(3, cl_num);
					pstmt.executeUpdate();	
				}
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
