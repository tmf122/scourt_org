package org.scourt.iros;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class sorgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		if(("home.jsp").equals(actionName)) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/home.jsp");
			rd.forward(request, response);
		}
		else if ("add".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			dao.insert(vo);
		}
		else if ("delete".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			dao.delete(vo);
		}
		else if ("update".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			dao.update(vo);
		}
		else if ("search".equals(actionName)) {
			OfficerDAO dao = new OfficerDAO();
			HashMap hash = new HashMap<String, Object>();
			
			hash.put("opt", request.getParameter("option"));
			dao.search(vo, hash);
		}
		
	}
}
