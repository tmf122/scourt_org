/**
 * 
 */
/**
 * @author yskim122
 *
 */
package org.scourt.iros.dao;

import java.util.List;
import java.util.Map;

import org.scourt.iros.service.OfficerVO;
import org.scourt.iros.service.PageVO;

public interface OfficerDAO {
    public void insert(OfficerVO vo) throws Exception;
    public List<OfficerVO> selectAll() throws Exception;
    public void delete(int id) throws Exception;
    public void update(OfficerVO vo) throws Exception;
    public List<OfficerVO> search(PageVO param) throws Exception;
    public int searchOfficerCounter(PageVO param) throws Exception;
}

