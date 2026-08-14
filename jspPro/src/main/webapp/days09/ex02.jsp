<%@page import="java.text.DecimalFormat"%>
<%@page import="days09.FormatUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 10:08:13</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   [EL 메서드 사용] 
   
   FormatUtil.java
   ㄴ static 메서드 선언 -> 호출
   ㄴ 인스턴스 메서드 선언 ->호출
   
  </xmp>
 <% 
 long price= 22345;
 request.setAttribute("price", price); //이렇게 저장해야 EL에서 price사용 가능.
 
 %>
 <!-- JSTL 형식화 가능 -->
 >price(JSTL:fmt) : <fmt:formatNumber value= "${price}" pattern= "#,##0"/> <br>
 
 <!--static 메서드 호출  -->
 >price(EL) : ${FormatUtil.staticNumber(price, "#,##0")} <br> 
 <!--instance 메서드 호출  -->
 <% FormatUtil fObj = new FormatUtil();
 request.setAttribute("fObj", fObj);
 
 %>
 >price(EL) : ${fObj.staticNumber(price, "#,##0")} <br> 
 <!-- EL쓰고싶으면 scope나 리퀘스트에 저장... -->
 <hr>
 <h2>주석에 $이표현식 넣치마!!</h2>
 
 >price : <%=price %><br>
 >price : <%=String.format("%,d", price) %><br>
 <%
 	String pattern = "##,###";
 	DecimalFormat df = new DecimalFormat(pattern);
 %>
 > price: <%=df.format(price) %>
 <!--세 자리마다 콤마를 출려갛기. ..  -->
 
 
</div>
<script>
</script>
</body>
</html>