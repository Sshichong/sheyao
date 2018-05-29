<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="cn.sheyao.pojo.Medicine" %>
     <%@page import="cn.sheyao.pojo.Doctor1" %>
     <%@page import="cn.sheyao.pojo.Illness" %>
     <%@page import="cn.sheyao.pojo.Prescription" %>
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
List<Doctor1> doctor =(List)request.getAttribute("doctor");
Map<Integer,String> goodAts =(Map)request.getAttribute("map");
List<Doctor1> doctor_StartWith=(List)request.getAttribute("doctor_StartWith");
String doctor_title =(String)request.getAttribute("doctor_title");
Doctor1 doctor_one =(Doctor1)request.getAttribute("doctor_one");
Map<Illness,List<Prescription>> illnessAndprescription =(Map<Illness,List<Prescription>>)request.getAttribute("illnessAndprescription");
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
				List<Doctor1> doctorad =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
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
				List<Doctor1> doctoreh =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
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
				List<Doctor1> doctoril =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
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
				List<Doctor1> doctormp =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
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
				List<Doctor1> doctorqt =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
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
				List<Doctor1> doctorux =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
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
				List<Doctor1> doctoryz =new ArrayList();
					for (int i = 0; i < doctor.size(); i++) {
						Doctor1 d =doctor.get(i);
						
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
		
		
		<%
		if(doctor_title!=null){%>

		       <table border="1" style="width:100%" class="sp-grid-job">
		       <tbody>
				<col style="width: 10%" />  <!-- 姓名 -->
				<col style="width: 10%" />  <!--科室 -->
				<col style="width: 15%" />  <!--职称  -->
				<col style="width: 45%" /> <!--简介  -->
				<col style="width: 20%" /> <!--主要操作  -->

				<tr><th colspan="5"><%=doctor_title %></th></tr>
				<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
				<%for (int i = 0; i < doctor_StartWith.size(); i++) {
					Doctor1 d =doctor_StartWith.get(i);
					
					
					%>
					<tr><td ><%=d.getDoctor_name() %></td><td><%=d.getDoctor_department()%></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>	
			<%} %>
				</tbody>
		       </table>
			
	<%	}
		else if(doctor_one!=null){%>
			
				<div class="pos" style="width:200px;float:left">
				<p class="word1" style="margin-top:5px;margin-bottom:5px">
					<%=doctor_one.getDoctor_name()%>
					</p>
					<p><%=doctor_one.getDoctor_Birth() %></p>
					
				</div>	
				<div style="float:left;padding-left:350px">
				<img alt="tu" src="/upload/youcai.png" style="width:150px;height:180px" >
				</div>
				
				<div class=pos1 style="clear:both">
				<p class="word2">个人简介</p>
				<div style="border:1px #A9A9A9 none; width:100%; height:100px"><%=doctor_one.getDoctor_introduce()%></div>
				</div>
				
				
				
				<div class=pos1 style="margin-top:40px;margin-bottom:50px">
				<p class="word2">个人处方</p>
				<div style="border:1px #A9A9A9 none; width:100%; height:100px;padding-bottom:100px">
				<%
				
				//for(Map<Illness,List<Prescription>> illnessAndprescription_one:illnessAndprescription){
					Iterator iter =illnessAndprescription.entrySet().iterator();
					while(iter.hasNext()){
						Map.Entry<Illness,List<Prescription>> entry = (Map.Entry)iter.next();
						Illness illness =entry.getKey();
						List<Prescription> prescriptions =entry.getValue();
						
						StringBuffer sb =new StringBuffer();
						//sb.append(illness.getIllness_name()).append(":");
						%>
						<p><%=illness.getIllness_name() %></p>
						<%
						for(int i=0;i<prescriptions.size();i++){
							//sb.append(prescriptions.get(i).getPrescription_particulars()).append("\n");%>
							<p><%=prescriptions.get(i).getPrescription_particulars() %></p><br>
							
					<%	}
						
				
						
					}
					
				//}
				
				
				
				%>
				
				</div>
				</div>
				
			
	<%	}
		else{
		%>
					       <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">A-D</th></tr>
							<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctorad.size(); i++) {
								Doctor1 d =doctorad.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
								
								
									
						} %>
							</tbody>
					       </table>
					       
					       
					        <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">E-H</th></tr>
							<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctoreh.size(); i++) {
								Doctor1 d =doctoreh.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
								} %>
							</tbody>
					       </table>
					       
					        <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">I-L</th></tr>
							<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctoril.size(); i++) {
								Doctor1 d =doctoril.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
							
							} %>
							</tbody>
					       </table>
					       
					        <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">M-P</th></tr>
							<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctormp.size(); i++) {
								Doctor1 d =doctormp.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
						
							
							} %>
							</tbody>
					       </table>
					       
					        <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">Q-T</th></tr>
							<tr><th >姓名</th><th>科室</th><th >职称</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctorqt.size(); i++) {
								Doctor1 d =doctorqt.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
						
							
							} %>
							</tbody>
					       </table>
					       
					        <table border="1" style="width:100%" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">U-X</th></tr>
							<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctorux.size(); i++) {
								Doctor1 d =doctorux.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
							
							} %>
							</tbody>
					       </table>
					       
					        <table border="1" style="width:100%;margin-bottom:80px" class="sp-grid-job">
					       <tbody>
							<col style="width: 10%" />  <!-- 姓名 -->
							<col style="width: 10%" />  <!--科室 -->
							<col style="width: 15%" />  <!--职称  -->
							<col style="width: 45%" /> <!--简介  -->
							<col style="width: 20%" /> <!--主要操作  -->

							<tr><th colspan="5">Y-Z</th></tr>
							<tr><th >姓名</th><th>擅长</th><th >出生日期</th><th>简介</th><th >主要操作</th></tr>
							<%for (int i = 0; i < doctoryz.size(); i++) {
								Doctor1 d =doctoryz.get(i);
								Iterator iter = goodAts.entrySet().iterator();
								while(iter.hasNext()){
									Map.Entry<Integer,String> entry =(Map.Entry)iter.next();
									if(entry.getKey().equals(d.getDoctor_ID())){
									%>
										
										<tr><td ><%=d.getDoctor_name() %></td><td><%=entry.getValue() %></td><td><%=d.getDoctor_Birth() %></td><td ><%=d.getDoctor_introduce() %></td><td ><a href="#" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;</td></tr>
								<%	}
								}
							
							} %>
							</tbody>
					       </table>
					       
					       
				<%

		}
				%>	      

							
						
	  </div>
										

</div>	
		<!-- 内容显示end -->




<div style="margin-top:100"  >
	<c:import url="footer.jsp"></c:import>
</div>

</body>
</html>