<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" rev="stylesheet" href="${ctx }/staticfile/css/shouyesuoyou.css" type="text/css" media="all" />
<title>畲医药资源库管理</title>
</head>
<body>
 <div class="xuanfu" id="xf" style="background:url('${ctx }/staticfile/images/top.jpeg') ">
		  <div class="fl searchbar" id="lef">
            <input id="txt_key" type="text" name="q" placeholder="学名、中文名、首字母"  class="field"  />
                    <input id="but_search" class="submit" type="button" value="" />
          </div>
  
			<img alt="logo1" src="${ctx }/staticfile/images/caobenti.jpg"class="cdti2">
		<div class="cdti">
			畲医药资源库管理

			</div>
          <div  id="cen">
            
          </div>
          
          <div class="fl right" id="rig">
          
          <input id="dr" type="button" value="登录">
          <input id="zc" type="button" value="注册">
          </div>
 </div> 
</body>
</html>