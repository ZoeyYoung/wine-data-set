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
			<style type="text/css">
<!--
code {
	font-family: Courier New, Courier;
	font-size: 10pt;
	margin: 0px;
}
-->
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- content-wrap starts here -->
	<div id="content-wrap">
		<div id="content">
			<div id="main">
				<h3>KNN数据预处理</h3>
				<p>
					采用最小-最大规范化，将数据区间规范为[0,1]，对任意一个在原来区间中的变量，在新的区间中都有一个值和它对应，这是一个线性变换过程。<br />
					x'=(x-old_min)/(old_max-old_min)<br />代码如下：
				</p>
				<!-- ======================================================== -->
				<!-- = Java Sourcecode to HTML automatically converted code = -->
				<!-- =   Java2Html Converter 5.0 [2006-02-26] by Markus Gebhard  markus@jave.de   = -->
				<!-- =     Further information: http://www.java2html.de     = -->
				<div align="left" class="java">
					<table border="0" cellpadding="3" cellspacing="0" bgcolor="#ffffff">
						<tr>
							<!-- start source code -->
							<td nowrap="nowrap" valign="top" align="left"><code>
									<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055">
									<b>public&nbsp;</b></font><font color="#7f0055">
									<b>void&nbsp;</b></font><font color="#000000">minMaxDataFormat</font><font
										color="#000000">(</font><font color="#000000">List&lt;List&lt;Double&gt;&gt;&nbsp;data</font><font
										color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">List&lt;Double</font><font color="#000000">[]</font><font
										color="#000000">&gt;&nbsp;minmax&nbsp;=&nbsp;</font><font
										color="#7f0055">
									<b>new&nbsp;</b></font><font color="#000000">ArrayList&lt;Double</font><font
										color="#000000">[]</font><font color="#000000">&gt;</font><font
										color="#000000">()</font><font color="#000000">;</font><br />
									<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">minmax&nbsp;=&nbsp;getMinMax</font><font
										color="#000000">(</font><font color="#000000">data</font><font
										color="#000000">)</font><font color="#000000">;</font><br />
									<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#7f0055">
									<b>for&nbsp;</b></font><font color="#000000">(</font><font
										color="#7f0055">
									<b>int&nbsp;</b></font><font color="#000000">i&nbsp;=&nbsp;</font><font
										color="#990000">0</font><font color="#000000">;&nbsp;i&nbsp;&lt;&nbsp;data.size</font><font
										color="#000000">()</font><font color="#000000">;&nbsp;i++</font><font
										color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#7f0055">
									<b>for&nbsp;</b></font><font color="#000000">(</font><font
										color="#7f0055">
									<b>int&nbsp;</b></font><font color="#000000">j&nbsp;=&nbsp;</font><font
										color="#990000">1</font><font color="#000000">;&nbsp;j&nbsp;&lt;&nbsp;dimension;&nbsp;j++</font><font
										color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">data.get</font><font color="#000000">(</font><font
										color="#000000">i</font><font color="#000000">)</font><font
										color="#000000">.set</font><font color="#000000">(</font><br />
									<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">j,</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">(</font><font color="#000000">data.get</font><font
										color="#000000">(</font><font color="#000000">i</font><font
										color="#000000">)</font><font color="#000000">.get</font><font
										color="#000000">(</font><font color="#000000">j</font><font
										color="#000000">)&nbsp;</font><font color="#000000">-&nbsp;minmax.get</font><font
										color="#000000">(</font><font color="#000000">j</font><font
										color="#000000">)[</font><font color="#990000">0</font><font
										color="#000000">])</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">/&nbsp;</font><font color="#000000">(</font><font
										color="#000000">minmax.get</font><font color="#000000">(</font><font
										color="#000000">j</font><font color="#000000">)[</font><font
										color="#990000">1</font><font color="#000000">]&nbsp;</font><font
										color="#000000">-&nbsp;minmax.get</font><font color="#000000">(</font><font
										color="#000000">j</font><font color="#000000">)[</font><font
										color="#990000">0</font><font color="#000000">]))</font><font
										color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
										color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;</font><font
										color="#000000">}</font>
								</code></td>
							<!-- end source code -->
						</tr>
					</table>
				</div>
				<!-- =       END of automatically generated HTML code       = -->
				<!-- ======================================================== -->
			</div>
		</div>
	</div>
	<!-- footer starts here -->
	<div id="footer-wrap">
		<div id="footer-content"></div>
	</div>
</body>
</html>