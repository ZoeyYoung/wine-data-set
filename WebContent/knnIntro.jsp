<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
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
	<div id="content">
		<div id="main">			
		<h1>KNN算法简介</h1>
		<p>基于类比学习，通过比较训练元组和测试元组的相似度来学习。<br/>
将训练元组和测试元组看作是n维（若元组有n的属性）空间内的点，给定一条测试元组，搜索n维空间，找出与测试元组最相近的k个点（即训练元组），最后取这k个点中的多数类作为测试元组的类别。
		</p>
		</div>
	</div>
</div>
<!-- footer starts here -->	
<div id="footer-wrap">
<div id="footer-content">
</div>
</div>
</body>
</html>