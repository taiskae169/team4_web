package team4_webtoon;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;


public class registerDAO {
	private static registerDAO instance = new registerDAO();
	

	public static registerDAO getInstance() {
		return instance;
	}
	private registerDAO() {}
	
	
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
        return ds.getConnection();
    }
	public void insertMember(registerBean member) throws SQLException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn =  getConnection();

			pstmt = conn.prepareStatement(
					"insert into user_info values(user_info_seq,?,?,?,?,?,?,?)");

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAge());
			pstmt.setString(5, member.getName());
			pstmt.setInt(6, member.getState());
			pstmt.setTimestamp(7, member.getReg());
			
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
				if (pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
				if (conn != null) try { conn.close();} catch(SQLException ex) {}
			
		}
	}
}
