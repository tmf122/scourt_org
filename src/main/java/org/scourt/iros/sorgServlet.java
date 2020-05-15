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
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("sorgServlet : START");
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
		
		if(("home.jsp").equals(actionName)) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/home.jsp");
			rd.forward(request, response);
		}
		else if ("add".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			dao.insert(vo);
			logger.debug("sorgServlet : add");
		}
		else if ("delete".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			dao.delete(vo);
			logger.debug("sorgServlet : delete");
		}
		else if ("update".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			dao.update(vo);
			logger.debug("sorgServlet : update");
		}
		else if ("search".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			HashMap hash = new HashMap<String, Object>();
			
			hash.put("opt", request.getParameter("option"));
			dao.search(vo, hash);
			logger.debug("sorgServlet : search");
		}
		
		logger.debug("이름 : "+vo.getName()+", 생일 : "+vo.getBirthday()+", 직급 : "+vo.getRank()+"!!, ID : "+vo.getId());
		logger.debug("sorgServlet : END");
	}
}
