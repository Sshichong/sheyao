<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" rev="stylesheet" href="${ctx }/staticfile/css/shouyesuoyou.css" type="text/css" media="all" />
<title>畲医药资源库管理</title>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: 1px solid #e7e7e7;
    background-color: #f3f3f3;
    width: 100%;  
    height:35px 
}

li {
    float: left;
}

li a {
    display: block;
    color: #666;
    text-align: center;
    padding: 8px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #ddd;
}

li a.active {
    color: white;
    background-color: #B5D6F2;
}
</style>
</head>
<body>
 <div class="xuanfu" id="xf" style="background:url('${ctx }/staticfile/images/top.jpeg');height:45px ">
		  <div class="fl searchbar" id="lef" style="padding-top:5px">
            <input id="txt_key" type="text" name="q" placeholder="学名、中文名、首字母"  class="field" style="display:none" />
                    <input id="but_search" class="submit" type="button" value="" />
          </div>
  
			<img alt="logo1" src="${ctx }/staticfile/images/caobenti.jpg"class="cdti2" style="margin-left:490px">
			
		<div class="cdti" style="padding-top:5px">
			畲医药资源库管理

			</div>
          <div  >
         
            
          </div>
          
          <div class="fl right" id="rig" style="padding-top:5px" >
          
          <input id="dr" type="button" value="登录" >
          <input id="zc" type="button" value="注册">
          </div>
 </div>
 <div style="margin-top:45px;width:100%">
  <ul>
  <li><a class="index" href="index">首页</a></li>
  <li><a href="toMedicine">畲药</a></li>
  <li><a href="toDoctor">畲医</a></li>
  <li><a href="toPrescription">药方</a></li>
  <li><a href="toStatistics">统计</a></li>
</ul>
 </div> 
</body>
</html>