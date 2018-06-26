<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="../base1.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>畲医药资源库管理</title>
<link rel="stylesheet" rev="stylesheet" href="${ctx }/staticfile/css/shouyesuoyou.css" type="text/css" media="all" />
<style type="text/css">
/* body{ */
/* background-color:#DBDBDB; */
} 
/*   body {   */
/*    width: 100%;  */
/*    height:auto;  */
/*     background:url("images/beijing2.jpeg") no-repeat;  */
/*     background-size: 100%;   */
/* }   */

</style></head>
</head>
<body>
<div >
	<div id="header">
	<c:import url="header.jsp"></c:import>
				<%-- <jsp:include page="header.jsp" />   --%>    
    </div>
    <div id="center">
    <c:import url="center.jsp"></c:import>
<%-- 				<jsp:include page="center.jsp" />       --%>
    </div>
	<div id="footer">
	<c:import url="footer.jsp"></c:import>
<%-- 				<jsp:include page="footer.jsp" />   --%>
	</div>
</div>
</body>
</html>