<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" rev="stylesheet" href="${ctx }/staticfile/css/shouyesuoyou.css" type="text/css" media="all" />
<title>畲医药资源库管理</title>
<script type="text/javascript">  
    function startmarquee(lh, speed, delay) {  
        var t;  
        var oHeight = 32;/** div的高度 **/  
        var p = false;  
        var o = document.getElementById("show");  
        var preTop = 0;  
        o.scrollTop = 0;  
        function start() {  
            t = setInterval(scrolling, speed);  
            o.scrollTop += 1;  
        }  
        function scrolling() {  
            if (o.scrollTop % lh != 0  
                    && o.scrollTop % (o.scrollHeight - oHeight - 1) != 0) {  
                preTop = o.scrollTop;  
                o.scrollTop += 1;  
                if (preTop >= o.scrollHeight || preTop == o.scrollTop) {  
                    o.scrollTop = 0;  
                }  
            } else {  
                clearInterval(t);  
                setTimeout(start, delay);  
            }  
        }  
        setTimeout(start, delay);  
    }  
    window.onload=function(){  
        /**startmarquee(一次滚动高度,速度,停留时间);**/  
        startmarquee(36, 20, 3000);  
    }  
  
</script>  
</head>
<body >
<div class="center-div-top" id="cdt">

<div class="xianfang" >
          <a href=#> <img alt="xianfang" src="${ctx }/staticfile/images/xianfangdianci.PNG" ></a>
</div>
</div>
<div  class="cdc" id="cdc">
<!-- <style>
            .pic1 .img1-2{display: none;}
            .pic1:hover .img1-1{display: none;}
            .pic1:hover .img1-2{display: block;}
            
            .pic2 .img2-2{display: none;}
            .pic2:hover .img2-1{display: none;}
            .pic2:hover .img2-2{display: block;}
            
            .pic3 .img3-2{display: none;}
            .pic3:hover .img3-1{display: none;}
            .pic3:hover .img3-2{display: block;}
            
            .pic4 .img4-2{display: none;}
            .pic4:hover .img4-1{display: none;}
            .pic4:hover .img4-2{display: block;}
</style> -->
  <div  class="pic1"id="cdc1">
<!--   <img class="img1-1 cdc1" src="images/y-t.png" /> -->
 <a href="toMedicine"> <img alt="yao" src="${ctx }/staticfile/images/yao.png"class="cdc1 img1-2"></a>
   </div>
   

   
   
   <div class="pic3" id="cdc3">
<!--    <img class="img3-1 cdc3" src="images/yi-t.png" /> -->
   <a href="toDoctor"><img alt="zheng" src="${ctx }/staticfile/images/yi.png"class="cdc3 img3-2"></a>
   </div>
   
       <div class="pic2" id="cdc2">
<!--    <img class="img2-1 cdc2" src="images/f-t.png" /> -->
   <a href="toPrescription"><img alt="fang" src="${ctx }/staticfile/images/fang.png"class="cdc2 img2-2"></a>
   </div>
   
   
   <div class="pic4"id="cdc4">
<!--    <img class="img4-1 cdc4" src="images/t-t.png" /> -->
   <a href="toStatistics"><img alt="yi" src="${ctx }/staticfile/images/tong.png"class="cdc4 img4-2"></a>
   </div>
   
</div>

 
<div class="center-div-bottom" id="cdb">
<input class="sou1" type="text"placeholder="学名、中文名、首字母">
 <input class="sou2" type="button" value="" />
<br>

<div class="wenzijieshao">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;畲医药是民族医药的重要组成部分，是畲民在其特定的历史条件和特殊的地理环境中，为求生存与繁衍而逐渐积累而成的医疗方法，它具有独特的疾病观、疾病分类法和特殊疗法，对某些疾病治疗有药到病除之效，具体有典型的民族色彩。
    畲族是个只有语言没有文字的少数民族，受政治、经济、文化、历史、地理等诸多因素影响，畲医药在民间流程的方式主要是口传身穿，而且不外传、传男不传女，导致不少宝贵的医疗经验失传。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为开发利用畲医药资源服务于人类健康，畲医药资源数据库系统对已经出版的《中国畲族医药学》、《中国畲药学》等资料进行整合与采集，提供了包含？？类？？种畲药以及？？畲医民间处方，供广大畲医药爱好者查询使用。
</div>
<!-- <div class="kepu">
科普：
</div>
</div>
<div class="xinwen">
最新热点：

</div> -->

<div style="background-color: #eee;paddint-top:10px align="left top:145%;
	left:20%;
	position:absolute;
	height:8px;
	width:60%;
    margin: 20px 0;"></div>
<div class="wrapper">
        <div class="panel panel-footer clearfix">
            <div class="item">
            <div>畲医药发展前沿</div>
			 <a href=#> 1</a><br>
            <a href=#> 2</a><br>
            <a href=#> 3</a><br>
			<a href=#> 4</a><br>
            <a href=#> more……</a><br>
            </div>
            <div class="item">
            <div>畲医药知识科普</div>
			 <a href=#> 1</a><br>
            <a href=#> 2</a><br>
            <a href=#> 3</a><br>
            <a href=#> 4</a><br>
            <a href=#> more……</a><br>
            </div>
</div>
        </div>
    </div>
</body>
</html>