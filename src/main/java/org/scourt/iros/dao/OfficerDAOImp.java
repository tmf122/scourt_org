package org.scourt.iros.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.scourt.iros.service.OfficerServiceImpl;
import org.scourt.iros.service.OfficerVO;
import org.scourt.iros.service.PageVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository 
public class OfficerDAOImp implements OfficerDAO {
	private static final Logger logger = LoggerFactory.getLogger(OfficerDAOImp.class);

	@Inject 
	private SqlSession sqlSession;
	// memberMapper.xml의 namespace값
	private static final String namespace = "org.scourt.iros.mapper.OfficerMapper";

	@Override
	public List<OfficerVO> selectAll() throws Exception {
		List<OfficerVO> officerList = sqlSession.selectList(namespace + ".selectOfficer");
		return officerList;
	}

	@Override
	public void insert(OfficerVO vo) throws Exception {
		sqlSession.insert(namespace + ".insertOfficer", vo);
	}

	@Override
	public void delete(int id) throws Exception {
		sqlSession.delete(namespace + ".deleteOfficer", id);
	}

	@Override
	public void update(OfficerVO vo) throws Exception {
		sqlSession.update(namespace + ".updateOfficer", vo);
	}
	
	@Override
	public List<OfficerVO> search(PageVO param) throws Exception {		
		List<OfficerVO> officerList = sqlSession.selectList(namespace + ".searchOfficer", param);
		
		return officerList;
	}
	
	@Override
	public int searchOfficerCounter(PageVO param) throws Exception {		
		return sqlSession.selectOne(namespace + ".searchOfficerCounter", param);
	}
}
