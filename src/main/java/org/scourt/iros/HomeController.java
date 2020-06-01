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
	boolean changed=false;
	
	// 검색 SQL문 실행결과의 총 ROW 수
	int searchCounter=0;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		logger.debug("HomeController - Home : START");
		logger.warn("HomeController - Home : searchList is null ? "+ (searchList==null ? "null" : "not null"));
		logger.warn("HomeController - Home : changed is true ? "+ (changed==false ? "false" : "true"));
		if (searchList == null) {
			try {
				logger.debug("HomeController - Home : 첫화면 검색");
				if(changed==false) {
					pageVO = new PageVO();
				}
				searchList = service.search(pageVO);
				searchCounter = service.searchOfficerCounter(pageVO);
				pageVO.setMaxPage(searchCounter);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		logger.debug("HomeController - home, GET Parameter - option : " + pageVO.getOption() + ", keyword : " + pageVO.getKeyword()+ ", curPage : " + pageVO.getCurPage());
		logger.debug("HomeController - Home : pageVO maxPage : "+pageVO.getMaxPage()+" // firstPage : "+pageVO.getFirstPage()+" // lastPage : "+pageVO.getLastPage());
		logger.warn("HomeController - Home : prev : "+pageVO.getPrev()+", next : "+pageVO.getNext());
		
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", searchCounter);
		
		searchList = null;
		changed=false;

		logger.warn("HomeController - Home : searchList is null ? "+ (searchList==null ? "null" : "not null"));
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
			logger.debug("HomeController - search : GET Parameter - option : " + pageVO.getOption() + ", keyword : " + pageVO.getKeyword()+" // curPage : "+pageVO.getCurPage());
			logger.debug("HomeController - search : pageVO maxPage : "+pageVO.getMaxPage()+" // firstPage : "+pageVO.getFirstPage()+" // lastPage : "+pageVO.getLastPage());
			logger.debug("HomeController - search : prev : "+pageVO.getPrev()+", next : "+pageVO.getNext());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		pageVO.setMaxPage(searchCounter);
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", searchCounter);
		logger.warn("HomeController - search : searchList is null ? "+ (searchList==null ? "null" : "not null"));
		logger.debug("HomeController - search : END");
		return "/ScourtOrg/search";
	}

	@RequestMapping(value = "/sorgAdd", method = RequestMethod.POST)
	public String addOfficer(Model model, OfficerVO officer) {
		logger.debug("HomeController - add : START");
		logger.warn(officer.toString());
		try {
			service.insert(officer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", ++searchCounter);
		if((searchCounter%pageVO.getPageSize())==1 && searchCounter > pageVO.getListSize()&& pageVO.getCurPage()==pageVO.getMaxPage()) {
			//마지막 페이지에서 직원 추가 시, 마지막 페이지로 이동.
			pageVO.setCurPage(String.valueOf(pageVO.getCurPage()+1));
		}
		
		logger.warn("HomeController - add : searchList is null ? "+ (searchList==null ? "null" : "not null"));
		logger.debug("HomeController - add : END");
		changed=true;
		return "/ScourtOrg/search";
	}

	@RequestMapping(value = "/sorgModify", method = RequestMethod.POST)
	public String  modifyOfficer(Model model, OfficerVO officer) {
		logger.debug("HomeController - modify : START");
		logger.warn(officer.toString());
		try {
			service.update(officer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", searchCounter);
		logger.warn("HomeController - modify : searchList is null ? "+ (searchList==null ? "null" : "not null"));
		logger.debug("HomeController - modify : END");
		changed=true;
		return "/ScourtOrg/search";
	}

	@RequestMapping(value = "/sorgDelete", method = RequestMethod.POST)
	public String deleteOfficer(Model model, int id) {
		logger.debug("HomeController - delete : START");
		logger.debug("HomeController - delete : officer id - " + id);
		try {
			service.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("resultList", searchList);
		model.addAttribute("totalCount", --searchCounter);
		if(searchCounter%pageVO.getPageSize()==0 && searchCounter+1 > pageVO.getPageSize() && pageVO.getCurPage()==pageVO.getMaxPage()) {
			//마지막 페이지, 마지막 1요소를 삭제하여 0요소가 될 경우 이전페이지로 이동.
			pageVO.setCurPage(String.valueOf(pageVO.getCurPage()-1));
		}
		model.addAttribute("pageVO",pageVO);
		logger.warn("HomeController - delete : searchList is null ? "+ (searchList==null ? "null" : "not null"));
		logger.debug("HomeController - delete : END");
		changed=true;
		return "/ScourtOrg/search";
	}
}
