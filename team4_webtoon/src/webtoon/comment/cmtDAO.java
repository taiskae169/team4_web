package webtoon.comment;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

public class cmtDAO {
	
	private cmtDAO() {}
	
	static private cmtDAO instance = new cmtDAO();
	
	public static cmtDAO getinstance() {
		return instance;
	}
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	private Connection getConnection() {
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
	
	public int getCount(String mw_num, String cl_num) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "select count(*) from comment_wb where R_MW_NUM=? and R_CL_NUM =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mw_num);
			pstmt.setString(2, cl_num);
			rs = pstmt.executeQuery();
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		return result;
	}
	
	public ArrayList<cmtVO> getList(String mw_num, String cl_num){
		ArrayList<cmtVO> list = new ArrayList<cmtVO>();
		try {
			conn = getConnection();
			String sql = "select * from comment_wb where R_MW_NUM=? and R_CL_NUM=? order by R_LIKE desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mw_num);
			pstmt.setString(2, cl_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cmtVO vo = new cmtVO();
				
				vo.setNum(rs.getInt("R_NUM"));
				vo.setLike(rs.getInt("R_LIKE"));
				vo.setHate(rs.getInt("R_HATE"));
				vo.setReg(rs.getTimestamp("R_REG"));
				vo.setId(rs.getString("R_WR"));
				vo.setState(rs.getInt("R_STATE"));
				vo.setMw_num(rs.getInt("R_MW_NUM"));
				vo.setCl_num(rs.getInt("R_CL_NUM"));
				vo.setContent(rs.getString("R_CONTENT"));
				
				list.add(vo);
			}
		}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
				if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
				if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		return list;
	}
}
