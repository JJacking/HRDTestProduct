package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBPKG.DBManager;
import dto.MemberDto;
import dto.SalesDto;

public class MemberDao {
	
	private MemberDao() {}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	
	//데이터 저장 쿼리
	public void insertMember(MemberDto mto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "INSERT INTO member_tbl_02 VALUES(?,?,?,?,?,?,?)"; 
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, mto.getCustno());
			psmt.setString(2, mto.getCustname());
			psmt.setString(3, mto.getPhone());
			psmt.setString(4, mto.getAddress());
			psmt.setTimestamp(5, mto.getJoindate());
			psmt.setString(6, mto.getGrade());
			psmt.setString(7, mto.getCity());
			
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
			
		}finally {
			DBManager.close(conn, psmt);
		}
	}

	
	//custno 를 알아오기 위한 쿼리
	public int nextCustno() {
		
		int nextNum = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT member_seq.nextval FROM dual";
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				nextNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return nextNum;
	}
	
	//회원정보 불러오기
	public List<MemberDto> selectMemberList() {
		
		List<MemberDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member_tbl_02";
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getTimestamp("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
				
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		
		return list;
	}

	//매출 조회 
	public List<SalesDto> selectSales() {
		
		List<SalesDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT m1.custno, m1.custname, m1.grade, sum(m2.price) "
				+ " FROM member_tbl_02 m1 join money_tbl_02 m2 "
				+ " ON m1.custno = m2.custno "
				+ " GROUP BY (m1.custno, m1.custname, m1.grade) "
				+ " ORDER BY sum(m2.price) DESC";
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				SalesDto sto = new SalesDto();
				
				sto.setCustno(rs.getInt(1));
				sto.setCustname(rs.getString(2));
				sto.setGrade(rs.getString(3));
				sto.setSumsales(rs.getInt(4));
				
				list.add(sto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		
		
		return list;
	}

	public MemberDto selectMember(int custno) {
		MemberDto dto = new MemberDto(); //반환값
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member_tbl_02 WHERE custno=?";
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, custno); //?값 채워넣기
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getTimestamp("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		
		
		return dto;
	}

	public void updateMember(MemberDto mto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "UPDATE member_tbl_02 " + 
				" SET custname=?, phone=?, address=?, grade=?, city=?, joindate=? " + 
				" WHERE custno = ?";
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mto.getCustname());
			psmt.setString(2, mto.getPhone());
			psmt.setString(3, mto.getAddress());
			psmt.setString(4, mto.getGrade());
			psmt.setString(5, mto.getCity());
			psmt.setTimestamp(6, mto.getJoindate());
			psmt.setInt(7, mto.getCustno());
			
			
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
		
	}
}
