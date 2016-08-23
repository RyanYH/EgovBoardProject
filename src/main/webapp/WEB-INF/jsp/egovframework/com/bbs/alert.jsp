<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="ko">
<head>
<script type="text/javascript">
	alert('${msg}');
	location.href='${url}';
</script>
</head>
<body>
<%-- <form method="post" name=alertfrm>
	<input type="hidden" name="page" value="${page }"/>
	<input type="hidden" name="searchKeyword" value="${searchKeyword }"/>
</form> --%>
</body>
</html>