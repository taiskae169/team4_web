package webtoon.bookmark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import webtoon.bookmark.BookmarkVO;
import webtoon.content.contentVO;
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
	
	public void addBMtoDB(String id,int mw_num,int cl_num,String mw_title,String cl_title, String wt_writer, String ep_img) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("insert into bookmark values(bm_num_seq.nextval,?,?,?,?,?,?,?,sysdate)");			
			pstmt.setString(1,id);
			pstmt.setInt(2, mw_num);
			pstmt.setString(3,mw_title);
			pstmt.setInt(4, cl_num);
			pstmt.setString(5,cl_title);
			pstmt.setString(6,wt_writer);
			pstmt.setString(7, ep_img);
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
	
	
	public String getThumbIMG(int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String thumb=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select cl_title_id,cl_num,cl_title,cl_writer,wt_ep_img from content where cl_num=?");
					pstmt.setInt(1, cl_num);
					rs = pstmt.executeQuery();				
					if (rs.next()) {
						thumb=rs.getString("wt_ep_img");
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
		return thumb;	
	} 
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	public List getBMwebtoon(String id,int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List webtoonBM=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * "+ 
					"from (select bm_num,bm_user_id,bm_wt_num,bm_wt_title,bm_cl_num,bm_cl_title,bm_writer,bm_img,bm_reg,rowNum r "+
					"from (select * from bookmark where bm_user_id=? order by bm_reg desc)order by bm_reg desc) where r >=? and r<=? ");
					pstmt.setString(1, id);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						webtoonBM = new ArrayList(); 
						do{ 
							BookmarkVO  bmk=new BookmarkVO();
							bmk.setBmNum(rs.getInt("bm_num"));
							bmk.setBmWNum(rs.getInt("bm_wt_num"));
							bmk.setBmWTitle(rs.getString("bm_wt_title"));
							bmk.setBmCNum(rs.getInt("bm_cl_num"));
							bmk.setBmCTitle(rs.getString("bm_cl_title"));
							bmk.setBmWriter(rs.getString("bm_writer"));
							bmk.setBmImg(rs.getString("bm_img"));
							bmk.setBmReg(rs.getTimestamp("bm_reg"));
							webtoonBM.add(bmk); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return webtoonBM;
		
	}
	
	//북마크된 웹툰 개수
	public int getBMCount(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*)from bookmark where bm_user_id=?");
			pstmt.setString(1, id);
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
	}
	
	
	//Bookmark(SQL)에서 북마크 기록 삭제하기
	public void deleteBookmark(String chk, String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int bmk=Integer.parseInt(chk);
		try {
			conn = getConnection();
				pstmt = conn.prepareStatement("delete from bookmark where bm_num=? and bm_user_id=?");
				pstmt.setInt(1,bmk);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {			
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	
	public List<BookmarkVO> getdBmkInfo(String bmk, String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookmarkVO> dbmk= new ArrayList<BookmarkVO>();
		int chk=Integer.parseInt(bmk);
		try {
			conn = getConnection();
				pstmt = conn.prepareStatement("select * from bookmark where bm_num=? and bm_user_id=?");
				pstmt.setInt(1,chk);
				pstmt.setString(2, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					BookmarkVO bmkD=new BookmarkVO();
					
					System.out.println(rs.getInt("bm_wt_num"));
					System.out.println(rs.getInt("bm_cl_num"));
					
					bmkD.setBmWNum(rs.getInt("bm_wt_num"));
					bmkD.setBmCNum(rs.getInt("bm_cl_num"));
					dbmk.add(bmkD);
				}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dbmk;
	}
	
	
	
	
	
	
	
	
	
	
	
	public void deleteBkch(String id,int mw_num, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from like_check where id=? and mw_num=? and cl_num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String s=Integer.toString(rs.getInt("star_ch"));
				
				
				
				
				                                               
				System.out.println("[2-1] like_check에서 조회 결과값에서 star_ch=1, bm_ch=1이 있을떄");
				pstmt=conn.prepareStatement("update like_check set bm_ch=null where id=? and mw_num=? and cl_num=? and star_ch=1");
				pstmt.setString(1, id);
				pstmt.setInt(2, mw_num);
				pstmt.setInt(3, cl_num);
				pstmt.executeUpdate();
				System.out.println("[3-1] bm_ch=null로 업데이트");
		}else {
				System.out.println("[2-2] like_check에 bm_ch=1만 있을떄 ");
				pstmt=conn.prepareStatement("delete like_check where bm_ch=1 and id=? and mw_num=? and cl_num=?");
				pstmt.setString(1, id);
				pstmt.setInt(2, mw_num);
				pstmt.setInt(3, cl_num);
				pstmt.executeUpdate();
				System.out.println("[3-2] like_check에 bm_ch=1인 결과 삭제");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	
	
}
