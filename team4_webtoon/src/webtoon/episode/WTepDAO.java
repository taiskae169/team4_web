package webtoon.episode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import webtoon.list.MWdetailVO;
import webtoon.content.contentVO;

public class WTepDAO {
	private static WTepDAO instance=new WTepDAO();
	public static WTepDAO getInstance() {
		return instance;
	}
	private WTepDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	public int getEPCount(int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*)from (select cl_num,cl_title,cl_title_id,mw_num,cl_reg,cl_star, wt_ep_img from content,main_webtoon where cl_title_id=mw_num and mw_num=?)");
			pstmt.setInt(1, mw_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);  
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 
	} //웹툰별 총 에피소드 갯수를 리턴
	
	public MWdetailVO getDetail(int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MWdetailVO detail=new MWdetailVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num, mw.mw_title, mw.mw_writer,ww.value week, mw.mw_sum, mw.mw_tag,mw.mw_star,wg.value ger" 
					+" from main_webtoon mw, web_ger wg , web_week ww where  wg.web_st=mw.mw_gen and ww.num=mw.mw_week and mw_num=?");
					pstmt.setInt(1, mw_num);
					rs = pstmt.executeQuery();				
					if (rs.next()) {
						detail.setmNum(rs.getInt("mw_num"));
						detail.setWtTitle(rs.getString("mw_title"));
						detail.setWtAuthor(rs.getString("mw_writer"));
						detail.setDay(rs.getString("week"));
						detail.setWtGenre(rs.getString("ger"));
						detail.setWtTag(rs.getString("mw_tag"));
						detail.setWtSumm(rs.getString("mw_sum"));
						detail.setWtStar(rs.getString("mw_star"));	
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
		return detail;
	} //웹툰별 에피소드 리스트를 리턴하는 메소드
	
	
	public List getEpisodes(int mw_num,int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List webtoonEP=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * "+ 
					"from (select cl_num,cl_title,cl_title_id,mw_num,cl_reg,cl_star, wt_ep_img, rowNum r "+
					"from (select cl_num,cl_title,cl_title_id,mw_num,cl_reg,cl_star, wt_ep_img from content,main_webtoon where cl_title_id=mw_num and mw_num=? order by cl_reg desc) order by cl_reg desc) where r >=? and r<=? ");
					pstmt.setInt(1, mw_num);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						webtoonEP = new ArrayList(); 
						do{ 
							contentVO  episode=new contentVO();
							episode.setWt_ep_img(rs.getString("wt_ep_img"));
							episode.setCl_title(rs.getString("cl_title"));
							episode.setMw_star(rs.getInt("cl_star"));
							episode.setCl_reg(rs.getTimestamp("cl_reg"));
							episode.setCl_num(rs.getInt("cl_num"));
							webtoonEP.add(episode); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return webtoonEP;
	} //웹툰별 에피소드 리스트를 리턴하는 메소드
	
	
	public WTepVO getWTContent(int cl_num, int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		WTepVO wtEP=new WTepVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num,mw.mw_title,c.cl_title,c.cl_num,c.cl_content from content c,main_webtoon mw where mw.mw_num=c.cl_title_id and cl_num=? and mw_num=?");
					pstmt.setInt(1, cl_num);
					pstmt.setInt(2, mw_num);
					rs = pstmt.executeQuery();				
					if (rs.next()) {
						wtEP.setMw_title_id(rs.getInt("mw.mw_num"));
						wtEP.setMwTitle(rs.getString("mw.mw_title"));
						wtEP.setClTitle(rs.getString("c.cl_title"));
						wtEP.setClNO(rs.getInt("c.cl_num"));
						wtEP.setClContent(rs.getString("c.cl_content"));
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
		return wtEP;
	} //웹툰 에피소드 내용을 리턴하는 메소드
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<contentVO> getEpisodesForAdmin(int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<contentVO> webtoonEP=new ArrayList<contentVO>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from content where cl_title_id=?"); 
					pstmt.setInt(1, mw_num);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						
						do{ 
							contentVO  episode=new contentVO();
							episode.setCl_num(rs.getInt("cl_num"));
							episode.setCl_title(rs.getString("cl_title"));
							episode.setCl_reg(rs.getTimestamp("cl_reg"));
							webtoonEP.add(episode); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return webtoonEP;
	} //웹툰별 에피소드 리스트를 리턴하는 메소드
	
	
}
