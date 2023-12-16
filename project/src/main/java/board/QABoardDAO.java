package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class QABoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//게시글 목록 조회
	public List<QABoard> getQABoardList(){
		List<QABoard> qaboardList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM qa ORDER BY qno";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QABoard qab = new QABoard();
				qab.setQno(rs.getInt("qno"));
				qab.setQtitle(rs.getString("qtitle"));
				qab.setQcontent(rs.getString("qcontent"));
				qab.setQfilename(rs.getString("qfilename"));
				qab.setQdate(rs.getTimestamp("qdate"));
				qab.setQhit(rs.getInt("qhit"));
				qab.setId(rs.getString("id"));
				
				qaboardList.add(qab);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qaboardList;
	}
	
	//문의게시판 글쓰기
	public void qaWrite(QABoard qab) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "insert into qa(qno, qtitle, qcontent, id) "
					+ "VALUES (seq_qno.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qab.getQtitle());
			pstmt.setString(2, qab.getQcontent());
			pstmt.setString(3, qab.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	public QABoard getQABoard(int qno) {
		QABoard qab = new QABoard();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM qa WHERE qno = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qab.setQno(rs.getInt("qno"));
				qab.setQtitle(rs.getString("qtitle"));
				qab.setQcontent(rs.getString("qcontent"));
				qab.setQfilename(rs.getString("qfilename"));
				qab.setQdate(rs.getTimestamp("qdate"));
				qab.setQhit(rs.getInt("qhit"));
				qab.setId(rs.getString("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qab;
	}
	
	public void deleteQABoard(int qno) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from qa where qno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
