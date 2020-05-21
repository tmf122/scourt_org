package org.scourt.iros;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.scourt.iros.service.OfficerService;
import org.scourt.iros.service.OfficerVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private OfficerService service;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.debug("====>home");
//		DepartmentVO department = (DepartmentVO) model.getAttribute("_USER_");


		try {
			List<OfficerVO> list = service.selectAll();
			model.addAttribute("resultList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home";
	}
	
	@RequestMapping(value = "/sorgAdd", method = RequestMethod.POST)
	public void addOfficer(OfficerVO officer) {
		logger.debug("===>addOfficer");
		logger.debug(officer.toString());
		try {
			service.insert(officer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}
	
	@RequestMapping(value = "/sorgModify", method = RequestMethod.POST)
	public void modifyOfficer(OfficerVO officer) {
		logger.debug("===>modifyOfficer");
		logger.debug(officer.toString());
		try {
			service.update(officer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}

	@RequestMapping(value = "/sorgDelete", method = RequestMethod.POST)
	public void modifyOfficer(int id) {
		logger.debug("===>modifyOfficer");
		logger.debug("officer id : "+id);
		try {
			service.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}
}
