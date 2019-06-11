package webtoon.episode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import webtoon.content.contentVO;

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
	
	public void addStar(StarVO star) throws Exception{
		 
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
				sql="update star set sStar_p=sStar_p+1,sSum=sSum+?,sStar=? where sMw_num=? and sCl_num=?";
				pstmt=conn.prepareStatement(sql);
				//pstmt.setInt(1,sP);
				pstmt.setInt(1, sVO.);
				pstmt.setInt(2, sVO.getsStar());
				sStar=(rs.getInt("sStar_sum")+sSum)/(sP+1);
				sSum+=sSum;
				
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
}
