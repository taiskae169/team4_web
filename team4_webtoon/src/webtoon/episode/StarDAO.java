package webtoon.episode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import webtoon.content.contentVO;
import webtoon.list.MWdetailVO;

public class StarDAO {
	private static StarDAO instance=new StarDAO();
	public static StarDAO getInstance() {
		return instance;
	}
	private StarDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	//로그인 한 아이디가 작가와 같은지 확인하는 메서드
	public String checkIDstate(int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String AorR=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select cl_num,cl_title,cl_title_id,cl_writer from content where cl_num=?");
			pstmt.setInt(1, cl_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//System.out.println(rs.getString("cl_writer"));
				AorR=rs.getString("cl_writer");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return AorR;
	} //로그인 한 아이디가 작가와 같은지 확인하는 메서드
	

	
	//별점 참여 여부 확인하는 메서드 0은 미참여, 1은 참여 
	public int checkStar(String id, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int yn=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from like_check where id=? and cl_num=? and star_ch=1");
			pstmt.setString(1, id);
			pstmt.setInt(2, cl_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				yn=rs.getInt("star_ch");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return yn;
	}//별점 참여 여부 확인하는 메서드 0은 미참여, 1은 참여 
	
	
	//like_check 테이블에 star_ch 추가
	public void addSrecord (String id, int mw_num, int cl_num ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int Syn=0;
		try {
			conn=getConnection();
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from like_check where id=? and mw_num=? and cl_num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			rs=pstmt.executeQuery();
			//System.out.println("[1] like_check에서 조회");
			if(rs.next()) {
				Syn=rs.getInt("bm_ch");
				if(Syn==1) {
				//System.out.println("[2-1] like_check에서 조회 결과값에서 bm_ch=1이 있으면");
					pstmt=conn.prepareStatement("update like_check set star_ch=1 where id=? and mw_num=? and cl_num=? and bm_ch=1");
					pstmt.setString(1, id);
					pstmt.setInt(2, mw_num);
					pstmt.setInt(3, cl_num);
					pstmt.executeUpdate();
				//System.out.println("[3-1] star_ch=1로 업데이트");
				}
			}else {
				//System.out.println("[2-2] rs.next()가 없어서 like_check에 새롭게 신규로 bm_ch=1로 ");
				pstmt=conn.prepareStatement("insert into like_check(id,mw_num,cl_num,star_ch) values(?,?,?,1)");
				pstmt.setString(1, id);
				pstmt.setInt(2, mw_num);
				pstmt.setInt(3, cl_num);
				pstmt.executeUpdate();
				//System.out.println("[3-2]신규로 star_ch=1 등록 성공");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
	}//like_check 테이블에 star_ch 추가
	
	

	
	
	//별점 매기기
	public void insertStar(StarVO sVO ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int sSum=sVO.getsStar_sum();	
		int sMw=sVO.getsMw_num();
		int sCl=sVO.getsCl_num();
		
		String sql="";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from star where sMw_num=? and sCl_num=?");
			pstmt.setInt(1, sMw);
			pstmt.setInt(2, sCl);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sql="update star set sStar_p=sStar_p+1,sStar_sum=sStar_sum+?,sStar=? where sMw_num=? and sCl_num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, sSum);
				int sStar=(rs.getInt("sStar_sum")+sSum)/(rs.getInt("sStar_p")+1);
				pstmt.setInt(2, sStar);	
				pstmt.setInt(3, sMw);		
				pstmt.setInt(4, sCl);		
				pstmt.executeUpdate();
			}else {
				sql="insert into star values (?,?,?,1,?)";
				pstmt=conn.prepareStatement(sql);
				//pstmt.setInt(1,sP);
				pstmt.setInt(1, sCl);
				pstmt.setInt(2, sMw);
				pstmt.setInt(3, sSum);
				pstmt.setInt(4, sSum);
				pstmt.executeUpdate();
			}		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
	}//별점 매기기
	
	//content(SQL)에 별점 업데이트
	public void updateContentStar(int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("update content c set c.cl_star=(select s.sstar from star s where c.cl_num=s.scl_num),c.cl_star_p=(select s.sstar_p from star s where c.cl_num=s.scl_num), \r\n" + 
					"c.cl_star_sum=(select s.sstar_sum from star s where c.cl_num=s.scl_num) where c.cl_num=? ");
			pstmt.setInt(1, cl_num);
			pstmt.executeUpdate();			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
	}//content(SQL)에 별점 업데이트
	
	//main_webtoon(SQL)에 별점 업데이트
	public void updateMWStar(int mw_num) throws Exception{
		//System.out.println("test1");
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//System.out.println("test2");
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"update main_webtoon set mw_star=(select sum(cl_star)/count(cl_star) "+
					 "from content where cl_title_id=?) where mw_num=?");
			pstmt.setInt(1,mw_num);
			pstmt.setInt(2, mw_num);
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	} //main_webtoon(SQL)에 별점 업데이트
	

	/*
	private MWdetailVO setWtStar(int int1) {
		// TODO Auto-generated method stub
		return null;
	}
	*/
	
	//mainWT.jsp(웹툰 상세 페이지)에 웹툰 별점 
	public int getStar(int cl_title_id,int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select cl_star from content where cl_title_id=? and cl_num=?");
			pstmt.setInt(1, cl_title_id);
			pstmt.setInt(2, cl_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt("mw_star");  
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 	 
	}//mainWT.jsp(웹툰 상세 페이지)에 웹툰 별점 
	

}
