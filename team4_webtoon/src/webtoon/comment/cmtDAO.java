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
	// 상속 받을 항목
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
	//상속 받을 항목
	
	
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
	// 웹툰 번호와 코멘트 번호를 받아 출력할 코멘트 갯수를 리턴
	
	public ArrayList<cmtVO> getList(String mw_num, String cl_num, int startRow, int endRow){
		ArrayList<cmtVO> list = new ArrayList<cmtVO>();
		try {
			conn = getConnection();
			String sql = "select * from "
					+ "(select rownum r,R_NUM,r_like,r_hate,r_reg,r_wr,r_content,r_state,r_mw_num,r_cl_num from "
					+ "(select * from comment_wb where R_MW_NUM=? and R_CL_NUM=? order by R_LIKE desc)) where r >=? and r <=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mw_num);
			pstmt.setString(2, cl_num);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
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
	}//웹툰 번호와 회차 번호, 시작 순서와 끝 순서를 받아 코멘트 리스트를 리턴
	
	
	public void chState(String num, String state) {
		try {
			conn = getConnection();
			String sql = "update comment_wb set r_state=? where r_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, num);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//댓글 상태를 변경하는 메소드
	
	
	public int likeCh(String id, int cmtNum) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "select * from like_check where id=? and cmt_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cmtNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("like_ch");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
		return result;
	}//댓글을 좋아요 참여 여부 확인 0일시 미참여, 1일시 좋아요, 2일시 싫어요 체크
	
	public void chLike(String id, int like_ch, int cmt_num) {
		try {
			conn = getConnection();
			String sql="insert into like_check(id,like_ch, cmt_num) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, like_ch);
			pstmt.setInt(3, cmt_num);
			pstmt.executeUpdate();
			//먼저 like_ch 테이블에 좋아요/싫어요 했다는 것을 기입 1일시 좋아요, 2일시 싫어요
			
			if(like_ch==1) {
				sql = "update comment_wb set r_like=r_like+1 where r_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cmt_num);
				pstmt.executeUpdate();
			}else if(like_ch==2) {
				sql = "update comment_wb set r_hate=r_hate+1 where r_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cmt_num);
				pstmt.executeUpdate();
			}
			//좋아요 및 싫어요 추가
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//댓글 좋아요/싫어요 추가 메소드
	
	public void deleteLike(String id, int cmt_num, int like_ch) {
		try {
			conn = getConnection();
			String sql="delete from like_check where id =? and cmt_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cmt_num);
			pstmt.executeUpdate();
			//좋아요/싫어요 여부를 테이블에서 삭제
			
			if(like_ch==1) {
				sql = "update comment_wb set r_like=r_like-1 where r_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cmt_num);
				pstmt.executeUpdate();
			}else if(like_ch==2) {
				sql = "update comment_wb set r_hate=r_hate-1 where r_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cmt_num);
				pstmt.executeUpdate();
			}
			//좋아요 및 싫어요 삭제
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//댓글 좋아요/싫어요 삭제 메소드
	
	public void addCmt(String id, int mw_num, int cl_num, String cmt) {
		try {
			conn = getConnection();
			String sql = "insert into comment_wb(r_num, r_wr, r_mw_num, r_cl_num, r_content) values(r_num_seq.nextval,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, mw_num);
			pstmt.setInt(3, cl_num);
			pstmt.setString(4, cmt);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
			if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}//코멘트 추가
	
	
	public ArrayList<cmtVO> getListForAdmin(){
		ArrayList<cmtVO> list = new ArrayList<cmtVO>();
		try {
			conn = getConnection();
			String sql = "select * from comment_wb";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cmtVO vo = new cmtVO();
				
				vo.setNum(rs.getInt("R_NUM"));
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
	}//관리자용 코멘트 리스트( 전체 리스트를 보낸다.)
	
	public void deleteCmt(int num) {
		try {
			conn = getConnection();
			String sql = "delete from comment_wb where r_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		
			
		}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) {try{rs.close();}catch(SQLException e){e.printStackTrace();}}
				if(pstmt!=null) {try{pstmt.close();}catch(SQLException e) {e.printStackTrace();}}
				if(conn!=null) {try{conn.close();}catch(SQLException e) {e.printStackTrace();}}
		}
	}
}
