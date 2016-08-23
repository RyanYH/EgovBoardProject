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
		/*  form.action = 'content.do'; */
         form.submit();
	}
    function tr_search(keyword)
	{
		 var form = document.listfrm;
		 form.searchKeyword=keyword;
		 form.action ="<c:url value='/bbs/search.do'/>";
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
<form method="post" id="frd" name=listfrm>
  <input type="hidden" name="no" />
	<table width="700" cellpadding="8" class="table-search" border="0">
		<tr>
			<td width="30%" class="title_left"><h1 class="title_left">
					<img
						src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"
						width="16" height="16" hspace="3" style="vertical-align: middle"
						alt="제목아이콘이미지">&nbsp;Spring Board
				</h1>
			</td>
			<th></th>
			<td width="25%">
			<c:if test="${'${empty searchKeyword}'}">
			제목으로 조회하기 	
			</c:if>
		    <c:if test="${'${!empty searchKeyword}'}">
			${searchKeyword }&nbsp; 검색결과
			</c:if>

			<%-- <select name="searchCondition" class="select"
				id="searchCondition">
					<option selected value=''></option>
					<option value='1'
						<c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>ID</option>
					<option value='2'
						<c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>제목</option>
			</select> --%>
			</td>
			<td width="35%">
			 <input type="text" name=searchKeyword size="35" id="subject" maxlength="35" value="${param.searchKeyword }"/> 
			</td>
			<th width="10%">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><span class="button">
						<input type="button" value="조회" Onclick="javascript:tr_search();"></span></td>			
						<td width="10"></td>
						<td><span class="button">
						<a href="<c:url value='/bbs/insert.do'/>">
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
<%-- 		<c:forEach var="bbs" items="${bbsList}" varStatus="status">
			<tr>
				<td class="lt_text3" nowrap><c:out value="${bbs.no}" /></td>
				<td class="lt_text3" nowrap>
				<a href="content.do?no=${bbs.no }">
				   <c:out value="${bbs.subject}" /></a></td>
				<td class="lt_text3" nowrap><c:out value="${bbs.name}" /></td>
			    <td class="lt_text3" nowrap>
           			<fmt:formatDate value="${bbs.regdate }" pattern="yyyy-MM-dd"/>
         		</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.hit}" /></td>
			</tr>
		</c:forEach> --%>
		<!-- <input type="hidden" name=no value=""/> -->
		<c:forEach var="bbs" items="${resultList}" varStatus="status">			
			<tr onclick="tr_content('<c:out value="${bbs.no}"/>');">	
				<td class="lt_text3" nowrap >
				  <c:out value="${bbs.no}"/>			
				 </td>	 
				<td class="lt_text3" nowrap>
				<%-- <a href="content.do?no=${bbs.no }" onclick="tr_content(); return false;">  --%>
				   <c:out value="${bbs.subject}" />
				</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.name}" /></td>
			    <td class="lt_text3" nowrap>
           			<fmt:formatDate value="${bbs.regdate }" pattern="yyyy-MM-dd"/>
         		</td>
				<td class="lt_text3" nowrap><c:out value="${bbs.hit}" /></td>
			</tr>
		</c:forEach>

	</table>
	
	</form>
<%-- 	 
	<div id="paging">
	   <center>
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        <form:hidden path="pageIndex" />
       </center>
     </div> 
--%>
	<!-- 		
	    <table border=0 width=600>
			<tr>
				<td align=right></td>
			</tr>
		</table> 
-->
</DIV>
</body>

</html>



