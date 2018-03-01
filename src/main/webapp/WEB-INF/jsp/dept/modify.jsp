<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dept modify.jsp</title>

<c:if test="${false}">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.css">
</c:if>

</head>
<body>
	<div class="panel-heading"><b>Dept Modify Page</b></div>
	<div class="panel-body">

    <form id='f1'>

		<div class="form-group">
			<label>Deptno</label> 
			<input class="form-control" name="deptno" value="${vo.deptno}" readonly="readonly" />
		</div>

		<div class="form-group">
			<label>Dname</label> 
			<input class="form-control" name="dname" value="${vo.dname}" />
			<p class="help-block">Dname text here.</p>
		</div>

		<div class="form-group">
			<label>Loc</label> 
			<input class="form-control" name="loc" value="${vo.loc}" />
		</div>
		
		<input type='hidden' name="page" value="${pageVO.page}">
		<input type='hidden' name="size" value="${pageVO.size}">
		<input type='hidden' name="type" value="${pageVO.type}">
		<input type='hidden' name="keyword" value="${pageVO.keyword}">
		
		</form>

		<div class="pull-right">
		
			<a href="#" class="btn btn-warning modbtn">Modify</a>
			<a href="#" class="btn btn-danger delbtn">Delete</a>
			<a href="/dept/list?${pageVO.page}&size=${pageVO.size}&type=${pageVO.type}&keyword=${pageVO.keyword}&deptno=${vo.deptno}" 
				class="btn btn-primary">Cancel & Go List</a> 
		</div>

	</div>


	<script type="text/javascript">
	$(document).ready(function(){
	
		var formObj = $("#f1");
		
		$(".delbtn").click(function(){
			
			formObj.attr("action", "delete");
			formObj.attr("method", "post");
			
			formObj.submit();
			
		});
		
		$(".modbtn").click(function(){
			
			formObj.attr("action", "modify");
			formObj.attr("method", "post");
			
			formObj.submit();
			
		});
		
		
	});	
	</script>





</body>
</html>