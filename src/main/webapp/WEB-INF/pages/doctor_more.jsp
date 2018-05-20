<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@page import="cn.sheyao.pojo.Doctor" %>
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
List<Doctor> doctor =(List)request.getAttribute("doctor");
List<Doctor> doctor_more =(List)request.getAttribute("doctor_more");
String key =(String)request.getAttribute("key");
String size =(String)request.getAttribute("size");
%>


<div >
	<c:import url="navigation1.jsp"></c:import>
</div>
<form action="QueryDoctorkey" >
<div style="float:right">
<input size=20 name="key"  ><input type="submit" value="搜索">
</div>
</form>
<!--侧边栏  -->
<div id="menu" style="width:20%;float:left;margin-left:20px;margin-top:20px">
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=a&StartWith=b&StartWith=c&StartWith=d"style="color: black;text-decoration:none">A-D</a></summary>
			
				<%
				List<Doctor> doctorad =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						if (d.getDoctor_forSelect().startsWith("a")||d.getDoctor_forSelect().startsWith("b")||d.getDoctor_forSelect().startsWith("c")||d.getDoctor_forSelect().startsWith("d")) {
							doctorad.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				<%
					}
					}
				%>

			
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=e&StartWith=f&StartWith=g&StartWith=h"style="color: black;text-decoration:none">E-H</a></summary>
			
				<%
				List<Doctor> doctoreh =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("e")||d.getDoctor_forSelect().startsWith("f")||d.getDoctor_forSelect().startsWith("g")||d.getDoctor_forSelect().startsWith("h")) {
							doctoreh.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=i&StartWith=j&StartWith=k&StartWith=l"style="color: black;text-decoration:none">I-L</a></summary>
			
				<%
				List<Doctor> doctoril =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("i")||d.getDoctor_forSelect().startsWith("j")||d.getDoctor_forSelect().startsWith("k")||d.getDoctor_forSelect().startsWith("l")) {
							doctoril.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=m&StartWith=n&StartWith=o&StartWith=p"style="color: black;text-decoration:none">M-P</a></summary>
			
				<%
				List<Doctor> doctormp =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("m")||d.getDoctor_forSelect().startsWith("n")||d.getDoctor_forSelect().startsWith("o")||d.getDoctor_forSelect().startsWith("p")) {
							doctormp.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=q&StartWith=r&StartWith=s&StartWith=t"style="color: black;text-decoration:none">Q-T</a></summary>
			
				<%
				List<Doctor> doctorqt =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("q")||d.getDoctor_forSelect().startsWith("r")||d.getDoctor_forSelect().startsWith("s")||d.getDoctor_forSelect().startsWith("t")) {
							doctorqt.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=u&StartWith=v&StartWith=w&StartWith=x"style="color: black;text-decoration:none">U-X</a></summary>
			
				<%
				List<Doctor> doctorux =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("u")||d.getDoctor_forSelect().startsWith("v")||d.getDoctor_forSelect().startsWith("w")||d.getDoctor_forSelect().startsWith("x")) {
							doctorux.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
				<%
					}
					}
				%>
			</details>
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="QueryByStartWith?StartWith=y&StartWith=z"style="color: black;text-decoration:none">Y-Z</a></summary>
			
				<%
				List<Doctor> doctoryz =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("y")||d.getDoctor_forSelect().startsWith("z")) {
							doctoryz.add(d);
				%>
				<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" style="margin-left:20px"><%=d.getDoctor_name()%></a><br>
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
		for(int i=0;i<doctor_more.size();i++){
			Doctor d=doctor_more.get(i);
		%>
			<a href="QueryDoctorById?id=<%=d.getDoctor_ID()%>" ><%=d.getDoctor_name() %></a><br>
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