<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div id="content">
<div id="main">	
<h3>实验数据说明</h3>
<p>每次随机从数据库中抽取2/3条作为训练样本，剩余的样本为测试集，测试集与训练样本相对独立。</p>
<h3>先验概率</h3>
<ul>
<li>P(C1)=${priorProbabilitys[0]}</li>
<li>P(C2)=${priorProbabilitys[1]}</li>
<li>P(C3)=${priorProbabilitys[2]}</li>
</ul>
<h3>P(Xi|Ci)</h3>
<table>
<tr>
<th>i</th><th>P(Xi|C1)</th><th>P(Xi|C2)</th><th>P(Xi|C3)</th>
</tr>
<c:forEach begin="1" end="13" varStatus="status">
<tr>
	<td>${status.index}</td>
	<td><c:forEach items="${PXiC1[status.index]}" var="map">
	P(X${status.index}=${map.key}|C1)=<fmt:formatNumber value="${map.value}" pattern="#,#0.00#"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach></td>
	<td><c:forEach items="${PXiC2[status.index]}" var="map">
	P(X${status.index}=${map.key}|C2)=<fmt:formatNumber value="${map.value}" pattern="#,#0.00#"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach></td>
	<td><c:forEach items="${PXiC3[status.index]}" var="map">
	P(X${status.index}=${map.key}|C3)=<fmt:formatNumber value="${map.value}" pattern="#,#0.00#"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach></td>
</tr>
</c:forEach>
</table>
<h3>获得模型所需时间</h3>
<p>${time}ms</p>
<h3>后验概率P(Ci|Ti)以及测试结果</h3>
<table>
<tr>
	<th>Class</th><th>P(C1|Ti)</th><th>P(C2|Ti)</th><th>P(C3|Ti)</th><th>Result</th>
</tr>
<c:forEach items="${PCiTi}" var="pciti">
	<c:if test="${pciti[0] != pciti[4]}" ><tr class="error"></c:if>
	<c:if test="${pciti[0] == pciti[4]}" ><tr></c:if>
	<td><fmt:formatNumber value="${pciti[0]}" pattern="#,#0.#"/></td>
	<td><fmt:formatNumber value="${pciti[1]}" pattern="#,#0.0#"/></td>
	<td><fmt:formatNumber value="${pciti[2]}" pattern="#,#0.0#"/></td>
	<td><fmt:formatNumber value="${pciti[3]}" pattern="#,#0.0#"/></td>
	<td><fmt:formatNumber value="${pciti[4]}" pattern="#,#0.#"/></td>
	</tr>
</c:forEach>
</table>
<h3>正确率</h3>
<p><fmt:formatNumber value="${accuracyRate}" type="percent" /></p>
<h3>错误率</h3>
<p><fmt:formatNumber value="${errorRate}" type="percent" /></p>
<hr/>
<h3>采用十折交叉验证</h3>
<p>将数据集分成十分，轮流将其中9份作为训练数据，1份作为测试数据，进行试验。每次试验都会得出相应的正确率（或差错率）。10次的结果的正确率（或差错率）的平均值作为对算法精度的估计。</p>
<h3>平均正确率</h3>
<p><fmt:formatNumber value="${avgAccuracyRate}" type="percent" /></p>
<h3>平均错误率</h3>
<p><fmt:formatNumber value="${avgErrorRate}" type="percent" /></p>
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