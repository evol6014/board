<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp view.jsp</title>

<c:if test="${false}">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.css">
</c:if>

</head>
<body>
	<div class="panel-heading"><b>Emp View Page</b></div>
	<div class="panel-body">

		<div class="form-group">
			<label>Empno</label> 
			<input class="form-control" name="empno" value="${vo.empno}" readonly="readonly" />
		</div>

		<div class="form-group">
			<label>Ename</label> 
			<input class="form-control" name="ename" value="${vo.ename}" readonly="readonly" />
			<p class="help-block">Ename text here.</p>
		</div>

		<div class="form-group">
			<label>Gender</label> 
			<input class="form-control" name="gender" value="${vo.gender}" readonly="readonly" />
		</div>
		
		<div class="form-group">
			<label>Job</label> 
			<input class="form-control" name="job" value="${vo.job}" readonly="readonly" />
		</div>
		
		<div class="form-group">
			<label>Manager</label> 
			<input class="form-control" name="mgr" value="${vo.mgr.ename}" readonly="readonly" />
		</div>
		
		<div class="form-group">
			<label>Hiredate</label> 
			<input class="form-control" name="hiredate" value="${vo.hiredate}" readonly="readonly" />
		</div>
		
		<div class="form-group">
			<label>Salary</label> 
			<input class="form-control" name="sal" value="${vo.sal}" readonly="readonly" />
		</div>
				
		<div class="form-group">
			<label>Commission</label> 
			<input class="form-control" name="comm" value="${vo.comm}" readonly="readonly" />
		</div>
				
		<div class="form-group">
			<label>Deptno</label> 
			<input class="form-control" name="dept" value="${vo.dept.deptno}" readonly="readonly" />
		</div>

		<div class="pull-right">
			<a href="/emp/modify?page=${pageVO.page}&size=${pageVO.size}&type=${pageVO.type}&keyword=${pageVO.keyword}&empno=${vo.empno}" class="btn btn-default">Modify/Delete</a> 
			<a href="/emp/list?page=${pageVO.page}&size=${pageVO.size}&type=${pageVO.type}&keyword=${pageVO.keyword}&empno=${vo.empno}" class="btn btn-primary">Go List</a> 
		</div>

	</div>



</body>
</html>