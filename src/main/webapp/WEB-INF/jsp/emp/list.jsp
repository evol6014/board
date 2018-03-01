<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp list.jsp</title>

<!-- For Content-Assist -->
<c:if test="${false}">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.css">
</c:if>
</head>


<body>
<div class="panel-heading"><b>Emp List Page</b></div>
	
	<div class="panel-body">
		<p>${pageMaker.result}</p>
		<c:set var="result" value="${pageMaker.result}"/>
<%-- 		<div th:with="result=${pageMaker.result}"> 이건 타임리프 문법--%>
		<div style="width:100%; height:auto; overflow:auto; margin-bottom: 10px">
		 <!--pageMaker안의 result를(db에서가져온) 로컬변수 리졀트로 받음 -->
			<table class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>EMPNO</th>
						<th>ENAME</th>
						<th>GENDER</th>
						<th>JOB</th>
						<th>MANAGER</th>
						<th>HIREDATE</th>
						<th>SALARY</th>
						<th>COMMISSION</th>
						<th>DEPTNO</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="emp" items="${result.content}">
<%-- 					<tr class="odd gradeX" th:each="emp:${result.content}"> --%>
						<tr class="odd gradeX">
							<td>${emp.empno}</td>
							<td><a href='${emp.empno}' class='empLink'>${emp.ename}</a></td>
							<c:choose>
							<c:when test="${emp.gender.name() == 'M'}">
								<td>남자</td>
							</c:when>
							<c:when test="${emp.gender.name() == 'F'}">
								<td>여자</td>
							</c:when>
							<c:otherwise>
								<td>???</td>
							</c:otherwise>
							</c:choose>
							
							<td>${emp.job}</td>
							<td>${emp.mgr == null ? 'No' : emp.mgr.ename}</td>
							<td>
								<fmt:formatDate value="${emp.hiredate}" pattern="yyyy-MM-dd"/>
							</td>
<%-- 							<td>${#numbers.formatInteger(emp.sal, 3, 'COMMA')}</td> --%>
							<td>
							<fmt:formatNumber value="${emp.sal}" type="number" />
							</td>
							<td>${emp.comm}</td>
							<td>${emp.dept.deptno}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

<!-- 써치 -->
			<div>
				<select id='searchType'>
					<option>--</option>
					<option value='n' ${pageVO.type =='n' ? 'selected' : ''}>Empno</option>
					<option value='i' ${pageVO.type =='i' ? 'selected' : ''}>Ename</option>
					<option value='j' ${pageVO.type =='j' ? 'selected' : ''}>Job</option>
					<option value='s' ${pageVO.type =='s' ? 'selected' : ''}>Sal</option>
					<option value='c' ${pageVO.type =='c' ? 'selected' : ''}>Comm</option>
					<option value='d' ${pageVO.type =='d' ? 'selected' : ''}>deptno</option>
				</select>
			  	<input type='text' id='searchKeyword' value="${pageVO.keyword}">
			 	<button id='searchBtn'>Search</button> 
			</div>
			
			<div class="panel-body pull-right">
				<h3><a class="label label-default " href="/emp/register">Register</a></h3>
			</div>
			

		</div>

		<nav>

			<div>
				<ul class="pagination">
					<c:if test="${pageMaker.prevPage != null}">
<%-- 					<li class="page-item" th:if="${pageMaker.prevPage}"> --%>
						<li class="page-trem">
							<a href="${pageMaker.prevPage.pageNumber + 1}">
								PREV ${pageMaker.prevPage.pageNumber + 1}
							</a>
						</li>
					</c:if>

					<c:forEach var="p" items="${pageMaker.pageList}">
						<li class="page-item ${p.pageNumber == pageMaker.currentPageNum -1 ? 'active' : ''}">
							<a href="${p.pageNumber +1}"> ${p.pageNumber +1} </a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.nextPage != null}">
<%-- 					<li class="page-item" th:if="${pageMaker.nextPage}"> --%>
						<li class="page-item">
							<a href="{pageMaker.nextPage.pageNumber + 1}">
								NEXT ${pageMaker.nextPage.pageNumber + 1}
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>


	</div>
	
	<form id='f1' action="/emp/list" method="get">
		<input type='hidden' name='page' value="${pageMaker.currentPageNum}">
		<input type='hidden' name='size' value="${pageMaker.currentPage.pageSize}">
		<input type='hidden' name='type' value="${pageVO.type}">
		<input type='hidden' name='keyword' value="${pageVO.keyword}">
	</form>

	<script type="text/javascript">
	
		$(window).load(function(){
			
			var msg = "${msg}";
			
			
			if(msg =='success') {
				alert("정상적으로 처리되었습니다.");
				var stateObj = { msg: "" };
			}

		});
	
		$(document).ready(function() {
			var formObj = $("#f1");

			$(".pagination a").click(function(e) {

				e.preventDefault();

				formObj.find('[name="page"]').val($(this).attr('href'));

				formObj.submit();
			});
			
			$(".empLink").click(function(e){
				
				e.preventDefault(); 
				
				var empNo = $(this).attr("href");
				
				formObj.attr("action","/emp/view");
				formObj.append("<input type='hidden' name='empno' value='" + empNo +"'>" );
				
				formObj.submit();
				
			});
			
			$("#searchBtn").click(function(e){
				
				var typeStr = $("#searchType").find(":selected").val();
				var keywordStr = $("#searchKeyword").val();
				
				console.log(typeStr, "" , keywordStr);
				
				formObj.find("[name='type']").val(typeStr);
				formObj.find("[name='keyword']").val(keywordStr);
				formObj.find("[name='page']").val("1");
				formObj.submit();
			});

		});
	</script>
	






</body>
</html>