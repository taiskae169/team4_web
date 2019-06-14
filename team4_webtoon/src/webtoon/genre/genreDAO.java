package webtoon.genre;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class genreDAO {
	private static genreDAO instance = new genreDAO();
	
	public static genreDAO getInstance() {
		return instance;
	}
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
        return ds.getConnection();
    }
    
    public genreVO genreCheck(int genre) throws Exception{
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	genreVO member = null;
    	
    	int dbGenre = 0;
    	int x = -1;
    	
    	try {
    		conn = getConnection();
    		pstmt = conn.prepareStatement("select * from web_ger where web_st = ?");
    		pstmt.setInt(1, genre);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			member = new genreVO();
    			dbGenre = rs.getInt("web_st");
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
