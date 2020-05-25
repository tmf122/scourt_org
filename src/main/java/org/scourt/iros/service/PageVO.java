package org.scourt.iros.service;

import org.scourt.iros.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PageVO {
	private static final Logger logger = LoggerFactory.getLogger(PageVO.class);
	//현재 페이지, 마지막 페이지
	int curPage, maxPage;
	
	//검색화면의 첫페이지, 마지막페이지
	int firstPage, lastPage;
	
	//검색어, 검색 옵션
	String keyword, option;
		
	//이전, 다음 버튼 활성화 여부
	boolean prev, next;
	
	//출력되는 목록의 갯수
	int listSize;
	//출력되는 페이지의 총 갯수
	int pageSize;
	
	public PageVO(){
		curPage=maxPage=firstPage=lastPage=1;
		option="name";
		keyword="";
		prev=next=false;
		listSize=pageSize=10;
		
		logger.debug("new PageVO, curpage : "+getCurPage()+", option : "+getOption()+", pageSize : "+getPageSize());
	}
	
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(String curPage) {
		if(curPage=="") {
			curPage="1";
		}
		this.curPage = Integer.parseInt(curPage);
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getListSize() {
		return listSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	
	public int getFirstList() {
		int result = (curPage-1) * (listSize);
		return result;
	}
	
	public int getLastList() {
		return curPage * listSize;
	}
	
	public int getFirstPage() {
		return firstPage;
	}
	
	public int getLastPage() {
		return lastPage;
	}
	public void setMaxPage(int resultCount) {
		maxPage = (int) Math.max(Math.ceil((double)resultCount/listSize), 1);
		pageSetting();
	}
	
	public int getMaxPage() {
		return this.maxPage;
	}
	
	public void pageSetting() {
//		firstPage = Math.max(curPage-(curPage%pageSize)+1, 1);
		firstPage = ((curPage - 1) / pageSize) * pageSize + 1;
		lastPage = Math.min(firstPage+pageSize-1, maxPage);
//		lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;
		prev = firstPage==1 ? false : true;
		next = lastPage==maxPage ? false : true;

//		logger.debug("pageVO maxPage : "+maxPage+" // firstPage : "+firstPage+" // curPage : "+curPage+" // lastPage : "+lastPage);
//		logger.debug("prev : "+prev+", next : "+next);
	}
	
	public boolean getPrev() {
		return this.prev;
	}
	
	public boolean getNext() {
		return this.next;
	}
	
}
