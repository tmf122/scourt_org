package org.scourt.iros.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.scourt.iros.dao.OfficerDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class OfficerServiceImpl implements OfficerService {
	private static final Logger logger = LoggerFactory.getLogger(OfficerServiceImpl.class);
	
    @Inject
    private OfficerDAO dao;
    

    @Override
    public List<OfficerVO> selectAll() throws Exception {
    	logger.debug("OfficerServiceImpl : selectAll");
        return dao.selectAll();
    }

	@Override
	public void insert(OfficerVO vo) throws Exception {
		logger.debug("OfficerServiceImpl : insert");
		dao.insert(vo);
		return;
	}

	@Override
	public void delete(int id) throws Exception {
		logger.debug("OfficerServiceImpl : delete");
		dao.delete(id);
		return;
	}

	@Override
	public void update(OfficerVO vo) throws Exception {
		logger.debug("OfficerServiceImpl : update");
		dao.update(vo);
		return;
	}

	@Override
	public List<OfficerVO> search(Map<String, String> param) throws Exception {
        return dao.search(param);
	}
 
}