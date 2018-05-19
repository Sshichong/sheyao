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
List<Medicine> medicine_date =(List)request.getAttribute("medicine_date");
List<Medicine> medicine_type =(List)request.getAttribute("medicine_type");
Medicine medicine_one=(Medicine)request.getAttribute("medicine_one");
// out.print(medicine_one);
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
		
		<%
		if(medicine_date!=null){
		%>

		<!--最近添加  -->
	<!-- 	<table border="1" style="width: 100%" class="sp-grid-job">
		<tbody>
						<col style="width: 7%" />
						畲药名
						<col style="width: 8%" />
						异名 
						<col style="width: 10%" />
						畲药药性 
						<col style="width: 25%" />
						原植物 
						<col style="width: 20%" />
						时间 
						<col style="width: 25%" />
						主要操作 
						<tr>
							<th colspan="6">最近添加</th>
						</tr>
						<tr>
							<th>畲药名</th>
							<th>异名</th>
							<th>畲药药性</th>
							<th>原植物</th>
							<th>添加时间</th>
							<th>主要操作</th>
						</tr> -->
						<%
							for (int i=0;i<medicine_date.size();i++) {
									Medicine m =medicine_date.get(i);
						%>
					<%-- 	<tr>
							<td><%=m.getMedicine_name()%></td>
							<td><%=m.getMedicine_anotherName()%></td>
							<td><%=m.getMedicine_property()%></td>
							<td><%=m.getMedicine_introduce()%></td>
							<td><%=m.getMedicine_date()%></td>
							<td><a href="QueryServlet?select=<%=m.getMedicine_name()%>"
								target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a
								href="modifyServlet?select=<%=m.getMedicine_name()%>"
								target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a
								href="deleteServlet?select=<%=m.getMedicine_name()%>">删除</a>&nbsp;&nbsp;&nbsp;<a>恢复</a></td>
						</tr>
 --%>
						<%	
							}%>
					<!-- </tbody>
					</table> -->
					
					<!--菌类植物  -->
					<table border="1" style="width:100%" class="sp-grid-job">
					<tbody>
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->

							<tr><th colspan="7">菌类植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==2){
									if(m.getMedicine_deleteTag()==null||m.getMedicine_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ><%=m.getMedicine_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<%-- <a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a> --%></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							</tbody>
					       </table>
					       
					       <!--地衣苔藓类植物  -->
					       <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->

							<tr><th colspan="7">地衣苔藓类植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==3){
									if(m.getMedicine_deleteTag()==null||m.getMedicine_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ><%=m.getMedicine_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							</tbody>
					       </table>
					       
					       <!-- 蕨类植物 -->
					        <table border="1" style="width:100%" class="sp-grid-job">
					        <tbody>
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->

							<tr><th colspan="7">蕨类植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==5){
									if(m.getMedicine_deleteTag()==null||m.getMedicine_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ><%=m.getMedicine_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							</tbody>
					       </table>
					       
					       
					       <!--裸子植物  -->
					        <table border="1" style="width:100%" class="sp-grid-job">
					        <tbody>
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->

							<tr><th colspan="7">裸子植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==6){
									if(m.getMedicine_deleteTag()==null||m.getMedicine_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ><%=m.getMedicine_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							</tbody>
					       </table>
					       
					       <!-- 双子叶植物 -->
					       <table border="1" style="width:100%;margin-bottom:80px" class="sp-grid-job">
					       <tbody>
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->

							<tr><th colspan="7">双子叶植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medicine m:medicine){
								if(m.getMedicine_planCategory()==7){
									if(m.getMedicine_deleteTag()==null||m.getMedicine_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ><%=m.getMedicine_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							</tbody>
							</table>
							
							
							
						<%	}
							%>
							<%
							if(medicine_type!=null){%>
							<!--根据类型找到畲药记录  -->
							
							
						    <table border="1" style="width:100%;margin-bottom:80px" class="sp-grid-job">
						    <tbody>
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 20%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->
							<%
							Medicine m1=medicine_type.get(0);
							int leiming =m1.getMedicine_planCategory();
							String strleiming=String.valueOf(leiming);
							if(strleiming.equals("2")){
								strleiming="菌类植物";
							}else if(strleiming.equals("3")){
								strleiming="地衣苔藓类植物";
							}else if(strleiming.equals("5")){
								strleiming="蕨类植物";
							}else if(strleiming.equals("6")){
								strleiming="裸子植物";
							}else if(strleiming.equals("7")){
								strleiming="双子叶植物";
							}
							%>

							<tr><th colspan="7"><%=strleiming %></th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medicine m:medicine_type){%>
								<tr><td ><%=m.getMedicine_name() %></td><td><%=m.getMedicine_anotherName()%></td><td><%=m.getMedicine_property() %></td><td ><%=m.getMedicine_distribution() %></td><td ><%=m.getMedicine_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedicine_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedicine_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedicine_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
						<%	}
							%>
							
							
						</tbody>
						</table>
								
							<%}
							if(medicine_one!=null){%>
								<div id="wenzi" style="width:73%">
						<div class="posa">
							<span class="word1"><%=medicine_one.getMedicine_name()%></span><span
								style="padding-left: 10px"><%=medicine_one.getMedicine_property()%></span>
							<p class="word">
								<%=medicine_one.getMedicine_anotherName()%>
							</p>

						</div>

						<div class=pos1>
							<p class="word2">原植物</p>
							<div style="border:1px #A9A9A9 solid; width:100%; height:200px"><%=medicine_one.getMedicine_anotherName()%></div>
						</div>
						<div class="pos">
							<p class="word2">生境分布</p>
							<p class="word3">
								<%=medicine_one.getMedicine_anotherName()%>
							</p>

						</div>
						<div class="pos">
							<p class="word2">采收加工</p>
							<p class="word3">
								<%=medicine_one.getMedicine_anotherName()%>
							</p>

						</div>
						<div class=pos1>
							<p class="word2">主治用法</p>
							<div style="border:1px #A9A9A9 solid; width:100%; height:200px"><%=medicine_one.getMedicine_anotherName()%></div>
						</div>
					</div>
				
					<div id="tu">
						<h2>标志图片</h2>
						<br>
						<div style="background: #F0F0F0; width: 210px; height: 130px">
							
								<img  src="picture/<%=medicine_one.getMedicine_plantSeed() %>"
								width="210px" height="130px">
						</div>
						<br>
						<h2>图册</h2>
						<div style="background: #F0F0F0; width: 150px; height: 150px">
						<img width="150px"  height="150px" src="picture/<%=medicine_one.getMedicine_plantJuvenile()%>" >
						</div>
						<br>
						<div style="background: #F0F0F0; width: 150px; height: 150px">
						<img alt="222" src="picture/<%=medicine_one.getMedicine_plantAdult()%>" width="150px"  height="150px">
						</div>

					</div>
							
							<%
							}
							%>
							
							
						
							</div>
										

</div>	
		<!-- 内容显示end -->
</div>



<div style="margin-top:100"  >
	<c:import url="footer.jsp"></c:import>
</div>

</body>
</html>