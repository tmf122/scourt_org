package org.scourt.iros.service;

import java.util.List;

import javax.inject.Inject;

import org.scourt.iros.dao.OfficerDAO;
import org.springframework.stereotype.Service;

@Service
public class OfficerServiceImpl implements OfficerService {
 
    @Inject
    private OfficerDAO dao;
    

    @Override
    public List<OfficerVO> selectAll() throws Exception {
        return dao.selectAll();
    }

	@Override
	public void insert(OfficerVO vo) throws Exception {
		dao.insert(vo);
		return;
	}

	@Override
	public void delete(int id) throws Exception {
		dao.delete(id);
		return;
	}

	@Override
	public void update(OfficerVO vo) throws Exception {
		dao.insert(vo);
		return;
	}
 
}