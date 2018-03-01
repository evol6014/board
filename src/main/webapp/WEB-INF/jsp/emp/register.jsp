<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp register.jsp</title>

<c:if test="${false}">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.css">
</c:if>

</head>
<body>
	<div class="panel-heading"><b>Emp Register Page</b></div>
	<div class="panel-body">

		<form action="/emp/register" method="post">
			
			<div class="form-group">
				<label>Empno</label> 
				<input class="form-control" name="empno" value="${vo.empno}" />
			</div>
			<div class="form-group">
				<label>Ename</label> <input class="form-control" name="ename" value="${vo.ename}" />
				<p class="help-block">Ename text here.</p>
			</div>
			<div class="form-group">
				<label>Gender</label> <input class="form-control" name="gender" value="${vo.gender}" />
			</div>
			<div class="form-group">
				<label>Job</label> <input class="form-control" name="job" value="${vo.job}" />
			</div>
			<div class="form-group">
				<label>Manager</label> <input class="form-control" name="mgr" value="${vo.mgr}" />
			</div>
			<div class="form-group">
				<label>Hiredate</label> <input class="form-control" name="hiredate" value="${vo.hiredate}" />
			</div>
			<div class="form-group">
				<label>Salary</label> <input class="form-control" name="sal" value="${vo.sal}" />
			</div>
			<div class="form-group">
				<label>Commission</label> <input class="form-control" name="comm" value="${vo.comm}" />
			</div>
			<div class="form-group">
				<label>Deptno</label> <input class="form-control" name="dept" value="${vo.dept.deptno}" />
			</div>
			
			
			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-primary">Reset Button</button>
		</form>

	</div>




</body>
</html>