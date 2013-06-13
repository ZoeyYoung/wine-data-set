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
		<h1>朴素贝叶斯分类算法简介</h1>
		<p>统计学的方法，可以预测类成员关系的可能性，即给定样本属于一个特定类的概率。</p>
		<h1>1、贝叶斯定理</h1>
	    <p>后验概率(posteriori probabilities):P(H|X)表示条件X下H的概率。</p>
		<p>贝叶斯定理:P(H|X)=P(X|H)P(H)/P(X)</p>
		<h1>2、朴素贝叶斯分类</h1>
		<p>每个数据样本用一个n维特征向量X={x1,x2,…,xn}表示，分别描述对n个属性A1,A2,..,An样本的n个度量。 <br/>
			假定有m个类C1,…，Cm,对于数据样本X,分类法将预测X属于类Ci,当且仅当<br/>
			P(Ci|X)> P(Cj|X),1<=j<=m,  j不等于i<br/>
			根据贝叶斯定理, 	P(Ci|X)=P(X|Ci)P(Ci)/P(X)<br/>
			由于P(X)对于所有类都是常数,只需最大化P(X|Ci)P(Ci)<br/>
			计算P(X|Ci),朴素贝叶斯分类假设类条件独立.即给定样本属性值相互条件独立。（在一般情况下此假定都能成立）<br/>
			P(X|Ci)=P(X1|Ci)*P(X2|Ci)*...*P(Xn|Ci)
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