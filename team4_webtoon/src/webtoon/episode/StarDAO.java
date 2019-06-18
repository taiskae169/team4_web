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
	
	public boolean checkStar(String id, int mw_num, int cl_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean yn=false;
		String sql="";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from like_check where id=? and mw_num=? and cl_num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				yn=true;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return yn;
	}
	
	public void addSrecord (String id, int mw_num, int cl_num ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("insert  into like_check(id,mw_num,cl_num,star_ch) values (?,?,?,1)");
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			pstmt.executeUpdate();			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	}
	
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
	}
	
	
	public void updateMWStar(int cl_title_id,int mw_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		MWdetailVO wtS=new MWdetailVO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update main_webtoon set mw_star=(select sum(cl_star)/count(cl_star) from content where cl_title_id=?) where mw_num=?");
			pstmt.setInt(1, cl_title_id);
			pstmt.setInt(2, mw_num);
			pstmt.executeUpdate();				
		}catch(Exception ex) {
			
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
	} 
	
	
	
	
	
	
	
	
	private MWdetailVO setWtStar(int int1) {
		// TODO Auto-generated method stub
		return null;
	}
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
	}
	

}
