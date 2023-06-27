package com.membermanage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.naming.Context;

public class MemberDAO {

	private DataSource ds;
//	private String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink11.dbsvr";
//	private String uid = "scott";
//	private String upw = "tiger";

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
//			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	멤버 조회
	public ArrayList<MemberDTO> memberSelect() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn=ds.getConnection();
			stmt = conn.createStatement();
			query = "select * from USERS where authority='일반사용자'";
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String status = rs.getString("status");
				String authority = rs.getString("authority");

				MemberDTO dto = new MemberDTO(name, id, pw, phone, email, status, authority);
				dtos.add(dto);
			}
		} catch (Exception e) {

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return dtos;
	}

//	해당멤버 객체 반환
	public MemberDTO memberId(String id) {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		MemberDTO dto = null;

		try {
			conn=ds.getConnection();
			query = "select * from USERS where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String status = rs.getString("status");
				String authority = rs.getString("authority");

				dto = new MemberDTO(name, id,  pw, phone, email, status, authority);

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {

				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return dto;

		/*
		 * ArrayList<MemberDTO> dtos = this.memberSelect(); for (MemberDTO dto : dtos) {
		 * if (dto.getId().equals(id)) { return dto; } }
		 */

	}

//	회원정보수정
	public void memberUpdate(MemberDTO dto) {

		String name = dto.getName();
		String id = dto.getId();
		String pw = dto.getPw();
		String phone = dto.getPhone();
		String email = dto.getEmail();
		String status=dto.getStatus();
//		String authority = dto.getAuthority();


		query = "UPDATE USERS SET NAME=?,PW=?,PHONE=?,EMAIL=?,STATUS=? WHERE ID=?";

		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, pw);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, status);
			pstmt.setString(6, id);

			int iResult = pstmt.executeUpdate();

			if (iResult >= 1) {
				System.out.println("update success");
			} else {
//				System.out.println("update fail");
			}

		} catch (Exception e) {

		} finally {
			try {

				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

//	회원정보등록
	public void memberInsert(MemberDTO dto) {

		String name = dto.getName();
		String id = dto.getId();
		String pw = dto.getPw();
		String phone = dto.getPhone();
		String email = dto.getEmail();
		String status = dto.getStatus();
		String authority="일반사용자";
		
		query = "INSERT INTO USERS(NAME,ID,PW,PHONE,EMAIL,STATUS,AUTHORITY) VALUES(?,?,?,?,?,?,?)";


		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, status);
			pstmt.setString(7, authority);

			int iResult = pstmt.executeUpdate();

			if (iResult >= 1) {
				System.out.println("insert success");
			} else {
				System.out.println("insert fail");

			}
		} catch (SQLException e) {

			e.printStackTrace();

		} catch (Exception e) {

		} finally {
			try {

				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
	
	// 회원탈퇴
	public void memberDelete(String id) {
		
		query = "DELETE FROM USERS WHERE ID=?";

		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			int iResult = pstmt.executeUpdate();

			if (iResult >= 1) {
				System.out.println("delete success");
			} else {
				System.out.println("delete fail");

			}
		} catch (SQLException e) {
//			System.out.println("해당 아이디는 중복아이디입니다.");

			e.printStackTrace();

		} catch (Exception e) {

		} finally {
			try {

				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
