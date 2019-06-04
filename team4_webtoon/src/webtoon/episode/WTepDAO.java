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
					"select mw.mw_num, mw.mw_title, mw.mw_sum, mw.mw_tag,mw.mw_star,mw.mw_star_p, ww.value, wg.value , c.cl_title, c.cl_num, c.cl_reg, c.mw_view, c.cl_like, c.cl_writer, c.wt_ep_img"
					+ "from main_webtoon mw, web_week ww, web_ger wg, content c where mw.mw_num=c.cl_title_id and mw.mw_week=ww.num and wg.web_st=mw.mw_gen and mw_num=1000");
					pstmt.setInt(1, mw_num);

					rs = pstmt.executeQuery();
					if (rs.next()) {
						webtoonEP = new ArrayList(); 
						do{ 
							WebToonListVO episode= new WebToonListVO();
							episode.setEp_img(rs.getString("mw_ep_img"));
							episode.setSub_title(rs.getString("mw_sub_title"));
							episode.setStar(rs.getInt("mw_star"));
							episode.setReg(rs.getTimestamp("mw_reg"));
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
