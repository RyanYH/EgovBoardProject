<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script language = "javascript">  // 자바 스크립트 시작s
    function tr_content(no)
	{
		 var form = document.listfrm;
		 form.no.value=no;
	     form.action = "<c:url value='/bbs/content.do'/>";	
         form.submit();
	}
	
    function tr_search(keyword)
	{
 		 var form = document.listfrm;
 		 if(!form.searchKeyword.value)
 		 {	 
 	 		 alert('검색어를 입력하세요.'); return;
 		 }
		 form.searchKeyword=keyword;
		 //form.page=1;
		 form.action ="<c:url value='/bbs/list.do'/>";
		 //form.action ='list.do';
		 form.submit();
	} 
	
	function pageCheck(page)
	{
		var form = document.listfrm;
		if(form.page.value==1)
		{
			alert('가장 첫 번째 페이지 입니다.');
			return;
		}
		else
		{
			form.page.value = ${curpage-1};
			form.action="<c:url value='/bbs/list.do'/>";
			form.submit();
		}
	}
	function nextpageCheck()
	{
	     var form = document.listfrm;
	     if(form.page.value=='${totalpage }')
	     {
		     alert('가장 마지막 페이지 입니다.');
		     return;
	     }
	     else
		 {
	    	 	form.page.value = ${curpage+1};
				form.action="<c:url value='/bbs/list.do'/>";
				form.submit();
		 }    
	}
	function tr_insert()
	{
		var form = document.listfrm;
		form.action="<c:url value='/bbs/insert.do'/>";
		form.submit();

	}
</script>
<link href="<c:url value='/css/egovframework/com/com.css' />"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />"
	rel="stylesheet" type="text/css">
</head>
<body>

<DIV id="content" style="display">
<form method="post" id="frd" name="listfrm">
  <c:if test="${empty loginVO.id }">
  	<script type="text/javascript">
		alert('로그인 하세요.');
		location.href='/Component_v02/uat/uia/egovLoginUsr.do';
  	</script>
  </c:if>
  <input type="hidden" name="no" />
  <input type="hidden" name="page" value='${curpage }' />
	<c:if test="${!empty loginVO.id}">
		${loginVO.name }님 환영합니다. <a href="/Component_v02/uat/uia/actionLogout.do">로그아웃</a>
	</c:if>
	<table width="700" cellpadding="8" class="table-search" border="0">
		<tr>
			<td width="30%" class="title_left">
			<h1 class="title_left">
					<img
						src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"
						width="16" height="16" hspace="3" style="vertical-align: middle"
						alt="제목아이콘이미지">&nbsp;Spring Board  
				</h1>
			</td>
			<th></th>
			<td width="25%">
			<c:if test="${empty param.searchKeyword}">
				제목으로 조회하기 	
			</c:if>
		    <c:if test="${!empty param.searchKeyword}">
			    ${param.searchKeyword } 검색결과
			</c:if>
			</td>
			<td width="35%">
			  <input type="text" name=searchKeyword size="35" id="subject" maxlength="35" value="${param.searchKeyword }"/> 
			 <!--  <input type="text" name=searchKeyword size="35" id="subject" maxlength="35"/>  -->
			</td>
			<th width="10%">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><span class="button">
						<input type="button" value="조회" Onclick="javascript:tr_search();"></span></td>			
						<td width="10"></td>
						<td><span class="button">
						<a Onclick="javascript:tr_insert();">
						등록</a></span></td>
						<td><span class="button">
						<a href="<c:url value='/bbs/list.do'/>">
						전체보기</a></span></td>
					</tr>
				</table>

			</th>
		
		</tr>
	</table>
	<table class="table-line" width="700">
		<tr>
			<th width=10%>번호</th>
			<th width=45%>제목</th>
			<th width=15%>이름</th>
			<th width=20%>날짜</th>
			<th width=10%>조회수</th>
		</tr>
		
		
	  	<c:choose>
	  		<c:when test="${fn:length(resultList)==0 }">
	  		   <tr>
	  		   	<td class="lt_text3" colspan="5">
	  		    	<c:out value="표시할 내용이 없습니다."/>
	  		    </td>
	  		    </tr>
	  		</c:when>
			<c:when test="${!empty param.searchKeyword}">
		 		<c:forEach var="bbs" items="${resultList }" varStatus="status">			
				<tr onclick="tr_content('<c:out value="${bbs.no}"/>');">	
					<td class="lt_text3" nowrap >
				  <c:out value="${bbs.no}"/>			
				 </td>	 
				<td class="lt_text3" nowrap>
				   <c:out value="${bbs.subject}" />
				</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.name}" /></td>
			    <td class="lt_text3" nowrap>
           			<fmt:formatDate value="${bbs.regdate }" pattern="yyyy-MM-dd"/>
         		</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.hit}" /></td>
			</tr>
			
		 </c:forEach>
		</c:when>
		<c:when test="${empty param.searchKeyword}">
		 <c:forEach var="bbs" items="${bbsList }" varStatus="status">			
		  <tr onclick="tr_content('<c:out value="${bbs.no}"/>');">	
				<td class="lt_text3" nowrap >
				  <c:out value="${bbs.no}"/>			
				 </td>	 
				<td class="lt_text3" nowrap>
				   <c:out value="${bbs.subject}" />
				</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.name}" /></td> 
			    <td class="lt_text3" nowrap>
           			<fmt:formatDate value="${bbs.regdate }" pattern="yyyy-MM-dd"/>
         		</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.hit}" /></td>
			 </tr>
			</c:forEach>
			<table border=0 width=600>
		     <tr>
		      <td align=right>
		      	<a onclick="pageCheck()">이전</a>
		      	 &nbsp;&nbsp;${curpage } page &nbsp;/ ${totalpage } pages &nbsp;
		      	 <a onclick="nextpageCheck()">다음</a>
		      </td>
		     </tr>
		    </table>
		</c:when>
 	 </c:choose>
	</table>
	</form>
</DIV>
</body>

</html>



