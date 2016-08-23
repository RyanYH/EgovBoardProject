package egovframework.com.bbs.service;

import java.util.List;
import java.util.Map;

public interface bbsService {

	public List<bbsVO> boardListData(Map map) throws Exception;
	
	public int boardTotalPage(bbsVO vo) throws Exception;
	
	public void boardInsert(bbsVO vo) throws Exception;
	
	public void boardIncrment(bbsVO vo) throws Exception;
	
	public List<bbsVO> boardSearchData(String searchKeyword) throws Exception;
	
	public bbsVO boardContentData(bbsVO vo) throws Exception;
	
	public bbsVO replyParentData(int no) throws Exception;
	
	public void replyGroupStepIncrment(bbsVO vo) throws Exception;
	
	public void replyInsert(bbsVO vo) throws Exception;
	
	public void replyDepthIncrement(int no) throws Exception;
	
	public void boardContentUpdate(bbsVO vo) throws Exception;
	
	public void boardDeleteData(int no) throws Exception;

	public int  selectbbsListTotCnt(bbsDefaultVO searchVO) throws Exception;
	
	public int  selectbbsTotCnt(bbsDefaultVO searchVO) throws Exception;
}
