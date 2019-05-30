	package team4_webtoon;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

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
	public void insertMember(registerBean user_info) throws SQLException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn =  getConnection();

			pstmt = conn.prepareStatement(
					"insert into user_info values(user_info_seq.nextval,?,?,?,?,?,?,sysdate)");
			pstmt.setString(1, user_info.getId());
			pstmt.setString(2, user_info.getPassword());
			pstmt.setString(3, user_info.getEmail());
			pstmt.setString(4, user_info.getAge());
			pstmt.setString(5, user_info.getName());
			pstmt.setInt(6, user_info.getState());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
				if (pstmt != null) try { pstmt.close();} catch(SQLException ex) {}
				if (conn != null) try { conn.close();} catch(SQLException ex) {}
			
		}
	}
	
	public int loginCheck(String id, String pw) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select pw from user_info where id = ?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dbpasswd = rs.getString("pw");
				if(dbpasswd.equals(pw))
					x = 1;
				else
					x = 0;
			}
			else 
				x = -1;

		} catch (Exception ex) {
			ex.printStackTrace();
			} finally {

					if( rs != null) try {rs.close();} catch(SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) try {conn.close();} catch(SQLException ex) {}
				} 
				return x;
			}
	
	public registerBean idCheck(String name, String email) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		registerBean member = null;
		
		
		
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from user_info where name = ?");
			pstmt.setString(1,name);
			rs = pstmt.executeQuery();

			
			if(rs.next())
			{
				member = new registerBean();
				dbpasswd = rs.getString("email");
				member.setId(rs.getString("id"));
				if(dbpasswd.equals(email)) {
					x = 1;
				}
				else
					x = 0;
			}
			else 
				x = -1;

		} catch (Exception ex) {
			ex.printStackTrace();
			} finally {

					if( rs != null) try {rs.close();} catch(SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) try {conn.close();} catch(SQLException ex) {}
				} 
				return member;
				
			}
	
	
	public registerBean pwCheck(String id, String email) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		registerBean member = null;
		
		
		
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from user_info where id = ?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			
			if(rs.next())
			{
				member = new registerBean();
				dbpasswd = rs.getString("email");
				member.setPassword(rs.getString("pw"));
				if(dbpasswd.equals(email)) {
					x = 1;
				}
				else
					x = 0;
			}
			else 
				x = -1;

		} catch (Exception ex) {
			ex.printStackTrace();
			} finally {

					if( rs != null) try {rs.close();} catch(SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) try {conn.close();} catch(SQLException ex) {}
				} 
				return member;
				
			}
	
	public int idCheck1(String name, String email) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from user_info where name = ?");
			pstmt.setString(1,name);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dbpasswd = rs.getString("email");
				if(dbpasswd.equals(email))
					x = 1;
				else
					x = 0;
			}
			else 
				x = -1;

		} catch (Exception ex) {
			ex.printStackTrace();
			} finally {

					if( rs != null) try {rs.close();} catch(SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) try {conn.close();} catch(SQLException ex) {}
				} 
				return x;
			}
	
	public int pwCheck1(String id, String email) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from user_info where id = ?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dbpasswd = rs.getString("email");
				if(dbpasswd.equals(email))
					x = 1;
				else
					x = 0;
			}
			else 
				x = -1;

		} catch (Exception ex) {
			ex.printStackTrace();
			} finally {

					if( rs != null) try {rs.close();} catch(SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) try {conn.close();} catch(SQLException ex) {}
				} 
				return x;
			}	
	
	public int confirmId(String id) 
			throws Exception {
				Connection conn = null;
		        PreparedStatement pstmt = null;
				ResultSet rs= null;
		        String dbpasswd="";
				int x=-1;
		        
				try {
		            conn = getConnection();
		            
		            pstmt = conn.prepareStatement(
		            	"select id from user_info where id = ?");
		            pstmt.setString(1, id);
		            rs= pstmt.executeQuery();

					if(rs.next())
						x= 1; //해당 아이디 있음
					else
						x= -1;//해당 아이디 없음		
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
					if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
				return x;
			}
	
	public int confirmEmail(String email) 
			throws Exception {
				Connection conn = null;
		        PreparedStatement pstmt = null;
				ResultSet rs= null;
		        String dbpasswd="";
				int x=-1;
		        
				try {
		            conn = getConnection();
		            
		            pstmt = conn.prepareStatement(
		            	"select email from user_info where email = ?");
		            pstmt.setString(1, email);
		            rs= pstmt.executeQuery();

					if(rs.next())
						x= 1; //해당 아이디 있음
					else
						x= -1;//해당 아이디 없음		
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
					if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
				return x;
			}
		
		public int level_check(String id) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				
				conn = getConnection();
				String sql = "select * from user_info where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("state");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if( rs != null) try {rs.close();} catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try {conn.close();} catch(SQLException ex) {}
			} 
			
			return result;
		}//회원 등급을 확인하는 메소드
	
		
		public void updateMember(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				
				pstmt = conn.prepareStatement(
						"update user_info set state = 3"+
						"where id=?");
				pstmt.setString(1, member.getId());
				
				pstmt.executeUpdate();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try { conn.close();} catch(SQLException ex) {}
			}
		}
		
	}

