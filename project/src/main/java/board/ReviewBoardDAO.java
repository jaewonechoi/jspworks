package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class ReviewBoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//게시글 목록 조회
	public List<RBoard> getRBoardList(){
		List<RBoard> rboardList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM review ORDER BY rno";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RBoard rb = new RBoard();
				rb.setRno(rs.getInt("rno"));
				rb.setRtitle(rs.getString("rtitle"));
				rb.setRcontent(rs.getString("rcontent"));
				rb.setRdate(rs.getTimestamp("rdate"));
				rb.setRfilename(rs.getString("rfilename"));
				rb.setRrate(rs.getInt("rrate"));
				rb.setLikes(rs.getInt("likes"));
				
				rboardList.add(rb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rboardList;
	}
	
	//공지사항 글쓰기
	public void rWrite(RBoard rb) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO review(rno, rtitle, rcontent, id) "
					+ "VALUES (seq_rno.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rb.getRtitle());
			pstmt.setString(2, rb.getRcontent());
			pstmt.setString(3, rb.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	public RBoard getRBoard(int rno) {
		RBoard rb = new RBoard();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM review WHERE rno = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rb.setRno(rs.getInt("rno"));
				rb.setRtitle(rs.getString("rtitle"));
				rb.setRcontent(rs.getString("rcontent"));
				rb.setRdate(rs.getTimestamp("rdate"));
				rb.setRfilename(rs.getString("rfilename"));
				rb.setRrate(rs.getInt("rrate"));
				rb.setLikes(rs.getInt("likes"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rb;
	}
	
	public void deleteRBoard(int rno) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM review WHERE rno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
