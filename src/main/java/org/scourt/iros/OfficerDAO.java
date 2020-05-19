package org.scourt.iros;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

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
			sql = "INSERT INTO scourt_db.officer (name, birthday, rank, location, office_number, phone_number, initday, department) VALUE (?, ?, ?, ?, ?, ?, ?, ?);";
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getBirthday());
			pstmt.setString(3, vo.getRank());
			pstmt.setString(4, vo.getLocation());
			pstmt.setString(5, vo.getOfficeNum());
			pstmt.setString(6, vo.getPhoneNum());
			pstmt.setString(7, vo.getInitDay());
			pstmt.setString(8, vo.getDepartment());
			
			
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
			sql = "UPDATE scourt_db.officer SET name = ?, birthday = ?, rank = ?, location = ?, office_number = ?, phone_number = ?, initday = ?, department = ? WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getBirthday());
			pstmt.setString(3, vo.getRank());
			pstmt.setString(4, vo.getRank());
			pstmt.setString(5, vo.getOfficeNum());
			pstmt.setString(6, vo.getPhoneNum());
			pstmt.setString(7, vo.getInitDay());
			pstmt.setString(8, vo.getDepartment());
			
			pstmt.setString(9, vo.getId());
			
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
	
	public boolean search(String option, String page, String keyword, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("DAO search : START");
		boolean result = false;
		StringBuffer sql = new StringBuffer();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int listNum = 10;
		ArrayList<OfficerVO> offList = new ArrayList<OfficerVO>();
							
		try {
			conn = getConnection();
			int pageNum = Integer.parseInt(page.toString());
			int startNum = (pageNum-1)*listNum+1;
			logger.debug("startNum : "+startNum);
			//search 공통 쿼리
			sql.append("SELECT o.name, o.birthday, o.initday, o.rank, d.name, o.location, o.office_number, o.phone_number, o.id "); 
			sql.append("from scourt_db.officer as o, scourt_db.department as d "); 
			sql.append("where o.department = d.id and ");			
			
			logger.debug(option+" 검색");
			
			switch(option) {
			case "name": //이름 검색
				sql.append("o.name like ? ");
				sql.append("limit ?, ?;");				
				
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startNum-1);
				pstmt.setInt(3, listNum);
				
				break;
			case "rank": //직급 검색
				sql.append("o.rank like ? ");
				sql.append("limit ?, ?;");
				
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startNum-1);
				pstmt.setInt(3, listNum);
				break;
			case "department": //소속 검색
				sql.append("d.name like ? or d.id like ? ");
				sql.append("limit ?, ?;");
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, startNum-1);
				pstmt.setInt(4, listNum);
				break;
			case "number": //전화번호
				sql.append("o.office_number like ? or o.phone_number like ? ");
				sql.append("limit ?, ?;");
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, startNum-1);
				pstmt.setInt(4, listNum);
				break;
			default : //그외
				break;
			}
			logger.debug("DAO search : "+option);
			logger.debug("SQL 전문 : "+sql);
						
			rs = pstmt.executeQuery();
			logger.debug(""+rs);
			while(rs.next()) {
				//TODO offList에 담아서 리퀘스트 변수에 담아서 jsp페이지에 포워드 https://ppt21.com/qna/97805 참조.
				OfficerVO rsvo = new OfficerVO();
				rsvo.setName(rs.getString("o.name"));
				rsvo.setBirthday(rs.getString("o.birthday"));
				rsvo.setRank(rs.getString("o.rank"));
				rsvo.setLocation(rs.getString("o.location"));
				rsvo.setOfficeNum(rs.getString("o.office_number"));
				rsvo.setPhoneNum(rs.getString("o.phone_number"));
				rsvo.setInitDay(rs.getString("o.initday"));
				rsvo.setDepartment(rs.getString("d.name"));
				rsvo.setId(rs.getString("o.id"));
				
				offList.add(rsvo);
				logger.debug("조회된 이름 : "+rsvo.getName());
				logger.debug("조회된 id : "+rsvo.getId());
			}
			response.setContentType("text/html; charset=EUC-KR");
			request.setCharacterEncoding("EUC-KR");
			
			request.setAttribute("officer", offList);
			RequestDispatcher rd = request.getRequestDispatcher("/home");
			rd.include(request, response);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		logger.debug("offList 갯수 : "+offList.size());
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
