package egovframework.com.bbs.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.bbs.service.bbsDefaultVO;
import egovframework.com.bbs.service.bbsVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


@Repository("bbsDAO")
public class bbsDAO extends EgovComAbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<bbsVO> boardListData(Map map)
	{
		return (List<bbsVO>)list("bbsDAO.boardListData",map);
	}
	public void boardInsert(bbsVO vo)
	{
		insert("bbsDAO.boardInsert",vo);
	}
	public bbsVO boardContentData(bbsVO vo)
	{
		return (bbsVO)select("bbsDAO.boardContentData",vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<bbsVO> boardSearchData(String searchKeyword)
	{
		return (List<bbsVO>)list("bbsDAO.boardSearchData",searchKeyword);
	}
	
	public void boardContentUpdate(bbsVO vo)
	{
		//void
		update("bbsDAO.boardContentUpdate",vo);
		//return (int)update("bbsDAO.boardContentUpdate",vo);
	}
	public void boardDeleteData(int no)
	{
		delete("bbsDAO.baordDeleteData",no);
	}
	public void boardIncrment(bbsVO vo)
	{
		update("bbsDAO.boardIncrment",vo);
	}
	public int boardTotalPage(bbsVO vo)
	{
		return (Integer)select("boardTotalPage",vo);
	}
	public int selectbbsListTotCnt(bbsDefaultVO searchVO) {
		return (Integer) select("bbsDAO.selectbbsListTotCnt", searchVO);
	}
	public int selectbbsTotCnt(bbsDefaultVO searchVO) {
		return (Integer) select("bbsDAO.selectbbsTotCnt", searchVO);
	}
}
