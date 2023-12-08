package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//회원 목록 조회
	public List<Member> getMemberList(){
		List<Member> memberList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM member ORDER BY id";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setUid(rs.getString("uid"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setJoinDate(rs.getTimestamp("joinDate"));
				m.setZip_code(rs.getInt("zip_code"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailAdress"));
				
				memberList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	public void insertMember(Member m) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO member(uid, passwd, name, email, phone, zip_code, address, detailaddress) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUid());
			pstmt.setString(2, m.getPasswd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setInt(6, m.getZip_code());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getDetailaddress());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	public Member getMember(String uid) {
		Member m = new Member();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM member WHERE uid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m.setUid(rs.getString("uid"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setJoinDate(rs.getTimestamp("joinDate"));
				m.setZip_code(rs.getInt("zip_code"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailAdress"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return m;
	}
	
	
}
