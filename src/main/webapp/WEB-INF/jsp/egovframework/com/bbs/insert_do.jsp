<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글쓰기</title>
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *   selector : 내장객체 , 태그명( $('태그명')=>$('tr')) , 
                ID명 ($('#ID명')) ,
                Class명 ($('.class명'))
             $(document)
 */
$(function(){
	$('#sendBtn').click(function(){
		var name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			$('#name').val("");
			return;
		}
		var subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			$('#subject').val("");
			return;
		}
		var content=$('#conts').val();
		if(content.trim()=="")
		{
			$('#conts').focus();
			$('#conts').val("");
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			$('#pwd').val("");
			return;
		}
		
		$('#frm').submit();
	});
});
</script>
</head>
<body>
<div id="content">
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%" class="title_left"><h1 class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;Spring Board Writing</h1></td>
	 </tr>
	</table>
    <form method=post action='insert_ok.do' id="frm">
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="Detail Page">
           <tr>
             <th width="20%" height="23" class="required_text" scope="row" nowrap >이름&nbsp;&nbsp;</th>
            <td>
             <input type="text" name=name size=12 id="name">
            </td>
           </tr>
           <tr>
            <th width="20%" height="23" class="required_text" scope="row" nowrap >글제목&nbsp;&nbsp;</th>
            <td>
             <input type="text" name=subject size=53 id="subject">
            </td>
           </tr>
           <tr>
             <th width="20%" height="23" class="required_text" scope="row" nowrap>내용&nbsp;&nbsp;</th>
            <td width=85% align="left">
             <textarea rows="10" cols="50" name=conts id="conts"></textarea>
            </td>
           </tr>
           <tr>
  			<th width="20%" height="23" class="required_text" scope="row" nowrap>비밀번호&nbsp;&nbsp;</th>
            <td>
             <input type="password" size=10 name=pwd id="pwd">
            </td>
           </tr>
           <tr>
            <td colspan="2" align="center">
             <input type="button" value="글쓰기" id="sendBtn">
             <input type="button" value="취소"
              onclick="javascript:history.back()">
            </td>
           </tr>
          </table>
   
    </form>
</div>
</body>
</html>







