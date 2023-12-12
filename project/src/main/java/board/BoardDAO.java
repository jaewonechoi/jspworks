package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//회원 목록 조회
		public List<Board> BoardList(){
			List<Board> boardList = new ArrayList<>();
			
			try {
				conn = JDBCUtil.getConnection();
				String sql = "SELECT * FROM board ORDER BY bno";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Board b = new Board();
					b.setBno(rs.getInt("bno"));
					b.setBtitle(rs.getString("btitle"));
					b.setBcontent(rs.getString("bcontent"));
					b.setCreatedate(rs.getTimestamp("createdate"));
					b.setBupdate(rs.getTimestamp("bupdate"));
					b.setUid(rs.getString("uid"));
					
					boardList.add(b);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
			return boardList;
		}
		
		public void write() {
			conn = JDBCUtil.getConnection();
			String sql = "";
		}
}
