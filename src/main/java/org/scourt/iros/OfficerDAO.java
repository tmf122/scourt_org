package org.scourt.iros;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OfficerDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private static OfficerDAO instance;
	private static final Logger logger = LoggerFactory.getLogger(OfficerDAO.class);
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		logger.debug("DAO getConnecrion : START");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url ="jdbc:mysql://localhost:3306/scourt_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "3004");
			logger.debug("success");
			logger.debug("연결정보 : "+conn);
		}catch (ClassNotFoundException e) {
			logger.debug("드라이버 로딩 실패");
			e.printStackTrace();
		}
		logger.debug("DAO getConnecrion : END");
		return conn;
	}

	public boolean insert(OfficerVO vo) {
		logger.debug("DAO insert : START");
		String sql="";
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			
			// id name birthday rank office_number phone_number initday department
			// INSERT INTO scourt_db.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE ('조영래', '1992-10-19', '전산서기보', '02-3480-7664', '', '2020-04-01', '0');
			sql = "INSERT INTO scourt_db.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE (?, ?, ?, ?, ?, ?, ?);";
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getBirthday());
			pstmt.setString(3, vo.getRank());
			pstmt.setString(4, vo.getOfficeNum());
			pstmt.setString(5, vo.getPhoneNum());
			pstmt.setString(6, vo.getInitDay());
			pstmt.setString(7, vo.getDepartment());
			
			
			int count = pstmt.executeUpdate();
			
			result = (count == 1);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		logger.debug("삽입 여부 : "+result);
		logger.debug("DAO insert : END");
		return result;
	}
	
	public boolean update(OfficerVO vo) {
		logger.debug("DAO update : START");
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		
		if(vo.getId()==null || vo.getId()=="") {
			logger.debug("수정 여부 : "+false+"ID is null");
			logger.debug("DAO update : END");
			return false;
		}
		
		try {
			conn = getConnection();
			
			// id name birthday rank office_number phone_number initday department
			// INSERT INTO scourt_db.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE ('조영래', '1992-10-19', '전산서기보', '02-3480-7664', '', '2020-04-01', '0');
			sql = "UPDATE scourt_db.officer SET name = ?, birthday = ?, rank = ?, office_number = ?, phone_number = ?, initday = ?, department = ? WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getBirthday());
			pstmt.setString(3, vo.getRank());
			pstmt.setString(4, vo.getOfficeNum());
			pstmt.setString(5, vo.getPhoneNum());
			pstmt.setString(6, vo.getInitDay());
			pstmt.setString(7, vo.getDepartment());
			
			pstmt.setString(8, vo.getId());
			
			int count = pstmt.executeUpdate();
			
			result = (count == 1);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		logger.debug("수정 여부 : "+result);
		logger.debug("DAO update : END");
		return result;
	}
	
	public boolean search(OfficerVO vo, HashMap<String, Object> listOpt) {
		logger.debug("DAO search : START");
		boolean result = false;
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String opt = (String)listOpt.get("opt");
		String condition = (String)listOpt.get("condition");
		int start = (Integer)listOpt.get("start");
		
		try {
			conn = getConnection();
			
			// id name birthday rank office_number phone_number initday department
			// INSERT INTO scourt_db.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE ('조영래', '1992-10-19', '전산서기보', '02-3480-7664', '', '2020-04-01', '0');
									
			switch(opt) {
			case "0": //이름 검색
				sql += "select ROWNUM AS RNUM, o.name, o.birthday, o.initday, o.rank, d.name, d.location, o.office_number, o.phone_number ";
				sql += "from scourt_db.officer as o, scourt_db.department as d where o.department=d.id";
				sql += "where o.department=d.id and ";
				sql += "o.name like ?";
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, "%"+condition+"%");
				
				break;
			case "1": //직급 검색
				sql += "select o.name, o.birthday, o.initday, o.rank, d.name, d.location, o.office_number, o.phone_number ";
				sql += "from scourt_db.officer as o, scourt_db.department as d where o.department=d.id";
				sql += "where o.department=d.id and ";
				sql += "o.rank like ?";
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, "%"+condition+"%");
				break;
			case "2": //소속 검색
				sql += "select o.name, o.birthday, o.initday, o.rank, d.name, d.location, o.office_number, o.phone_number ";
				sql += "from scourt_db.officer as o, scourt_db.department as d where o.department=d.id";
				sql += "where o.department=d.id and ";
				sql += "d.name like ? or d.id like ?";
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, "%"+condition+"%");
				pstmt.setString(2, "%"+condition+"%");
				break;
			case "3": //전화번호
				sql += "select o.name, o.birthday, o.initday, o.rank, d.name, d.location, o.office_number, o.phone_number ";
				sql += "from scourt_db.officer as o, scourt_db.department as d where o.department=d.id";
				sql += "where o.department=d.id and ";
				sql += "o.office_number like ? or o.phone_number like ?;";
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, "%"+condition+"%");
				pstmt.setString(2, "%"+condition+"%");
				break;
			default : //그외
				break;
			}
			
			int count = pstmt.executeUpdate();
			logger.debug("DAO search : "+(opt.equals("0")?"이름":(opt.equals("1")?"직급":(opt.equals("2")?"소속":(opt.equals("3")?"전화번호":"??")))));
			result = (count == 1);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		logger.debug("DAO search : END");
		return result;
	}
	
	public boolean delete(OfficerVO vo) {
		logger.debug("DAO delete : START");
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		if(vo.getId()==null || vo.getId()=="") {
			logger.debug("DAO delete : ID is NULL");
			logger.debug("삭제 여부 : "+false);
			logger.debug("DAO delete : END");
			return false;
		}
		
		try {
			conn = getConnection();
			
			// id name birthday rank office_number phone_number initday department
			// INSERT INTO scourt_db.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE ('조영래', '1992-10-19', '전산서기보', '02-3480-7664', '', '2020-04-01', '0');
			String sql = "DELETE FROM scourt_db.officer WHERE id=?";
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getId());
			
			int count = pstmt.executeUpdate();
			
			result = (count == 1);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		logger.debug("삭제 여부 : "+result);
		logger.debug("DAO delete : END");
		return result;
	}
	
	public boolean select(OfficerVO vo) {
		logger.debug("DAO select : START");
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			// id name birthday rank office_number phone_number initday department
			// INSERT INTO scourt_db.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE ('조영래', '1992-10-19', '전산서기보', '02-3480-7664', '', '2020-04-01', '0');
			String sql = "select FROM scourt_db.officer WHERE id=?";
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getId());
			
			int count = pstmt.executeUpdate();
			
			result = (count == 1);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		logger.debug("조회 여부 : "+result);
		logger.debug("DAO select : END");
		return result;
	}
	
	private void close() {
		try {
			if (pstmt != null) { pstmt.close(); pstmt=null; }
			if (conn != null) {conn.close(); conn=null; }
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
}
