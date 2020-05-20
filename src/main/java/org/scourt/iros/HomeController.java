package org.scourt.iros;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.scourt.iros.service.OfficerService;
import org.scourt.iros.service.OfficerVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

		try {
			List<OfficerVO> list = service.selectAll();
			model.addAttribute("resultList",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home";
	}
}
