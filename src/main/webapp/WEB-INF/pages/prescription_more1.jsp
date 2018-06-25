<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@page import="cn.sheyao.pojo.Doctor1" %>
     <%@page import="cn.sheyao.pojo.Prescription" %>
     <%@page import="cn.sheyao.pojo.Illness" %>
     <%@ include file="../base.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<title>药方</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/custom.css" />
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<%
List<List<Illness>> illness = (List<List<Illness>>)request.getAttribute("illness");
List<Illness> illnesses =(List<Illness>)request.getAttribute("illnesses");
String size =(String)request.getAttribute("size");
String key =(String)request.getAttribute("key");
Map<Illness,List<Prescription>> map=(Map)request.getAttribute("map");


%>
	<style>
		.subNavBox {
			width: 200px;
			border: solid 1px #e5e3da;
			margin: 100px auto;
		}
		
		.subNav {
			border-bottom: solid 1px #e5e3da;
			cursor: pointer;
			font-weight: bold;
			font-size: 14px;
			color: #999;
			line-height: 28px;
			padding-left: 10px;
			background: url(/sheyao/staticfile/assets/images/jiantou1.jpg) no-repeat;
			background-position: 95% 50%
		}
		
		.subNav:hover {
			color: #277fc2;
		}
		
		.currentDd {
			color: #277fc2
		}
		
		.currentDt {
			background-image: url(/sheyao/staticfile/assets/images/jiantou.jpg);
		}
		
		.navContent {
			display: none;
			border-bottom: solid 1px #e5e3da;
		}
		
		.navContent li a {
			display: block;
			heighr: 28px;
			text-align: center;
			font-size: 14px;
			line-height: 28px;
			color: #333
		}
		
		.navContent li a:hover {
			color: #fff;
			background-color: #277fc2
		}
	</style>


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
					<a class="navbar-brand brandStyle" href="#">畲药方</a>
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
				<input type="text" class="form-control" placeholder="Search..." id="key" name="key" >
				<span class="input-group-btn">
                                <button class="btn btn-default" type="button" onclick="check()">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
			</div>
			 <script type="text/javascript">
              function check(){ 
            	    var key=document.getElementById("key").value; 

            	if(key == "" ){ 
            	    alert("请输入关键字！"); 
            	    return false; 
            	} 
            	
            	window.location.href ='/sheyao/Prescription_more?key='+key;
            	}
              
              </script>       
		</nav>

		<!-- Main Page -->

		<div class="container-fluid noPadding">

			<div class="container-fluid headpicture"></div>

	<div class="container text-center">
				
				<div align="left" style="float: left;margin-right: 30px;width: 17%;">
					<div class="subNavBox" align="left" style="margin-top: 0px;">

						<div class="subNav currentDd currentDt">内科</div>
						<ul class="navContent " style="display:block">
						<li>
				<a href="IllnessType?type=内科" style="margin-left:20px">全部</a>
		</li>
						<%
			for(int i=0;i<illness.get(0).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(0).get(i).getIllness_remark().equals("")||illness.get(0).get(i).getIllness_remark()==null)){
				sb.append(illness.get(0).get(i).getIllness_name()).append("(").append(illness.get(0).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(0).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(0).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>

						<div class="subNav">外科</div>
						<ul class="navContent">
						<%
			for(int i=0;i<illness.get(1).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(1).get(i).getIllness_remark().equals("")||illness.get(1).get(i).getIllness_remark()==null)){
				sb.append(illness.get(1).get(i).getIllness_name()).append("(").append(illness.get(1).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(1).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(1).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>

						<div class="subNav">妇科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(2).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(2).get(i).getIllness_remark().equals("")||illness.get(2).get(i).getIllness_remark()==null)){
				sb.append(illness.get(2).get(i).getIllness_name()).append("(").append(illness.get(2).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(2).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(2).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>

						<div class="subNav">儿科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(3).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(3).get(i).getIllness_remark().equals("")||illness.get(3).get(i).getIllness_remark()==null)){
				sb.append(illness.get(3).get(i).getIllness_name()).append("(").append(illness.get(3).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(3).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(3).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">五官科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(4).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(4).get(i).getIllness_remark().equals("")||illness.get(4).get(i).getIllness_remark()==null)){
				sb.append(illness.get(4).get(i).getIllness_name()).append("(").append(illness.get(4).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(4).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(4).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">痧症科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(5).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(5).get(i).getIllness_remark().equals("")||illness.get(5).get(i).getIllness_remark()==null)){
				sb.append(illness.get(5).get(i).getIllness_name()).append("(").append(illness.get(5).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(5).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(5).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">蛇伤科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(6).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(6).get(i).getIllness_remark().equals("")||illness.get(6).get(i).getIllness_remark()==null)){
				sb.append(illness.get(6).get(i).getIllness_name()).append("(").append(illness.get(6).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(6).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(6).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">风湿与关节疾病</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(7).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(7).get(i).getIllness_remark().equals("")||illness.get(7).get(i).getIllness_remark()==null)){
				sb.append(illness.get(7).get(i).getIllness_name()).append("(").append(illness.get(7).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(7).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(7).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						
						<div class="subNav">呼吸科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(8).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(8).get(i).getIllness_remark().equals("")||illness.get(8).get(i).getIllness_remark()==null)){
				sb.append(illness.get(8).get(i).getIllness_name()).append("(").append(illness.get(8).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(8).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(8).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						
						<div class="subNav">消化科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(9).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(9).get(i).getIllness_remark().equals("")||illness.get(9).get(i).getIllness_remark()==null)){
				sb.append(illness.get(9).get(i).getIllness_name()).append("(").append(illness.get(9).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(9).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(9).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						
						<div class="subNav">神经科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(10).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(10).get(i).getIllness_remark().equals("")||illness.get(10).get(i).getIllness_remark()==null)){
				sb.append(illness.get(10).get(i).getIllness_name()).append("(").append(illness.get(10).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(10).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(10).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						
						
						
						<div class="subNav">泌尿生殖科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(11).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(11).get(i).getIllness_remark().equals("")||illness.get(11).get(i).getIllness_remark()==null)){
				sb.append(illness.get(11).get(i).getIllness_name()).append("(").append(illness.get(11).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(11).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(11).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">皮肤科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(12).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(12).get(i).getIllness_remark().equals("")||illness.get(12).get(i).getIllness_remark()==null)){
				sb.append(illness.get(12).get(i).getIllness_name()).append("(").append(illness.get(12).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(12).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(12).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">传染科</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(13).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(13).get(i).getIllness_remark().equals("")||illness.get(13).get(i).getIllness_remark()==null)){
				sb.append(illness.get(13).get(i).getIllness_name()).append("(").append(illness.get(13).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(13).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(13).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>
						
						<div class="subNav">其他</div>
						<ul class="navContent">
							<%
			for(int i=0;i<illness.get(14).size();i++){
				StringBuffer sb =new StringBuffer();
				if(!(illness.get(14).get(i).getIllness_remark().equals("")||illness.get(14).get(i).getIllness_remark()==null)){
				sb.append(illness.get(14).get(i).getIllness_name()).append("(").append(illness.get(14).get(i).getIllness_remark()).append(")");
				}else{
					sb.append(illness.get(14).get(i).getIllness_name());
				}
			%>
			<li>
				<a href="QueryPrescription?illnessId=<%=illness.get(14).get(i).getIllness_ID() %>" style="margin-left:20px"><%=sb%></a>
		</li>
		<%	}
			%>
						</ul>

					</div>
				</div>

<div class="container textstyle" style="width: 80%;float: left;">

<div style="margin-top:-80px">
	查询到有关<h3 style="display: inline-block; margin-top: 0px;"><%=key %></h3>的记录共<%=size %>条
				<table class="table" >
							<tr>
								<td width="15%">病方主治</td>
								<td width="55%">药方详情</td>
								<td width="30%">病方来源</td>
							</tr>
							<%
							if(!size.equals("0")){
							Iterator iter =map.entrySet().iterator();
							while(iter.hasNext()){
								StringBuffer sb =new StringBuffer();
								StringBuffer sbb = new StringBuffer();
								StringBuffer sbname =new StringBuffer();
								Map.Entry<Illness,List<Prescription>> entry =(Map.Entry)iter.next();
								Illness ill=entry.getKey();
								if(!(ill.getIllness_remark().equals("")||ill.getIllness_remark()==null)){
									sbname.append(ill.getIllness_name()).append("(").append(ill.getIllness_remark()).append(")");
									}else{
										sbname.append(ill.getIllness_name());
									}
								List<Prescription> p =entry.getValue();
								for(int i=0;i<p.size();i++){
									/* if(i==p.size()-1){
										sb.append(p.get(i).getPrescription_particulars());
									}else{
										sb.append(p.get(i).getPrescription_particulars()).append("<br>");
									}
									if(p.get(i).getPrescription_source().isEmpty()&&p.get(i).getDoctor_ID().isEmpty()){
										sbb.append("").append("<br>");
									}else if(p.get(i).getIllness_ID().isEmpty()){
										sbb.append(p.get(i).getPrescription_source()).append("<br>");
									}else{
										sbb.append(p.get(i).getDoctor_ID()).append(",").append(p.get(i).getPrescription_source())
										.append("<br>");
									} */
									if(i==p.size()-1){
										sb.append(p.get(i).getPrescription_particulars());
									}else{
										sb.append(p.get(i).getPrescription_particulars()).append("<br>");
									}
									if(!(p.get(i).getPrescription_source()==null||p.get(i).getPrescription_source().equals(""))
											&&!(p.get(i).getDoctor_ID()==null||p.get(i).getDoctor_ID().equals(""))){
										sbb.append(p.get(i).getDoctor_ID()).append(",").append(p.get(i).getPrescription_source())
										.append("<br>");
									}else if((p.get(i).getIllness_ID()==null||p.get(i).getIllness_ID().equals(""))){
										sbb.append(p.get(i).getPrescription_source()).append("<br>");
									}else{
										sbb.append("").append("<br>");
									} 
									
								}%>
								<tr>
								<td width="15%"><a href="QueryPrescription?illnessId=<%=entry.getKey().getIllness_ID()%>"><%=sbname %></a></td>
								<td width="55%"><%=sb %></td>
								<td width="30%"><%=sbb %></td>
								
							</tr>
								
						<%	}
							}
							%>
								
							
						</table>
			</div>
	





	
				</div>

			</div>

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