<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>상세조회</title>
<script language = "javascript">  // 자바 스크립트 시작
   function deleteCheck()
	  {
	   var form = document.detailform;
	   
	   if(form.name.value !='${loginVO.name}')
	   {
		    alert( "삭제권한이 없습니다." );
		    form.pwd.focus();
		    return;
	   }
	   else if( !form.pwd.value )
	   {
	    alert( "비밀번호를 적어주세요" );
	    form.pwd.focus();
	    return;

	   }
	   else if(form.pwd.value && form.pwd.value=='${bbs.pwd}' && form.name.value=='${loginVO.name}')
	    {
			 if(!confirm("진짜 삭제하시겠습니까?"))
		     {
					return;
			 }
			 else
		     {
		      //form.action = "<c:url value='/bbs/delete.do'/>";
		      location.href="delete.do?no=${bbs.no}";
		     }
	    }
	   else if(form.pwd.value !='${bbs.pwd}')
	   {
		    alert( "비밀번호가 틀렸습니다." );
		    form.pwd.focus();
		    return;
	   }
	  }
	  function menu(keyword,page)
	  {
				var form = document.detailform;
				form.keyword=keyword;
				form.page=page;
          		form.action = "<c:url value='/bbs/list.do'/>";
	           	form.submit();
	  } 
	  function updateCheck()
	  {
	   		var form = document.detailform;
	   		
	   		if(form.name.value == '${loginVO.name}')
		   	{
	   			form.action = "<c:url value='/bbs/update.do'/>";
      			form.submit();
		   	}
	   		else
		   	{
			   	alert('수정권한이 없습니다.');
			   	return;
			}
	  }
</script>

</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;Spring Board Detail</h1></td>
 </tr>
</table>
<form name=detailform method=post >
  <c:if test="${!empty msg}">
  		<script language=javascript>
  		alert('${msg }');
  		</script>
  </c:if>
<input type="hidden" name=searchKeyword value='${param.searchKeyword }'/>
<input type="hidden" name=page value="${param.page }"/>
<input type="hidden" name=no value="${bbs.no}"/>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="Detail Page">
<CAPTION style="display: none;">상세조회</CAPTION>

  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >글번호&nbsp;&nbsp;</th>
    <td>${bbs.no}</td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >글쓴이&nbsp;&nbsp;</th>
    <td>${bbs.name}</td>
    <c:if test="${!empty loginVO.id }">
    	<input type="hidden" name="name" value="${bbs.name}"/>
    </c:if>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >글제목&nbsp;&nbsp;</th>
    <td>${bbs.subject}</td>
  </tr>
    <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >작성일&nbsp;&nbsp;</th>
    <td><fmt:formatDate value="${bbs.regdate }" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row" >내용&nbsp;&nbsp;</th>
    <td><textarea class="textarea"  cols="75" rows="14"  style="width:450px;" disabled="disabled" title="${bbs.conts}">${bbs.conts}</textarea></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >비밀번호&nbsp;&nbsp;</th>
    <td><input type=password name="pwd"></td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="10">
    </td>
  </tr>
  <tr><td>
		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="수정" width="8" height="20"></td>
		  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:updateCheck()" >수정</a></td>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="수정" width="8" height="20"></td>
		  <td width="10"></td>
		    <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="삭제" width="8" height="20"></td>
		    <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:deleteCheck()">삭제</a></td>
			<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="삭제" width="8" height="20"></td>
		    <td width="10"></td>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
		  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:menu();">목록</a></td>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
		</tr>
		</table>
	</td></tr>
</table>
</form>
	<%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/> --%>
   	 <%-- <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/> --%>
	<%--  <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>  --%>
</DIV>
</body>
</html>
