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

import webtoon.list.WebToonListVO;
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
			pstmt = conn.prepareStatement("select count(*) from main_webtoon where mw_num=?");
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
	
	public List getEpisodes(int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List webtoonEP=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num, mw.mw_title, mw.mw_sum, mw.mw_tag,mw.mw_star,mw.mw_star_p, ww.value, wg.value , c.cl_title, c.cl_num, c.cl_reg, c.cl_view, c.cl_like, c.cl_writer, c.wt_ep_img"
					+ "from main_webtoon mw, web_week ww, web_ger wg, content c where mw.mw_num=c.cl_title_id and mw.mw_week=ww.num and wg.web_st=mw.mw_gen and mw_num=1000");
					pstmt.setInt(1, mw_num);

					rs = pstmt.executeQuery();
					if (rs.next()) {
						webtoonEP = new ArrayList(); 
						do{ 
							contentVO  episode=new contentVO();
							episode.setWt_ep_img(rs.getString("mw_ep_img"));
							episode.setCl_title(rs.getString("cl_title"));
							episode.setMw_star(rs.getInt("cl_star"));
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
	
	public List getDetail(int mw_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List wtDetail=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num, mw.mw_title, m.mw_writer,mw.mw_week, mw.mw_sum, mw.mw_tag,mw.mw_star,mw.mw_star_p,  wg.value , c.cl_title, c.cl_num, c.cl_reg, c.cl_view, c.cl_like"
					+ "from main_webtoon mw, web_ger wg, content c where mw.mw_num=c.cl_title_id and wg.web_st=mw.mw_gen and mw_num=?");
					pstmt.setInt(1, mw_num);

					rs = pstmt.executeQuery();
					if (rs.next()) {
						wtDetail=new ArrayList();

						do{ 
							WebToonListVO detail=new WebToonListVO();
							detail.setTitle(rs.getString("mw.mw_title"));
							detail.setWriter(rs.getString("mw.mw_writer"));
							detail.setSum(rs.getString("mw.mw_sum"));
							detail.setGen(rs.getString("wg.value"));
							detail.setTag(rs.getString("mw.mw_tag"));
							detail.setLike(rs.getInt("mw.mw_like"));
							detail.setWeek(rs.getInt("mw.mw_week"));
							wtDetail.add(detail);
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return wtDetail;
	} //웹툰별 에피소드 리스트를 리턴하는 메소드
}
