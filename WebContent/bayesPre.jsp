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
				<h3>贝叶斯数据预处理</h3>
				<p>根据对所有属性数据的观察，采取了相对简单的预处理方法。代码如下：</p>
					<!-- ======================================================== -->
					<!-- = Java Sourcecode to HTML automatically converted code = -->
					<!-- =   Java2Html Converter 5.0 [2006-02-26] by Markus Gebhard  markus@jave.de   = -->
					<!-- =     Further information: http://www.java2html.de     = -->
					<div align="left" class="java">
						<table border="0" cellpadding="3" cellspacing="0"
							bgcolor="#ffffff">
							<tr>
								<!-- start source code -->
								<td nowrap="nowrap" valign="top" align="left"><code>
										<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055">
										<b>public&nbsp;</b></font><font color="#000000">List&lt;List&lt;Integer&gt;&gt;&nbsp;discretization</font><font
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
											color="#000000">List&lt;List&lt;Integer&gt;&gt;&nbsp;result&nbsp;=&nbsp;</font><font
											color="#7f0055">
										<b>new&nbsp;</b></font><font color="#000000">ArrayList&lt;List&lt;Integer&gt;&gt;</font><font
											color="#000000">()</font><font color="#000000">;</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>for&nbsp;</b></font><font color="#000000">(</font><font
											color="#7f0055">
										<b>int&nbsp;</b></font><font color="#000000">i&nbsp;=&nbsp;</font><font
											color="#990000">0</font><font color="#000000">;&nbsp;i&nbsp;&lt;&nbsp;dimension;&nbsp;i++</font><font
											color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>if&nbsp;</b></font><font color="#000000">(</font><font
											color="#000000">minmax.get</font><font color="#000000">(</font><font
											color="#000000">i</font><font color="#000000">)[</font><font
											color="#990000">0</font><font color="#000000">]&nbsp;</font><font
											color="#000000">&gt;&nbsp;</font><font color="#990000">100&nbsp;</font><font
											color="#000000">&amp;&amp;&nbsp;minmax.get</font><font
											color="#000000">(</font><font color="#000000">i</font><font
											color="#000000">)[</font><font color="#990000">1</font><font
											color="#000000">]&nbsp;</font><font color="#000000">&gt;&nbsp;</font><font
											color="#990000">1000</font><font color="#000000">)&nbsp;{&nbsp;</font><font
											color="#3f7f5f">//&nbsp;如果最小值大于100且最大值大于1000，则所有值除以100</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>for&nbsp;</b></font><font color="#000000">(</font><font
											color="#7f0055">
										<b>int&nbsp;</b></font><font color="#000000">j&nbsp;=&nbsp;</font><font
											color="#990000">0</font><font color="#000000">;&nbsp;j&nbsp;&lt;&nbsp;data.size</font><font
											color="#000000">()</font><font color="#000000">;&nbsp;j++</font><font
											color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">data.get</font><font color="#000000">(</font><font
											color="#000000">j</font><font color="#000000">)</font><font
											color="#000000">.set</font><font color="#000000">(</font><font
											color="#000000">i,&nbsp;data.get</font><font color="#000000">(</font><font
											color="#000000">j</font><font color="#000000">)</font><font
											color="#000000">.get</font><font color="#000000">(</font><font
											color="#000000">i</font><font color="#000000">)&nbsp;</font><font
											color="#000000">/&nbsp;</font><font color="#990000">100</font><font
											color="#000000">)</font><font color="#000000">;</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}&nbsp;</font><font color="#7f0055">
										<b>else&nbsp;if&nbsp;</b></font><font color="#000000">(</font><font
											color="#000000">minmax.get</font><font color="#000000">(</font><font
											color="#000000">i</font><font color="#000000">)[</font><font
											color="#990000">0</font><font color="#000000">]&nbsp;</font><font
											color="#000000">&gt;&nbsp;</font><font color="#990000">10&nbsp;</font><font
											color="#000000">&amp;&amp;&nbsp;minmax.get</font><font
											color="#000000">(</font><font color="#000000">i</font><font
											color="#000000">)[</font><font color="#990000">1</font><font
											color="#000000">]&nbsp;</font><font color="#000000">&gt;&nbsp;</font><font
											color="#990000">100</font><font color="#000000">)&nbsp;{&nbsp;</font><font
											color="#3f7f5f">//&nbsp;如果最小值大于10且最大值大于100，则所有值除以10</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>for&nbsp;</b></font><font color="#000000">(</font><font
											color="#7f0055">
										<b>int&nbsp;</b></font><font color="#000000">j&nbsp;=&nbsp;</font><font
											color="#990000">0</font><font color="#000000">;&nbsp;j&nbsp;&lt;&nbsp;data.size</font><font
											color="#000000">()</font><font color="#000000">;&nbsp;j++</font><font
											color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">data.get</font><font color="#000000">(</font><font
											color="#000000">j</font><font color="#000000">)</font><font
											color="#000000">.set</font><font color="#000000">(</font><font
											color="#000000">i,&nbsp;data.get</font><font color="#000000">(</font><font
											color="#000000">j</font><font color="#000000">)</font><font
											color="#000000">.get</font><font color="#000000">(</font><font
											color="#000000">i</font><font color="#000000">)&nbsp;</font><font
											color="#000000">/&nbsp;</font><font color="#990000">10</font><font
											color="#000000">)</font><font color="#000000">;</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#3f7f5f">//&nbsp;对所有值取整</font><br /> <font
											color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>for&nbsp;</b></font><font color="#000000">(</font><font
											color="#7f0055">
										<b>int&nbsp;</b></font><font color="#000000">j&nbsp;=&nbsp;</font><font
											color="#990000">0</font><font color="#000000">;&nbsp;j&nbsp;&lt;&nbsp;data.size</font><font
											color="#000000">()</font><font color="#000000">;&nbsp;j++</font><font
											color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">List&lt;Integer&gt;&nbsp;list&nbsp;=&nbsp;</font><font
											color="#7f0055">
										<b>new&nbsp;</b></font><font color="#000000">ArrayList&lt;Integer&gt;</font><font
											color="#000000">()</font><font color="#000000">;</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>for&nbsp;</b></font><font color="#000000">(</font><font
											color="#7f0055">
										<b>int&nbsp;</b></font><font color="#000000">i&nbsp;=&nbsp;</font><font
											color="#990000">0</font><font color="#000000">;&nbsp;i&nbsp;&lt;&nbsp;dimension;&nbsp;i++</font><font
											color="#000000">)&nbsp;{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">list.add</font><font color="#000000">(</font><font
											color="#000000">Arith.convertsToInt</font><font
											color="#000000">(</font><font color="#000000">data.get</font><font
											color="#000000">(</font><font color="#000000">j</font><font
											color="#000000">)</font><font color="#000000">.get</font><font
											color="#000000">(</font><font color="#000000">i</font><font
											color="#000000">)))</font><font color="#000000">;</font><br />
										<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">result.add</font><font color="#000000">(</font><font
											color="#000000">list</font><font color="#000000">)</font><font
											color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
											color="#7f0055">
										<b>return&nbsp;</b></font><font color="#000000">result;</font><br />
										<font color="#ffffff">&nbsp;&nbsp;</font><font color="#000000">}</font>
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