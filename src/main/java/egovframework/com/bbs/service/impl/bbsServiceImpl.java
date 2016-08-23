package egovframework.com.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.bbs.service.bbsDefaultVO;
import egovframework.com.bbs.service.bbsService;
import egovframework.com.bbs.service.bbsVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bbsService")
public class bbsServiceImpl extends EgovAbstractServiceImpl implements bbsService{

	@Resource(name="bbsDAO")
	private bbsDAO bbsDAO;

	@Override
	public List<bbsVO> boardListData(Map map) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.boardListData(map);
	}

	@Override
	public int boardTotalPage(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.boardTotalPage(vo);
	}

	@Override
	public void boardInsert(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
		bbsDAO.boardInsert(vo);
	}

	@Override
	public bbsVO boardContentData(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.boardContentData(vo);
	}

	@Override
	public bbsVO replyParentData(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void replyGroupStepIncrment(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void replyInsert(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void replyDepthIncrement(int no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardContentUpdate(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
	     bbsDAO.boardContentUpdate(vo);
	}

	@Override
	public List<bbsVO> boardSearchData(String searchKeyword) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.boardSearchData(searchKeyword);
	}

	@Override
	public void boardDeleteData(int no) throws Exception {
		// TODO Auto-generated method stub
		bbsDAO.boardDeleteData(no);
	}

	@Override
	public void boardIncrment(bbsVO vo) throws Exception {
		// TODO Auto-generated method stub
		bbsDAO.boardIncrment(vo);	
	}

	@Override
	public int selectbbsListTotCnt(bbsDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.selectbbsListTotCnt(searchVO);
	}

	@Override
	public int selectbbsTotCnt(bbsDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.selectbbsTotCnt(searchVO);
	}

}
