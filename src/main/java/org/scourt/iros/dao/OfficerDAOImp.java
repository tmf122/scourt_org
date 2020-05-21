package org.scourt.iros.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.scourt.iros.service.OfficerVO;
import org.springframework.stereotype.Repository;

@Repository 
public class OfficerDAOImp implements OfficerDAO {

	@Inject 
	private SqlSession sqlSession;
	// memberMapper.xml의 namespace값
	private static final String namespace = "org.scourt.iros.mapper.MemberMapper";

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
	public List<OfficerVO> search(Map<String, String> param) throws Exception {		
		System.out.print(param);
		List<OfficerVO> officerList = sqlSession.selectList(namespace + ".searchOfficer", param);
		
		return officerList;
	}

}
