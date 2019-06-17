package webtoon.week;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class weekDAO {

	private static weekDAO instance = new weekDAO();
	
	public static weekDAO getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
        return ds.getConnection();
	}
	
	public weekVO weekCheck(int week) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		weekVO member = null;
		
		int dbweek = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from web_week where num = ?");
			pstmt.setInt(1, week);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new weekVO();
				dbweek = rs.getInt("num");
				member.setValue(rs.getString("value"));
				
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if( rs != null) try {rs.close();} catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return member;
	}
	
}
