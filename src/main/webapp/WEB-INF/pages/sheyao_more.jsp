<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@ include file="../base.jsp" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
 <link  rel="stylesheet" href="${ctx }/staticfile/css/shouyesuoyou.css"/> 
 <script src="${ctx }/staticfile/js/jquery-1.11.1.min.js"></script>
 
<style type="text/css">
/* 显示全部表格，固定长度其余显示省略号 */
td {
      white-space:nowrap;
      overflow:hidden;
      text-overflow: ellipsis;
}
table{
        table-layout:fixed;
        word-wrap:break-word;
        margin-top:20px;
        word-wrap: break-word; 
        word-break: break-all;
}
</style>
<style type="text/css">
#tu{
float:left;
padding-left:20px;
padding-top:20px;
width:20%;

}
#wenzi{
float:left;
padding-top:25px;
padding-right:30px;
width:80%;
}
div.head_pos
{
position:absolute;
left:530px;
top:30px
}
input.pos_abs
{
position:relative;
}
a.pos_abs1
{
position:absolute;
left:900px;
top:150px
}
div.pos
{
position:relative;
left:10px;
top:20px
}
div.posa
{
position:relative;
left:10px;
}
div.pos1
{
position:relative;
left:10px;
top:20px
}

div.pos2
{
position:absolute;
left:250px;
top:500px
}
p.word
{
font-size:20px		
}
p.word1
{
font-size:50px;
font-weight:900		
}
span.word1
{
font-size:50px;
font-weight:900		
}
p.word2
{
font-size:20px;
font-weight:900		
}
p.word3
{
font-size:15px;
	
}

</style>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
List<Medicine> medicine =(List)request.getAttribute("medicine");
List<Medicine> medicine_more =(List)request.getAttribute("medicine_more");
String size =(String)request.getAttribute("size");
String key =(String)request.getAttribute("key");
%>


<div >
	<c:import url="navigation1.jsp"></c:import>
</div>
<form action="Querykey" >
<div style="float:right">
<input size=20 name="key"  ><input type="submit" value="搜索">
</div>
</form>
<!--侧边栏  -->
<div id="menu" style="width:20%;float:left;margin-left:20px;margin-top:20px">
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByType?type=2"style="color: black;text-decoration:none">菌类植物</a></summary>
			
				<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 2) {
				%>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a><br>
				<%
					}
					}
				%>

			
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByType?type=3"style="color: black;text-decoration:none">地衣苔藓类植物</a></summary>
			
				<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 3) {
				%>
				<a href="QueryById?id=<%=m.getMedicine_ID()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByType?type=5"style="color: black;text-decoration:none">蕨类植物</a></summary>
			
				<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 5) {
				%>
				<a href="QueryServlet?select=<%=m.getMedicine_name()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByType?type=6"style="color: black;text-decoration:none">裸子植物</a></summary>
			
				<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 6) {
				%>
				<a href="QueryServlet?select=<%=m.getMedicine_name()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByType?type=7"style="color: black;text-decoration:none">双子叶植物</a></summary>
			
				<%
					for (int i = 0; i < medicine.size(); i++) {
						Medicine m = medicine.get(i);
						if (m.getMedicine_planCategory() == 7) {
				%>
				<a href="QueryServlet?select=<%=m.getMedicine_name()%>" style="margin-left:20px"><%=m.getMedicine_name()%></a><br>
				<%
					}
					}
				%>
			</details>
		</div>
		<!--侧边栏end  -->
		
		<!-- 内容显示 -->
		<div id="content" style="width:70%;float:left;" >
		
		<div id="all" style="width:80%;">
		
<p>搜到与<%=key %>相关的记录共有<%=size %>条</p>
<%
for(int i=0;i<medicine_more.size();i++){
	Medicine m =medicine_more.get(i);%>
	<a  href="QueryById?id=<%=m.getMedicine_ID()%>" style="text-decoration:none"><%=m.getMedicine_name() %></a><br>
	
<%}
%>

							
						
	  </div>
										

</div>	
		<!-- 内容显示end -->




<div style="margin-top:100"  >
	<c:import url="footer.jsp"></c:import>
</div>

</body>
</html>