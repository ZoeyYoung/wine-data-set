<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
	<base href="<%=basePath%>">
	<title>Wine Data Set</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="" />
	<meta http-equiv="description" content="Wine Data Set.">
	<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>
<%@ include file="header.jsp" %>
<!-- content-wrap starts here -->
<div id="content-wrap">
	<h3>所有数据</h3>									
	<table>
		<tr>
			<th>Class</th>
			<th>Alcohol</th>
			<th>Malic acid</th>
			<th>Ash</th>
			<th>Alkalinity<br/>of ash</th>
			<th>Magnesium</th>
			<th>Total<br/>phenols</th>
			<th>Flavanoids</th>
			<th>Nonflavanoid<br/>phenols</th>
			<th>Proanth-<br/>ocyanins</th>
			<th>Color intensity</th>
			<th>Hue</th>
			<th>OD280/OD315 of<br/>diluted wines</th>
			<th>Proline</th>
		</tr>
		<c:forEach items="${datalist}" var="wine">
		<tr>
			<td>${wine.classs}</td>
			<td>${wine.alcohol}</td>
			<td>${wine.malic_acid}</td>
			<td>${wine.ash}</td>
			<td>${wine.alcalinity_of_ash}</td>
			<td>${wine.magnesium}</td>
			<td>${wine.total_phenols}</td>
			<td>${wine.flavanoids}</td>
			<td>${wine.nonflavanoid_phenols}</td>
			<td>${wine.proanthocyanins}</td>
			<td>${wine.color_intensity}</td>
			<td>${wine.hue}</td>
			<td>${wine.OD280_OD315_of_diluted_wines}</td>
			<td>${wine.proline}</td>
		</tr>
		</c:forEach>
	</table>
</div>
<!-- footer starts here -->	
<div id="footer-wrap">
<div id="footer-content">
</div>
</div>
</body>
</html>