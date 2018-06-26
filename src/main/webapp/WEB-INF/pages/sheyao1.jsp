<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@ include file="../base.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<title>畲药</title>
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
		<link href="${ctx }/staticfile/assets/css/zzsc.css" type="text/css" rel="stylesheet" />
	</head>
	<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
List<Medicine> medicine =(List)request.getAttribute("medicine");
List<Medicine> medicine_date =(List)request.getAttribute("medicine_date");
List<Medicine> medicine_type =(List)request.getAttribute("medicine_type");
Medicine medicine_one=(Medicine)request.getAttribute("medicine_one");
// out.print(medicine_one);
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
					<a class="navbar-brand brandStyle" href="#">畲药</a>
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
				<span class="input-group-btn" >
                                <button class="btn btn-default" type="button" id="search" onclick="check()" >
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
              <script type="text/javascript">
              function check(){ 
            	    var key=document.getElementById("key").value; 

            	if(key == "" ){ 
            	    alert("请输入关键字！"); 
            	    return false; 
            	} 
            	
            	window.location.href ='/sheyao/Querykey?key='+key;
            	}
              
              </script>              
			</div>
		</nav>

		<!-- Main Page -->

		<div class="container-fluid noPadding">

			<div class="container-fluid headpicture"></div>

			<div class="container text-center">
				
<div align="left" style="float: left;margin-right: 30px;width: 17%;">
					<div class="subNavBox" align="left" style="margin-top: 0px;">

						<div class="subNav currentDd currentDt">菌类植物</div>
						<ul class="navContent " style="display:block">
						<li>
				<a href="QueryByType?type=2" style="margin-left:20px">全部</a>
				</li>
						
				<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 2) {
				%>
				<li>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a>
				</li>
				<%
					}
					}
				%>
<!-- 							<li> -->
<!-- 								<a href="#">添加新闻</a> -->
<!-- 							</li> -->
							
						</ul>

						<div class="subNav">地衣苔藓类植物</div>
						<ul class="navContent">
						<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 3) {
				%>
				<li>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a>
				</li>
				<%
					}
					}
				%>
<!-- 							<li> -->
<!-- 								<a href="#">添加新闻</a> -->
<!-- 							</li> -->
							
						</ul>

						<div class="subNav">蕨类植物</div>
						<ul class="navContent">
						<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 5) {
				%>
				<li>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a>
				</li>
				<%
					}
					}
				%>
<!-- 							<li> -->
<!-- 								<a href="#">添加新闻</a> -->
<!-- 							</li> -->
							
						</ul>

						<div class="subNav">裸子植物</div>
						<ul class="navContent">
						<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 6) {
				%>
				<li>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a>
				</li>
				<%
					}
					}
				%>
<!-- 							<li> -->
<!-- 								<a href="#">添加新闻</a> -->
<!-- 							</li> -->
						</ul>
						
						<div class="subNav">双子叶植物</div>
						<ul class="navContent">
						
						<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 7) {
				%>
				<li>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a>
				</li>
				<%
					}
					}
				%>
<!-- 							<li> -->
<!-- 								<a href="#">添加新闻</a> -->
<!-- 							</li> -->
						</ul>
						
						

					</div>
				</div>


<div class="container " style="width: 80%;float: left;">

				<%
					if (medicine_type != null) {
						Medicine m1 = medicine_type.get(0);
						int leiming = m1.getMedicine_planCategory();
						String strleiming = String.valueOf(leiming);
						if (strleiming.equals("2")) {
							strleiming = "菌类植物";
						} else if (strleiming.equals("3")) {
							strleiming = "地衣苔藓类植物";
						} else if (strleiming.equals("5")) {
							strleiming = "蕨类植物";
						} else if (strleiming.equals("6")) {
							strleiming = "裸子植物";
						} else if (strleiming.equals("7")) {
							strleiming = "双子叶植物";
						}
				%>
				<h1 style="display: inline-block; margin-top: 0px;">菌类植物</h1>
				<div class="row">

					<%
						for (Medicine m : medicine_type) {
					%>
					<div class="col-sm-6 col-md-4">
						<a href="QueryById?id=<%=m.getMedicine_ID()%>">
							<div class="thumbnail">
								<img src="${ctx }/staticfile/assets/images/1.jpg">
								<div class="caption">
									<h3><%=m.getMedicine_name()%></h3>
									<p><%=m.getMedicine_distribution()%></p>
								</div>
							</div>
						</a>
					</div>
					<%
						}
					%>


				</div>


				<%
					}else if(medicine_one!=null){%>
					<div style="margin-top:-150px">
						<div style="background: white;">
						<h1 style="display: inline-block;"><%=medicine_one.getMedicine_name()%></h1>
						<h5 style="display: inline-block;"><%=medicine_one.getMedicine_anotherName()%></h5>
						<div>
							<h5 style="display: inline-block;"><%=medicine_one.getMedicine_property()%></h5>
<!-- 							<h5 style="display: inline-block;margin-left: 10px;">药物种类</h5> -->
						</div>
						<p align="left">
							原植物：<%=medicine_one.getMedicine_introduce()%>

						</p>
						<p align="left">
							生境分布：<%=medicine_one.getMedicine_distribution()%>
						</p>
						<%-- <p align="left">
							主治用法：<%=medicine_one.getMedicine_mainUse()%>
						</p> --%>
						<p align="left">
							采收加工：<%=medicine_one.getMedicine_CollectionProcessing()%>
						</p>
						<p align="left">
							使用注意:
						</p>
						<div>
							<p align="left">主治用法：</p>
							<table class="table">
								<tr>
									<td width="15%">病方主治</td>
									<td width="70%">病方详情</td>
									<td width="15%">病方来源</td>
								</tr>
								<tr>
									<td width="15%">病方主治</td>
									<td width="70%">病方详情</td>
									<td width="15%">病方来源</td>
								</tr>
							</table>
						</div>
					</div>

					<div>
						<p align="left">图片显示：</p>

						<div class="row">
							<!--
	                    	作者：58901774@qq.com
	                    	时间：2018-06-22
	                    	描述：一块一块的显示
	                   -->
							<div class="col-sm-6 col-md-4">
								<a href="#">
									<div class="thumbnail">
										<img src="${ctx }/staticfile/assets/images/1.jpg">
										<div class="caption">
											<p>描述</p>
										</div>
									</div>
								</a>
							</div>

							<div class="col-sm-6 col-md-4">
								<a href="#">
									<div class="thumbnail">
										<img src="${ctx }/staticfile/assets/images/1.jpg">
										<div class="caption">
											<p>描述</p>
										</div>
									</div>
								</a>
							</div>
							<div class="col-sm-6 col-md-4">
								<a href="#">
									<div class="thumbnail">
										<img src="${ctx }/staticfile/assets/images/1.jpg">
										<div class="caption">
											<p>描述</p>
										</div>
									</div>
								</a>
							</div>

						</div>

					</div>

						</div>
						
				<%	}else{%>
						
				<h1 style="display: inline-block; margin-top: 0px;">菌类植物</h1>
				<div class="row">

	
				<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==2){%>
									<div class="col-sm-6 col-md-4">
						<a href="QueryById?id=<%=m.getMedicine_ID()%>">
						<div class="thumbnail">
							<img src="${ctx }/staticfile/assets/images/1.jpg">
							<div class="caption">
								<h3><%=m.getMedicine_name()%></h3>
								<p><%=m.getMedicine_distribution() %></p>
							</div>
						</div>
					</a>
					</div>
									
							<%	}
							}%>

				</div>

<h1 style="display: inline-block; margin-top: 0px;">地衣苔藓类植物</h1>
				<div class="row">

	
				<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==3){%>
									<div class="col-sm-6 col-md-4">
						<a href="QueryById?id=<%=m.getMedicine_ID()%>">
						<div class="thumbnail">
							<img src="${ctx }/staticfile/assets/images/1.jpg">
							<div class="caption">
								<h3><%=m.getMedicine_name()%></h3>
								<p><%=m.getMedicine_distribution() %></p>
							</div>
						</div>
					</a>
					</div>
									
							<%	}
							}%>

				</div>
				
				<h1 style="display: inline-block; margin-top: 0px;">蕨类植物</h1>
				<div class="row">

	
				<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==5){%>
									<div class="col-sm-6 col-md-4">
						<a href="QueryById?id=<%=m.getMedicine_ID()%>">
						<div class="thumbnail">
							<img src="${ctx }/staticfile/assets/images/1.jpg">
							<div class="caption">
								<h3><%=m.getMedicine_name()%></h3>
								<p><%=m.getMedicine_distribution() %></p>
							</div>
						</div>
					</a>
					</div>
									
							<%	}
							}%>

				</div>
				
				
				<h1 style="display: inline-block; margin-top: 0px;">裸子植物</h1>
				<div class="row">

	
				<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==6){%>
									<div class="col-sm-6 col-md-4">
						<a href="QueryById?id=<%=m.getMedicine_ID()%>">
						<div class="thumbnail">
							<img src="${ctx }/staticfile/assets/images/1.jpg">
							<div class="caption">
								<h3><%=m.getMedicine_name()%></h3>
								<p><%=m.getMedicine_distribution() %></p>
							</div>
						</div>
					</a>
					</div>
									
							<%	}
							}%>

				</div>
				
				<h1 style="display: inline-block; margin-top: 0px;">双子叶植物</h1>
				<div class="row">

	
				<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==7){%>
									<div class="col-sm-6 col-md-4">
						<a href="QueryById?id=<%=m.getMedicine_ID()%>">
						<div class="thumbnail">
							<img src="${ctx }/staticfile/assets/images/1.jpg">
							<div class="caption">
								<h3><%=m.getMedicine_name()%></h3>
								<p><%=m.getMedicine_distribution() %></p>
							</div>
						</div>
					</a>
					</div>
									
							<%	}
							}%>

				</div>
				
						
					<%}
				%>

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
		<script src="${ctx }/staticfile/assets/js/bootstrap.min.js"></script>
		<script src="${ctx }/staticfile/assets/js/myscript.js"></script>
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="${ctx }/staticfile/assets/js/bootstrap.min.js"></script>
		<script src="${ctx }/staticfile/assets/js/myscript.js"></script>
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