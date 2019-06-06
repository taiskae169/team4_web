	package team4_webtoon;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
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
    //회원 가입시 DB에 값 넣는 메서드
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
	
	//로그인을 체크하는 메서드
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
	
	//아이디 찾기 메서드 - 이름과 이메일을 입력하면 아이디를 보여준다.
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
	
	//비밀번호 찾기 메서드 - 아이디와 이메일을 입력하면 비밀번호를 보여준다.
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
	
	//아이디 찾기 메서드  (번호로 반환)
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
	//비밀번호 체크 메서드 맞으면 1 반환
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
	
	//아이디 중복 확인 메서드
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
	
	//이메일 중복확인 메서드
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
		
		//상태를 체크하는 메서드
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
	
		public registerBean email_check(String id) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			registerBean member = null;
			
			String dbemail = "";
			try {
				
				conn = getConnection();
				String sql = "select * from user_info where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					member = new registerBean();
					dbemail = rs.getString("email");
					
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if( rs != null) try {rs.close();} catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try {conn.close();} catch(SQLException ex) {}
			} 
			
			return member;
		}//회원 등급을 확인하는 메소드
		
		//휴면 상태를 해제하는 메서드
		public void updateMember(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				
				pstmt = conn.prepareStatement(
						"update user_info set state = 2"+
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
		

		public int getUserCount() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				
				conn = getConnection();
				String sql = "select count(*) from user_info";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if( rs != null) try {rs.close();} catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try {conn.close();} catch(SQLException ex) {}
			} 
			
			return result;
		}

		public void changePW(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("update user_info set pw=? where id = ?");
				pstmt.setString(1, member.getPassword());
				pstmt.setString(2, member.getId());
				
				pstmt.executeUpdate();
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try {conn.close();} catch(SQLException ex) {}
			}
		}
		public void changeEmail(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("update user_info set email=? where id = ?");
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getId());
				
				pstmt.executeUpdate();
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try {conn.close();} catch(SQLException ex) {}
			}
		}
		public void changeName(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("update user_info set name=? where id = ?");
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getId());
				
				pstmt.executeUpdate();
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try {conn.close();} catch(SQLException ex) {}
			}
		}
		

		public void changeAge(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("update user_info set age=? where id = ?");
				pstmt.setString(1, member.getAge());
				pstmt.setString(2, member.getId());
				
				pstmt.executeUpdate();
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try {conn.close();} catch(SQLException ex) {}
			}

		}
		public ArrayList<registerBean> get_user_list(){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<registerBean> list = new ArrayList<registerBean>();
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from user_info");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					registerBean vo = new registerBean();
					vo.setUser_no(rs.getInt("user_no"));
					vo.setId(rs.getString("id"));
					vo.setEmail(rs.getString("email"));
					vo.setAge(rs.getString("age"));
					vo.setName(rs.getString("name"));
					vo.setState(rs.getInt("state"));
					vo.setUser_reg(rs.getTimestamp("user_reg"));
					list.add(vo);
					
				}
				
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if( rs != null) try {rs.close();} catch(SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try {conn.close();} catch(SQLException ex) {}
			}
			return list;
		}
		
		public void updateMemberState(int state, int num) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				String sql = "update user_info set state =? where user_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, state);
				pstmt.setInt(2, num);
				
				pstmt.executeUpdate();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try { conn.close();} catch(SQLException ex) {}
			}

		}
		//이메일, 이름, 나이 반환 메서드, adjust 페이지에서 사용 (현재 이름, 이메일, 나이 보여주기 위해
		public registerBean adjust(String id, String pw) throws Exception
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
					dbpasswd = rs.getString("pw");
					member.setEmail(rs.getString("email"));
					member.setName(rs.getString("name"));
					member.setAge(rs.getString("age"));
					if(dbpasswd.equals(pw)) {
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
		public void deleteMember(registerBean member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"update user_info set state = 0 where id = ?");
				pstmt.setString(1,member.getId());
				pstmt.executeUpdate();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try {conn.close();} catch(SQLException ex) {}
			}
		}
		
		
	}

