package search;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionUtil {

	private static DataSource ds = null;
	
	private ConnectionUtil() {}
	
	static {
		try {
			Context InitContext = new InitialContext();
			Context envContext = (Context)InitContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/xe");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
}
