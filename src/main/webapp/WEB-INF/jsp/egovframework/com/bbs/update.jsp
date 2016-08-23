
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
	function updateCheck()
	  {
		  
	   var form = document.updateform;

	   if( !form.name.value )   // form 에 있는 name 값이 없을 때
	   {
	    alert( "이름을 적어주세요" ); // 경고창 띄움
	    form.name.focus();   // form 에 있는 name 위치로 이동
	    return;
	   }
	   
	  if( !form.subject.value )
	   {
	    alert( "제목을 적어주세요" );
	    form.subject.focus();
	    return;
	   }
	 
	  if( !form.conts.value )
	   {
	    alert( "내용을 적어주세요" );
	    form.conts.focus();
	    return;
	   }
	   if( !form.pwd.value )
	   {
		    alert( "비밀번호를 적어주세요" );
		    form.pwd.focus();
		    return;
	   }
	   else if(form.pwd.value && form.pwd.value=='${bbs.pwd}')
	    {
			 form.action= "<c:url value='/bbs/update_ok.do'/>";
			 form.submit();
	    }
	   else if(form.pwd.value !='${bbs.pwd}')
	   {
		    alert( "비밀번호가 틀렸습니다." );
		    form.pwd.focus();
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

<form method=post name=updateform>
<input type="hidden" name=searchKeyword value='${param.searchKeyword }'/>
<input type="hidden" name=page value="${param.page }"/>
<input type="hidden" name=no value="${param.no }"/>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="Detail Page">
	<CAPTION style="display: none;">내용 수정하기</CAPTION>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >글번호&nbsp;&nbsp;</th>
    <td>${bbs.no}</td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >글쓴이&nbsp;&nbsp;</th>
    <td><input type="hidden" name=name id=name value="${bbs.name}" name=name>
    	<c:out value="${bbs.name}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >글제목&nbsp;&nbsp;</th>
    <td><input type="text" name=subject id=subject value="${bbs.subject}" name=subject></td>
  </tr>
    <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >작성일&nbsp;&nbsp;</th>
    <td><fmt:formatDate value="${bbs.regdate }" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row" >내용&nbsp;&nbsp;</th>
    <td><textarea class="textarea"  cols="75" rows="14"  style="width:450px;" id="conts" name=conts>${bbs.conts}</textarea></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >비밀번호&nbsp;&nbsp;</th>
    <td><input type=password name="pwd" id=pwd></td>
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
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
		  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:updateCheck();"> 저장</a></td>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
		  <td width="10"></td>
		  
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
		  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="javascript:history.back(); return false;">취소</a></td>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
		</tr>
		</table>
	</td></tr>
</table>
</form>
<form name="Form" id="Form" method="post" action="">
	<input name="clCode" type="hidden">	
	<input type="submit" id="invisible" class="invisible">
</form>
</DIV>
</body>
</html>
