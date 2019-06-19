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
		MWdetailVO wtDetail=new MWdetailVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select mw.mw_num, mw.mw_title, mw.mw_writer,ww.value week, mw.mw_sum, mw.mw_tag,mw.mw_star,wg.value ger" 
					+" from main_webtoon mw, web_ger wg , web_week ww where  wg.web_st=mw.mw_gen and ww.num=mw.mw_week and mw_num=?");
					pstmt.setInt(1, mw_num);
					rs = pstmt.executeQuery();				
					if (rs.next()) {
						wtDetail.setmNum(rs.getInt("mw_num"));
						wtDetail.setWtTitle(rs.getString("mw_title"));
						wtDetail.setWtAuthor(rs.getString("mw_writer"));
						wtDetail.setDay(rs.getString("week"));
						wtDetail.setWtGenre(rs.getString("ger"));
						wtDetail.setWtTag(rs.getString("mw_tag"));
						wtDetail.setWtSumm(rs.getString("mw_sum"));
						wtDetail.setWtStar(rs.getInt("mw_star"));	
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
		return wtDetail;
	} //웹툰 상세정보(태그,장르,줄거리 등)를 리턴하는 메소드
	
	
	public List getEpisodes(int mw_num,int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List webtoonEP=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * "+ 
					"from (select cl_num,cl_title,cl_title_id,mw_num,cl_reg,cl_star, cl_star_p,cl_star_sum,wt_ep_img, rowNum r "+
					"from (select cl_num,cl_title,cl_title_id,mw_num,cl_reg,cl_star,cl_star_p,cl_star_sum,wt_ep_img from content,main_webtoon where cl_title_id=mw_num and mw_num=? order by cl_reg desc) order by cl_reg desc) where r >=? and r<=? ");
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
							episode.setMw_star_p(rs.getInt("cl_star_p"));
							episode.setMw_star_sum(rs.getInt("cl_star_sum"));
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
						wtEP.setMw_title_id(rs.getInt("mw_num"));
						wtEP.setMwTitle(rs.getString("mw_title"));
						wtEP.setClTitle(rs.getString("cl_title"));
						wtEP.setClNO(rs.getInt("cl_num"));
						wtEP.setClContent(rs.getString("cl_content"));
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
	

	private MWdetailVO setWtStar(int int1) {
		// TODO Auto-generated method stub
		return null;
	}
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
	
	
	
	//뷰어에서 이전편 다음편 기능을 위한 메소드
	public PrevNextEpVO getprevnextEP(int mw_num, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PrevNextEpVO pEPn=new PrevNextEpVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * "+
				"from (select cl_num,cl_title,cl_title_id, lag(cl_num,1,0) over(order by cl_num) as prev_cl_num,lag(cl_title,1,'없음') over(order by cl_num) as prev_cl_title,lead(cl_num,1,0) over(order by cl_num) as next_cl_num,lead(cl_title,1,'없음') over(order by cl_num) as next_cl_title from content where cl_title_id=?) where cl_num=?");
			pstmt.setInt(1, mw_num);
			pstmt.setInt(2, cl_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				/*
				System.out.println(rs.getInt("cl_num"));
				System.out.println(rs.getString("cl_title"));
				System.out.println(rs.getInt("cl_title_id"));
				System.out.println(rs.getInt("prev_cl_num"));
				System.out.println(rs.getString("prev_cl_title"));
				System.out.println(rs.getInt("next_cl_num"));
				System.out.println(rs.getString("next_cl_title"));
				*/
				
				pEPn.setClN(rs.getInt("cl_num"));
				pEPn.setClT(rs.getString("cl_title"));
				pEPn.setClTid(rs.getInt("cl_title_id"));
				pEPn.setPrevClN(rs.getInt("prev_cl_num"));
				pEPn.setPrevClT(rs.getString("prev_cl_title"));
				pEPn.setNextClN(rs.getInt("next_cl_num"));
				pEPn.setNextClT(rs.getString("next_cl_title"));
	
	
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return pEPn;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
