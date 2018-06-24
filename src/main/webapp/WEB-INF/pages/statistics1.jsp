<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
        <%@page import="cn.sheyao.pojo.Illness" %>
     <%@page import="cn.sheyao.pojo.Doctor1" %>
     <%@page import="cn.sheyao.pojo.Medicinecount" %>
     <%@page import="cn.sheyao.pojo.Doctorcount" %>
     <%@page import="cn.sheyao.pojo.Illnesscount" %>
     <%@ include file="../base.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<title>统计</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/custom.css" />
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	</head>

	<body>

		<!--  Navigation Bar -->

		<nav class="navbar navbar-default navbar-fixed-top noBorder" role="navigation">
			<div class="container">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand brandStyle" href="#">统计</a>
				</div>

				<div class="collapse navbar-collapse noPadding" id="myNavbar">
					<div class="navbar-right menustyle">
						<ul class="nav navbar-nav">
							<li>
								<a href="/sheyao/toMedicine">
									<p>药</p>
								</a>
							</li>
							<li>
								<a href="/sheyao/toPrescription">
									<p>方</p>
								</a>
							</li>
							<li>
								<a href="/sheyao/toDoctor">
									<p>医</p>
								</a>
							</li>
							<li>
								<a href="/sheyao/toStatistics">
									<p>统</p>
								</a>
							</li>
						</ul>
					</div>
				</div>

			</div>
			<div class="input-group custom-search-form" style="margin-left: 20px;margin-right: 20px;">
				<input type="text" class="form-control" placeholder="Search...">
				<span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
			</div>
		</nav>

		<!-- Main Page -->

<%
List<Medicinecount> mc =(List)request.getAttribute("mc");
List<Doctorcount> dc =(List)request.getAttribute("dc");
List<Illnesscount> ic =(List)request.getAttribute("ic");
List<Medicine> medicine=(List)request.getAttribute("medicine");
List<Doctor1> doctor =(List)request.getAttribute("doctor");
List<Illness> illness =(List)request.getAttribute("illness");
%>
		<div class="container-fluid noPadding">

			<div class="container-fluid headpicture"></div>

			<div class="container text-center">
				<h1 style="display: inline-block; margin-top: 0px;">畲药</h1>
				<table class="table" >
							<tr>
							<th width="25%">畲药</th>
							<th width="25%">&nbsp;</th>
								
								<th width="25%">&nbsp;</th>
								<th width="25%">查询次数</th>
<!-- 								<td width="15%">病方来源</td> -->
							</tr>
							
							<%
							for(int i=0;i<mc.size();i++){%>
								<tr>
							<td width="25%"><%=medicine.get(i).getMedicine_name() %></td>
							<td width="25%">&nbsp;</td>
							<td width="25%">&nbsp;</td>
							<td width="25%"><%=mc.get(i).getViewstime() %></td>
							</tr>
							<%}
							%>
							
						</table>
						
						
						 <h1 style="display: inline-block; margin-top: 0px;">畲医</h1>
				<table class="table" >
							<tr>
							<th width="25%">畲医</th>
							<th width="25%">&nbsp;</th>
								
								<th width="25%">&nbsp;</th>
								<th width="25%">查询次数</th>
<!-- 								<td width="15%">病方来源</td> -->
							</tr>
							
							<%
							for(int i=0;i<dc.size();i++){%>
								<tr>
							<td width="25%"><%=doctor.get(i).getDoctor_name() %></td>
							<td width="25%">&nbsp;</td>
							<td width="25%">&nbsp;</td>
							<td width="25%"><%=dc.get(i).getViewstime() %></td>
							</tr>
							<%}
							%>
						</table>
						
						<h1 style="display: inline-block; margin-top: 0px;">病症</h1>
				<table class="table" >
							<tr>
							<th width="25%">病症</th>
							<th width="25%">&nbsp;</th>
								
								<th width="25%">&nbsp;</th>
								<th width="25%">查询次数</th>
<!-- 								<td width="15%">病方来源</td> -->
							</tr>
							<%
							
							for(int i=0;i<ic.size();i++){
							StringBuffer sb =new StringBuffer();
							if(!(illness.get(i).getIllness_remark()==null||illness.get(i).getIllness_remark().equals(""))){
								sb.append(illness.get(i).getIllness_name()).append("(").append(illness.get(i).getIllness_remark())
										.append(")");
							}else{
								sb.append(illness.get(i).getIllness_name());
							}
							%>
							<tr>
							<td width="25%"><%=sb %></td>
							<td width="25%">&nbsp;</td>
							<td width="25%">&nbsp;</td>
							<td width="25%"><%=ic.get(i).getViewstime() %></td>
							</tr>
							<%}
							%>
						</table> 

				
			</div>

			<div class="container textstyle">

			</div>

			<!-- Footer -->

			<div class="container footer">
				<div class="col-xs-12 col-md-8 noPadding">
					<p id="footerLogoText">Creative Company Â© 2014</p>
				</div>
			</div>

		</div>

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/myscript.js"></script>
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/myscript.js"></script>
		<script type="text/javascript">
			$(function() {
				$(".subNav").click(function() {
					$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd");
					$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt");
					$(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(500);
				})
			})
		</script>
	</body>

</html>