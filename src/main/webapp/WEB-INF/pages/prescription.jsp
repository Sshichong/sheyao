<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@page import="cn.sheyao.pojo.Doctor1" %>
     <%@page import="cn.sheyao.pojo.Prescription" %>
     <%@page import="cn.sheyao.pojo.Illness" %>
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
List<List<Illness>> illness = (List<List<Illness>>)request.getAttribute("illness");
Map<Integer,List<Prescription>> map =(Map)request.getAttribute("map");
Map<Illness,List<Prescription>> typeMap =(Map)request.getAttribute("typeMap");
String type=(String)request.getAttribute("type");
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
			<summary><a href="IllnessType?type=内科"style="color: black;text-decoration:none">内科</a></summary>
			
			<%
			for(int i=0;i<illness.get(0).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(0).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">外科</a></summary>
			<%
			for(int i=0;i<illness.get(1).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(1).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">妇科</a></summary>
			<%
			for(int i=0;i<illness.get(2).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(2).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">儿科</a></summary>
			<%
			for(int i=0;i<illness.get(3).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(3).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">五官科</a></summary>
			<%
			for(int i=0;i<illness.get(4).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(4).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">痧症科</a></summary>
			<%
			for(int i=0;i<illness.get(5).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(5).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">风湿与关节疾病</a></summary>
			<%
			for(int i=0;i<illness.get(6).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(6).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">呼吸科</a></summary>
			<%
			for(int i=0;i<illness.get(7).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(7).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			</details>
			
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">消化科</a></summary>
			<%
			for(int i=0;i<illness.get(8).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(8).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">神经科</a></summary>
			<%
			for(int i=0;i<illness.get(9).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(9).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">泌尿生殖科</a></summary>
			<%
			for(int i=0;i<illness.get(10).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(10).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">皮肤科</a></summary>
			<%
			for(int i=0;i<illness.get(11).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(11).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">传染科</a></summary>
			<%
			for(int i=0;i<illness.get(12).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(12).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">其他</a></summary>
			<%
			for(int i=0;i<illness.get(13).size();i++){
			%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px"><%=illness.get(13).get(i).getIllness_name()%></a><br>
		<%	}
			%>
			
			
			</details>
		</div>
		<!--侧边栏end  -->
		
		<!-- 内容显示 -->
		<div id="content" style="width:70%;float:left;" >
		
		<div id="all" style="width:80%;margin-bottom:50px">
		
		<%
		if(type!=null){%>
			 <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 20%" />  <!-- 病症 -->
							<col style="width: 60%" />  <!--献方畲医/文献来源-->
							
							<col style="width: 20%" /> <!--主要操作  -->


							<tr><th colspan="3"><%=type %></th></tr>
							<tr><th >病症</th><th >药方</th><th >主要操作</th></tr>
							<%
							Iterator iter =typeMap.entrySet().iterator();
							
							while(iter.hasNext()){
								StringBuffer sb =new StringBuffer();
								Map.Entry<Illness,List<Prescription>> entry =(Map.Entry)iter.next();
								for(int i=0;i<entry.getValue().size();i++){
									sb.append(entry.getValue().get(i).getPrescription_particulars()).append("<br>");	
							}%>
								<tr><td ><%=entry.getKey().getIllness_name()%></td><td ><%=sb %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
							<%}
							%>
								
						
							
						
							</tbody>
					       </table>
			
	<%	}else{ %>
			 <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 20%" />  <!-- 病症 -->
							<col style="width: 60%" />  <!--献方畲医/文献来源-->
							
							<col style="width: 20%" /> <!--主要操作  -->


							<tr><th colspan="3">内科</th></tr>
							<tr><th >病症</th><th >药方</th><th >主要操作</th></tr>
							<%
							for(int i=0;i<illness.get(0).size();i++){
							StringBuffer sb =new StringBuffer();
							Iterator iter =map.entrySet().iterator();
							while(iter.hasNext()){
								Map.Entry<Integer,List<Prescription>>  entry =(Map.Entry)iter.next();
								if(entry.getKey().equals(illness.get(0).get(i).getIllness_ID())){
									
									for(int j=0;j<entry.getValue().size();j++){
										sb.append(entry.getValue().get(j).getPrescription_particulars()).append("<br>");
									}
									
								}
							}
							
							%>
								<tr><td ><%=illness.get(0).get(i).getIllness_name() %></td><td ><%=sb %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
							<%}
							%>
							
						
							</tbody>
					       </table>
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