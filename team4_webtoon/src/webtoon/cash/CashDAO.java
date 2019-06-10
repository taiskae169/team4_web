package webtoon.cash;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CashDAO {
	private CashDAO() {}
		// TODO Auto-generated constructor stub
	private static CashDAO instance = new CashDAO();
	
	
	public static CashDAO getInstance() {
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
	
	public int getMonthCash(int month) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "select * from (select cash_io,to_char(cash_reg,'MM') mon from cash) where mon = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, month);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					int i = rs.getInt("cash_io");
					//cash_io -> 입출력 내역
					if(i>0) {
						result +=i;
						//io가 0보다 클 시 충전한 것이므로 result에 가산
					}
				}while(rs.next());
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if( rs != null) try {rs.close();} catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		} 
		return result;
	}//이번달 캐시 충전을 체크


}
