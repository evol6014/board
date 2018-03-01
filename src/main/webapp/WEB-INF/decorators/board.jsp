<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>

<style>
#div_root {
	width: 1100px;
	margin: 0px auto;
	margin-top: 20px;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
#div_top {
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #bcbcbc;
}
#div_side {
	width: 260px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}
#div_center {
	width: 780px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc
}
#div_bottom {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
#table {
	font-size: large;
}
</style>

<head>

	<meta charset="UTF-8">
	<!-- write.tag덕분에 에러 안남. -->
	<title><sitemesh:write property="title"/></title><!-- 합치고, 한곳에서 관리가능 -->
	
	<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.css">
	<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap-theme.css">
	<link rel="stylesheet" href="/webjars/animate.css/3.5.2/animate.css">
	
	<script type="text/javascript" src="/webjars/jquery/1.11.1/jquery.js"></script>	
	<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script type="text/javascript" src="/webjars/chartjs/2.6.0/Chart.bundle.js"></script>

	<sitemesh:write property="head"/>
	
	<!-- content assist를 위함. -->
	<c:if test="${false}">
		<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/animate.css">
	</c:if>
	
</head>
<body>
	<div id="div_root">
	
		<div id="div_top" align="center">
			<h1>
				<b>PORTFOLIO</b>
			</h1>
				<h5>Spring MVC + JPA</h5>
		</div>
		
		<div id="div_side">
			<table id="table">
				<thead>
					<tr>
						<th>
							<h1>
								<b>VERSION</b>
							</h1>
						<th>
					</tr>
					<tr style="height: 40px;">
						<td><a href="http://localhost:8080/board/list">JSP</a></td>
					</tr>
					<tr style="height: 40px;">
						<td><a href="http://localhost:8080/boards/list">Thymeleaf</a></td>
					</tr>
					<tr>
						<th>
						<hr style="border: 1px solid #bcbcbc; width: 210px;">
							<h1><b>TABLE</b></h1>
						<th>
					</tr>
					<tbody>
					<tr style="height: 40px;"> 
						<td><a href="http://localhost:8080/board/list">Board</a></td>
					</tr>
					<tr style="height: 40px;">
						<td><a href="http://localhost:8080/dept/list">Dept</a></td>
					</tr>
					<tr style="height: 40px;">
						<td><a href="http://localhost:8080/emp/list">Emp</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="div_center" class="animated fadeIn"> 
			<sitemesh:write property="body" />
		</div>

		<!-- SiteMesh 와 같은 방식 -->
		<div id="div_bottom" align="center">
			<h3>Made By</h3>
			<h5>-- Lee Dae Hee --</h5>
		</div>
	</div>
	
</body>
</html>