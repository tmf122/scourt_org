package org.scourt.iros;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/sorg")
public class sorgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(sorgServlet.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("sorgServlet, doGet : START");
		request.setCharacterEncoding("utf-8");
		String searchOption = request.getParameter("option");
		String searchPage = request.getParameter("page");
		String searchKeyword = request.getParameter("keyword");
		
		logger.debug("search option : "+searchOption+", page : "+searchPage+", keyword : "+searchKeyword);
	
		new OfficerDAO().search(searchOption, searchPage, searchKeyword);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("sorgServlet, doPost : START");
		request.setCharacterEncoding("utf-8");
		
		OfficerVO vo = new OfficerVO();
		
		String actionName = request.getParameter("a");

		// id name birthday rank office_number phone_number initday department
		// INSERT INTO scourt_org.officer (name, birthday, rank, office_number, phone_number, initday, department) VALUE ('조영래', '1992-10-19', '전산서기보', '02-3480-7664', '', '2020-04-01', '0');
				
		vo.setName(request.getParameter("name"));
		vo.setBirthday(request.getParameter("birthday"));
		vo.setRank(request.getParameter("rank"));
		vo.setOfficeNum(request.getParameter("office_number"));
		vo.setPhoneNum(request.getParameter("phone_number"));
		vo.setInitDay(request.getParameter("initday"));
		vo.setDepartment(request.getParameter("department"));
		vo.setId(request.getParameter("id"));
		logger.debug("actionName : "+actionName);
		OfficerDAO dao = new OfficerDAO();
		
		if(("home.jsp").equals(actionName)) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/home.jsp");
			rd.forward(request, response);
		}
		else if ("add".equals(actionName)) {
			logger.debug("sorgServlet : add");
			dao.insert(vo);
		}
		else if ("delete".equals(actionName)) {
			logger.debug("sorgServlet : delete");
			dao.delete(vo);
		}
		else if ("modify".equals(actionName)) {
			logger.debug("sorgServlet : update");
			dao.update(vo);
		}
		
		logger.debug("이름 : "+vo.getName()+", 생일 : "+vo.getBirthday()+", 직급 : "+vo.getRank()+"!!, ID : "+vo.getId());
		logger.debug("sorgServlet : END");
	}
}
