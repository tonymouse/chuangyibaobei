<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../js/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="../js/jquery/jquery-1.12.3.min.js"></script>
<script src="../js/bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
	<div class="container">
		<div class="navbar-header">
			<a class="brand">课程管理系统</a>
		</div>
		<div id="navbar" class="nav-collapse collapse">
			<ul class="nav navbar-nav">
			<c:forEach items="${userAccess}" var="access">
			<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="${access.tabActionUrl}" data-target="${access.tabActionUrl}">${access.tabName}<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
					<c:forEach items="${access.subTabMapList}" var="subTabMap">
					<li><a href="${subTabMap.subTabUrl}">${subTabMap.subTabName}</a></li>
					</c:forEach>
					</ul>
			</c:forEach>
			</ul>
			<ul class="nav pull-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" data-target="#"> ${user.name}<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="/logout">注销</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</div>
	</div>

</body>
</html>