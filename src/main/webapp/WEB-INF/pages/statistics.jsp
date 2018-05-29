<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@page import="cn.sheyao.pojo.Doctor1" %>
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



<div >
	<c:import url="navigation1.jsp"></c:import>
</div>
<!-- <form action="QueryDoctorkey" >
<div style="float:right">
<input size=20 name="key"  ><input type="submit" value="搜索">
</div>
</form> -->
<!--侧边栏  -->
<div id="menu" style="width:20%;float:left;margin-left:20px;margin-top:50px;">
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">畲药</a></summary>
		
				<a href="QueryDoctorById?id=1" style="margin-left:20px">发烧</a><br>
			
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">畲医</a></summary>
		
				<a href="QueryDoctorById?id=1" style="margin-left:20px">蜈蚣咬伤</a><br>
			
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">药方</a></summary>
	
				<a href="QueryDoctorById?id=1" style="margin-left:20px">产后腹痛</a><br>
			
			</details>
			
		</div>
		<!--侧边栏end  -->
		
		<!-- 内容显示 -->
		<div id="content" style="width:70%;float:left;margin-top:40px" >
		
		<div id="all" style="width:80%;">
		 <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 病症 -->
							<col style="width: 20%" />  <!--献方畲医/文献来源-->
							<col style="width: 20%" />
							<tr><th colspan="3">畲药</th></tr>
							<tr><th >序号</th><th>畲药</th><th>查询次数</th>
							
						<tr><td >1</td><td>食凉茶</td><td>102024</td>	
						<tr><td >2</td><td>白果</td><td>9237</td>
						<tr><td >3</td><td>独角郎衣</td><td>8662</td>
						<tr><td >4</td><td>臭树柴</td><td>7823</td>
						<tr><td >5</td><td>嘎狗粘</td><td>6244</td>
						<tr><td >6</td><td>搁公扭根</td><td>5234</td>
						<tr><td >7</td><td>石壁果果</td><td>4232</td>
						<tr><td >8</td><td>酸梅根</td><td>3435</td>
						
					
							</tbody>
					       </table>
					        <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 病症 -->
							<col style="width: 20%" />  <!--献方畲医/文献来源-->
							<col style="width: 20%" />
							<tr><th colspan="3">畲医</th></tr>
							<tr><th >序号</th><th>畲医</th><th>查询次数</th>
							
						<tr><td >1</td><td>雷后兴</td><td>102024</td>	
						<tr><td >2</td><td>雷新颖</td><td>9237</td>
						<tr><td >3</td><td>李水福</td><td>8662</td>
						<tr><td >4</td><td>小新</td><td>7823</td>
						<tr><td >5</td><td>小白</td><td>6244</td>
						<tr><td >6</td><td>搁公扭根</td><td>5234</td>
						<tr><td >7</td><td>石壁果果</td><td>4232</td>
						<tr><td >8</td><td>酸梅根</td><td>3435</td>
						
					
							</tbody>
					       </table>
					       
						
	  </div>
										

</div>	
		<!-- 内容显示end -->




<div style="margin-top:100"  >
	<c:import url="footer.jsp"></c:import>
</div>

</body>
</html>