package org.scourt.iros.service;

import java.util.List;
import java.util.Map;

public interface OfficerService {

	public void insert(OfficerVO vo) throws Exception;
	public List<OfficerVO> selectAll() throws Exception;
	public void delete(int id) throws Exception;
    public void update(OfficerVO vo) throws Exception;
    public List<OfficerVO> search(PageVO param) throws Exception;
    public int searchOfficerCounter(PageVO param) throws Exception;
}
