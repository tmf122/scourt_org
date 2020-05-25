package org.scourt.iros;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.scourt.iros.service.OfficerService;
import org.scourt.iros.service.OfficerVO;
import org.scourt.iros.service.PageVO;
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

	//페이징을 위한 모델
	PageVO pageVO;
	
	//검색 SQL문 실행결과 ROW 리스트.
	List<OfficerVO> searchList = null;
	
	// 검색 SQL문 실행결과의 총 ROW 수
	int searchCounter=0;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		logger.debug("HomeController - Home : START");
		if (searchList == null) {
			try {
				pageVO = new PageVO();
				searchList = service.search(pageVO);
				searchCounter = service.searchOfficerCounter(pageVO);
				pageVO.setMaxPage(searchCounter);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		logger.debug("HomeController - home, GET Parameter - option : " + pageVO.getOption() + ", keyword : " + pageVO.getKeyword()+ ", page : " + pageVO.getCurPage());
		logger.debug("home - pageVO maxPage : "+pageVO.getMaxPage()+" // firstPage : "+pageVO.getFirstPage()+" // curPage : "+pageVO.getCurPage()+" // lastPage : "+pageVO.getLastPage());
		logger.debug("prev : "+pageVO.getPrev()+", next : "+pageVO.getNext());
		
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", searchCounter);
		searchList = null;
		logger.debug("HomeController - Home : END");
		return "home";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, HttpServletRequest httpServletRequest) {
		pageVO.setOption(httpServletRequest.getParameter("option"));
		pageVO.setKeyword(httpServletRequest.getParameter("keyword"));
		pageVO.setCurPage(httpServletRequest.getParameter("page"));
		
		logger.debug("HomeController - search : START");
		try {
			searchList = service.search(pageVO);
			searchCounter = service.searchOfficerCounter(pageVO);
			logger.debug("HomeController - search, GET Parameter - option : " + pageVO.getOption() + ", keyword : " + pageVO.getKeyword()+ ", page : " + pageVO.getCurPage());
			logger.debug("search - pageVO maxPage : "+pageVO.getMaxPage()+" // firstPage : "+pageVO.getFirstPage()+" // curPage : "+pageVO.getCurPage()+" // lastPage : "+pageVO.getLastPage());
			logger.debug("prev : "+pageVO.getPrev()+", next : "+pageVO.getNext());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		pageVO.setMaxPage(searchCounter);
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", searchCounter);
		
		logger.debug("HomeController - search : END");
		return "/ScourtOrg/search";
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
		logger.debug("officer id : " + id);
		try {
			service.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return;
	}
}
