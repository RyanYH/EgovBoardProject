package egovframework.com.bbs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.stereotype.Controller;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.bbs.service.*;
import egovframework.com.bbs.service.impl.bbsDAO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class bbsController {
	@Resource(name="bbsService")
	private bbsService bbsService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@IncludedInfo(name = "SpringBoard", listUrl = "/bbs/list.do", order = 11, gid = 10)
	@RequestMapping("/bbs/list.do")
	public String board_list(@ModelAttribute("SearchVO") bbsDefaultVO searchVO, ModelMap model, bbsVO vo, 
			                     String page,HttpServletRequest request) throws Exception
	{	
	  /*searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
     	paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);*/
		//request.getSession().setAttribute("loginVO",loginVO);
		
		System.out.println("***************bbsList Controller 입니다.*************");
		int totCnt = bbsService.selectbbsListTotCnt(searchVO);
		int rowSize=8;
		int totalpage = (int)(Math.ceil(totCnt/8.0));
		
		model.addAttribute("totalpage",totalpage);
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
	
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end);
		
		model.addAttribute("curpage", curpage);
		
		model.addAttribute("bbsList",bbsService.boardListData(map));
				
		List<?> List=bbsService.boardSearchData(vo.getSearchKeyword());
		model.addAttribute("resultList",List);
		
		System.out.println("vo.Keyword : "+"/"+vo.getSearchKeyword());
		return "egovframework/com/bbs/list";
	}
	
	@RequestMapping("/bbs/content.do")
	public String board_content(ModelMap model,bbsVO vo) throws Exception
	{
		model.addAttribute("bbs", bbsService.boardContentData(vo));
		
		bbsService.boardIncrment(vo);
		System.out.println("vo.no:"+vo.getNo()+", vo.keyword:"+vo.getSearchKeyword());
		return "egovframework/com/bbs/content";
	}
	@RequestMapping("/bbs/insert.do")
	public String board_insert()
	{
		return "egovframework/com/bbs/insert";
	}
	
	@RequestMapping("/bbs/insert_ok.do")
	public String board_insertok(@ModelAttribute("SearchVO") bbsDefaultVO searchVO, ModelMap model, bbsVO vo) throws Exception
	{
		bbsService.boardInsert(vo);
		//String no = vo.getNo();
		model.addAttribute("msg", "정상적으로 등록 되었습니다.");
		
		
		int totCnt = bbsService.selectbbsTotCnt(searchVO);
		vo.setNo(String.valueOf(totCnt));
		model.addAttribute("bbs", bbsService.boardContentData(vo));
		System.out.println("vo.getNo() : "+vo.getNo());
		return "egovframework/com/bbs/content"; 
	}
	
	@RequestMapping("/bbs/search.do")
	public String board_searchList(ModelMap model, String searchKeyword, String page, bbsVO vo) throws Exception
	{
		model.addAttribute("resultList",bbsService.boardSearchData(searchKeyword));
		model.addAttribute("curpage",page);
		System.out.println("vo.Keyword : "+searchKeyword+"☆"+vo.getSearchKeyword());
		return "egovframework/com/bbs/list";
	}
	
	@RequestMapping("/bbs/update.do")
	public String board_update(ModelMap model, bbsVO vo) throws Exception
	{
		model.addAttribute("bbs", bbsService.boardContentData(vo));
		return "egovframework/com/bbs/update";
	}
	@RequestMapping("/bbs/update_ok.do")
	public String board_updateok(ModelMap model, bbsVO vo, int no) throws Exception
	{	
		bbsService.boardContentUpdate(vo);
		model.addAttribute("msg", "정상적으로 수정되었습니다.");
		model.addAttribute("bbs", bbsService.boardContentData(vo));
		return "egovframework/com/bbs/content";
	}
	@RequestMapping("/bbs/delete.do")
	public String board_delete(ModelMap model,int no) throws Exception
	{
		bbsService.boardDeleteData(no);
		model.addAttribute("msg", "삭제되었습니다.");
		model.addAttribute("url","list.do");
		return "egovframework/com/bbs/alert";
	}
}
