<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@page import="cn.sheyao.pojo.Doctor1" %>
     <%@page import="cn.sheyao.pojo.Illness" %>
     <%@page import="cn.sheyao.pojo.Prescription" %>
     <%@ include file="../base.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<title>畲医</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/custom.css" />
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/staticfile/assets/css/custom.css" />
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="${ctx }/staticfile/css/zzsc.css" type="text/css" rel="stylesheet" />
	</head>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
List<Doctor1> doctor =(List)request.getAttribute("doctor");
List<Doctor1> doctor_more =(List)request.getAttribute("doctor_more");
String key =(String)request.getAttribute("key");
String size =(String)request.getAttribute("size");
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
			background: url(/sheyao/staticfile/images/jiantou1.jpg) no-repeat;
			background-position: 95% 50%
		}
		
		.subNav:hover {
			color: #277fc2;
		}
		
		.currentDd {
			color: #277fc2
		}
		
		.currentDt {
			background-image: url(/sheyao/staticfile/images/jiantou.jpg);
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
					<a class="navbar-brand brandStyle" href="#">畲医</a>
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
				<input type="text" class="form-control" placeholder="Search..." id="key" name="key">
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
            	
            	window.location.href ='/sheyao/QueryDoctorkey?key='+key;
            	}
              
              </script>    
		</nav>

		<!-- Main Page -->

		<div class="container-fluid noPadding">

			<div class="container-fluid headpicture"></div>

			<div class="container text-center">
<div align="left" style="float: left;margin-right: 30px;width: 17%;">
					<div class="subNavBox" align="left" style="margin-top: 0px;">

						<div class="subNav currentDd currentDt"><a href="QueryByStartWith?StartWith=a&StartWith=b&StartWith=c&StartWith=d" style="margin-left:20px">A-D</a></div>
						<ul class="navContent " style="display:block">
						<!-- <li>
						<a href="QueryByStartWith?StartWith=a&StartWith=b&StartWith=c&StartWith=d" style="margin-left:20px">全部</a>
						</li> -->
						<%
				List<Doctor1> doctorad =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						if (d.getDoctor_forSelect().startsWith("a")||d.getDoctor_forSelect().startsWith("b")||d.getDoctor_forSelect().startsWith("c")||d.getDoctor_forSelect().startsWith("d")) {
							doctorad.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a>
				</li>
				<%
					}
					}
				%>

						</ul>

						<div class="subNav">E-H</div>
						<ul class="navContent">
						<li>
						<a href="QueryByStartWith?StartWith=e&StartWith=f&StartWith=g&StartWith=h" style="margin-left:20px">全部</a>
						</li>
						<%
				List<Doctor1> doctoreh =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("e")||d.getDoctor_forSelect().startsWith("f")||d.getDoctor_forSelect().startsWith("g")||d.getDoctor_forSelect().startsWith("h")) {
							doctoreh.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a>
				</li>
				<%
					}
					}
				%>

						</ul>

						<div class="subNav">I-L</div>
						<ul class="navContent">
						<%
				List<Doctor1> doctoril =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("i")||d.getDoctor_forSelect().startsWith("j")||d.getDoctor_forSelect().startsWith("k")||d.getDoctor_forSelect().startsWith("l")) {
							doctoril.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				</li>
				<%
					}
					}
				%>

						</ul>

						<div class="subNav">M-P</div>
						<ul class="navContent">
						<%
				List<Doctor1> doctormp =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("m")||d.getDoctor_forSelect().startsWith("n")||d.getDoctor_forSelect().startsWith("o")||d.getDoctor_forSelect().startsWith("p")) {
							doctormp.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				</li>
				<%
					}
					}
				%>

						</ul>
						
						<div class="subNav">Q-T</div>
						<ul class="navContent">
						<%
				List<Doctor1> doctorqt =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("q")||d.getDoctor_forSelect().startsWith("r")||d.getDoctor_forSelect().startsWith("s")||d.getDoctor_forSelect().startsWith("t")) {
							doctorqt.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				</li>
				<%
					}
					}
				%>

						</ul>
						
						<div class="subNav">U-X</div>
						<ul class="navContent">
						<%
				List<Doctor1> doctorux =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("u")||d.getDoctor_forSelect().startsWith("v")||d.getDoctor_forSelect().startsWith("w")||d.getDoctor_forSelect().startsWith("x")) {
							doctorux.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				</li>
				<%
					}
					}
				%>

						</ul>
						
						<div class="subNav">Y-Z</div>
						<ul class="navContent">
						<%
				List<Doctor1> doctoryz =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("y")||d.getDoctor_forSelect().startsWith("z")) {
							doctoryz.add(d);
				%>
				<li>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				</li>
				<%
					}
					}
				%>

						</ul>
						
						

					</div>
				</div>


<div class="container " style="width: 80%;float: left;">
	查询到有关<h3 style="display: inline-block; margin-top: 0px;"><%=key %></h3>的记录共<%=size %>条
				<div class="row">
				<%
				if(Integer.parseInt(size)!=0){
		for(int i=0;i<doctor_more.size();i++){
			Doctor1 d=doctor_more.get(i);
		%>
					<div class="col-sm-6 col-md-4">
						<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>">
						<div class="thumbnail">
							<img src="${ctx }/staticfile/assets/images/1.jpg">
							<div class="caption">
								<h3><%=d.getDoctor_name() %></h3>
								<p><%=d.getDoctor_introduce()%></p>
							</div>
						</div>
					</a>
					</div>
					<%}
				}
		%>
					
				</div>




			</div>

			</div>


			<!-- Footer -->

			<div class="container footer">
				<div class="col-xs-12 col-md-8 noPadding">
					<p id="footerLogoText">Creative Company © 2014</p>
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