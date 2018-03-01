<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dept register.jsp</title>

<c:if test="${false}">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.css">
</c:if>

</head>
<body>
	<div class="panel-heading"><b>Dept Register Page</b></div>
	<div class="panel-body">

		<form action="/dept/register" method="post">

			<div class="form-group">
				<label>Deptno</label> 
				<input class="form-control" name="deptno" value="${vo.deptno}"/>
				<p class="help-block">Deptno text here.</p>
			</div>

			<div class="form-group">
				<label>Dname</label>
				<input class="form-control" name="dname" value="${vo.dname}"/>
			</div>

			<div class="form-group">
				<label>Loc</label> 
				<input class="form-control" name="loc" value="${vo.loc}"/>
			</div>
			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-primary">Reset Button</button>
		</form>

	</div>




</body>
</html>