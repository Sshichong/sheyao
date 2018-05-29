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
<form action="QueryDoctorkey" >
<div style="float:right">
<input size=20 name="key"  ><input type="submit" value="搜索">
</div>
</form>
<!--侧边栏  -->
<div id="menu" style="width:20%;float:left;margin-left:20px;margin-top:20px">
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">内科</a></summary>
			
				<%-- <%
				List<Doctor1> doctorad =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						if (d.getDoctor_forSelect().startsWith("a")||d.getDoctor_forSelect().startsWith("b")||d.getDoctor_forSelect().startsWith("c")||d.getDoctor_forSelect().startsWith("d")) {
							doctorad.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">发烧</a><br>
				<%-- <%
					}
					}
				%> --%>

			
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">外科</a></summary>
			
				<%-- <%
				List<Doctor1> doctoreh =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("e")||d.getDoctor_forSelect().startsWith("f")||d.getDoctor_forSelect().startsWith("g")||d.getDoctor_forSelect().startsWith("h")) {
							doctoreh.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">蜈蚣咬伤</a><br>
			<%-- 	<%
					}
					}
				%> --%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">妇科</a></summary>
			
				<%-- <%
				List<Doctor1> doctoril =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("i")||d.getDoctor_forSelect().startsWith("j")||d.getDoctor_forSelect().startsWith("k")||d.getDoctor_forSelect().startsWith("l")) {
							doctoril.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">产后腹痛</a><br>
				<%-- <%
					}
					}
				%> --%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">儿科</a></summary>
			
				<%-- <%
				List<Doctor1> doctormp =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("m")||d.getDoctor_forSelect().startsWith("n")||d.getDoctor_forSelect().startsWith("o")||d.getDoctor_forSelect().startsWith("p")) {
							doctormp.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">小儿哮喘</a><br>
				<%-- <%
					}
					}
				%> --%>
			</details>
			
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">五官科</a></summary>
			
				<%-- <%
				List<Doctor1> doctorqt =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("q")||d.getDoctor_forSelect().startsWith("r")||d.getDoctor_forSelect().startsWith("s")||d.getDoctor_forSelect().startsWith("t")) {
							doctorqt.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">鼻炎</a><br>
				<%-- <%
					}
					}
				%> --%>
			</details>
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">痧症科</a></summary>
			
				<%-- <%
				List<Doctor1> doctorux =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("u")||d.getDoctor_forSelect().startsWith("v")||d.getDoctor_forSelect().startsWith("w")||d.getDoctor_forSelect().startsWith("x")) {
							doctorux.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">痧气</a><br>
				<%-- <%
					}
					}
				%> --%>
			</details>
			
			<details> 
			<!-- <summary><a href="QueryServlet?sort=2"style="color: black">菌类植物</a></summary> -->
			<summary><a href="#"style="color: black;text-decoration:none">风湿与关节疾病</a></summary>
			
				<%-- <%
				List<Doctor1> doctoryz =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
						if (d.getDoctor_forSelect().startsWith("y")||d.getDoctor_forSelect().startsWith("z")) {
							doctoryz.add(d);
				%> --%>
				<a href="QueryDoctorById?id=1" style="margin-left:20px">风湿</a><br>
				<%-- <%
					}
					}
				%> --%>
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">呼吸科</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">支气管炎</a>
			
			</details>
			
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">消化科</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">食积</a>
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">神经科</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">失眠</a>
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">泌尿生殖科</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">肾病</a>
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">皮肤科</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">冻疮</a>
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">传染科</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">七日风</a>
			
			</details>
			
			<details>
			<summary><a href="#"style="color: black;text-decoration:none">其他</a></summary>
			<a href="QueryDoctorById?id=1" style="margin-left:20px">骨底烧</a>
			
			</details>
		</div>
		<!--侧边栏end  -->
		
		<!-- 内容显示 -->
		<div id="content" style="width:70%;float:left;" >
		
		<div id="all" style="width:80%;">
		
		 <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 病症 -->
							<col style="width: 20%" />  <!--献方畲医/文献来源-->
							<col style="width: 20%" />
							<col style="width: 40%" />  <!--药方  -->
							<col style="width: 10%" /> <!--主要操作  -->


							<tr><th colspan="5">内科</th></tr>
							<tr><th >病症</th><th>献方畲医</th><th>文献来源</th><th >药方</th><th >主要操作</th></tr>
							
						<tr><td >发烧</td><td>雷后兴</td><td>无</td><td >食凉茶+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>	
						<tr><td >咳嗽</td><td>雷后兴</td><td>无</td><td >油菜+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >便秘</td><td>雷后兴</td><td>无</td><td >白果+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >哮喘</td><td>雷后兴</td><td>无</td><td >浙江蜡梅+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >中风</td><td>雷后兴</td><td>无</td><td >青菜+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >头痛</td><td>雷后兴</td><td>无</td><td >白菜+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >伤食</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >消渴</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >逆呃</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
					
							</tbody>
					       </table>
					       
					       <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 病症 -->
							<col style="width: 20%" />  <!--献方畲医/文献来源-->
							<col style="width: 20%" />
							<col style="width: 40%" />  <!--药方  -->
							<col style="width: 10%" /> <!--主要操作  -->


							<tr><th colspan="5">外科</th></tr>
							<tr><th >病症</th><th>献方畲医</th><th>文献来源</th><th >药方</th><th >主要操作</th></tr>
							
						<tr><td >肠痈</td><td>雷后兴</td><td>无</td><td >食凉茶+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>	
						<tr><td >蛇串疮</td><td>雷后兴</td><td>无</td><td >油菜+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >内伤</td><td>雷后兴</td><td>无</td><td >白果+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >哮喘</td><td>雷后兴</td><td>无</td><td >浙江蜡梅+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >伤筋</td><td>雷后兴</td><td>无</td><td >青菜+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >头痛</td><td>雷后兴</td><td>无</td><td >白菜+3份_鲜猪油+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >湿疮</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >消渴</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >逆呃</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >打伤</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >癫狗咬伤</td><td>雷后兴</td><td>无</td><td >食凉茶+3份_狗血+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >石锋割伤</td><td>雷后兴</td><td>无</td><td >食凉茶+3份_鸡血+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >鼓胀</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >癥瘕</td><td>雷后兴</td><td>无</td><td >食凉茶+3份_鸭血+1份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						<tr><td >烧伤</td><td>雷后兴</td><td>无</td><td >食凉茶+3份</td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
						
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