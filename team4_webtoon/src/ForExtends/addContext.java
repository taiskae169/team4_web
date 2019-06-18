package ForExtends;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class addContext {
	
	protected addContext() {}
	// 상속 받을 항목
	protected Connection conn = null;
	protected ResultSet rs = null;
	protected PreparedStatement pstmt = null;
	
	protected Connection getConnection() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//상속 받을 항목
}
