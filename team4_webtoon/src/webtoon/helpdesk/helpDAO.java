package webtoon.helpdesk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class helpDAO {
	private helpDAO() {}
		// TODO Auto-generated constructor stub
	private static helpDAO instance = new helpDAO();
	
	
	public static helpDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
        return ds.getConnection();
    }
	
	public ArrayList<String> getHelpCategory(){
		ArrayList<String> list = new ArrayList<String>();
				
		try {
			conn = getConnection();
			String sql = "select pr_value from pr_cat";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if( rs != null) try {rs.close();} catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return list;
	}

}
