package org.scourt.iros;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.scourt.iros.service.OfficerService;
import org.scourt.iros.service.OfficerVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private OfficerService service;

	List<OfficerVO> searchList = null;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		logger.debug("====>home");

		
		if(searchList == null) {
			try {
				List<OfficerVO> list = service.selectAll();
				model.addAttribute("resultList", list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				model.addAttribute("resultList", searchList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		
		}		
		searchList = null;

		return "home";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, HttpServletRequest httpServletRequest) {
		String option = httpServletRequest.getParameter("option");
		String keyword = httpServletRequest.getParameter("keyword");
		
		Map<String, String> param = new HashMap<>();
		
		param.put("option",option);
		param.put("keyword",keyword);
		
		try {
			searchList = service.search(param);
			//model.addAttribute("resultList", searchList);
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
	public void deleteOfficer(int id) {
		logger.debug("===>deleteOfficer");
		logger.debug("officer id : "+id);
		try {
			service.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}
}
