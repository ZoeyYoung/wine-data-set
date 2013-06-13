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
		<h1>实验数据说明</h1>
		<p>数据源的完整名称是Wine Data Set，是对3种不同的酒进行分类。
		这三种酒包括13种不同的属性，分别为：Alcohol，Malic acid，Ash，Alcalinity of ash，
		Magnesium，Total phenols，Flavanoids，Nonflavanoid phenols，Proanthocyanins，
		Color intensity，Hue，OD280/OD315 of diluted wines，Proline。
		在“wine.data”文件中，每行代表一种酒的样本，共有178个样本；一共有14列，
		其中，第一列为类标志属性，共有三类，分别记为“1”，“2”，“3”;后面的13列为每个样本的对应属性的样本值。
		其中第1类有59个样本，第2类有71个样本，第3类有48个样本。</p>
		<h1>Introduction</h1>
		<p> From <a href="http://archive.ics.uci.edu/ml/datasets/Wine">http://archive.ics.uci.edu/ml/datasets/Wine</a></p>
		<p><strong>1. Title of Database: Wine recognition data</strong><br/>
		Updated Sept 21, 1998 by C.Blake : Added attribute information</p>
		<p><strong>2. Sources</strong><br/><br/>
		<strong>Original Owners</strong><br/>
		Forina, M. et al, PARVUS -<br/>
		An Extendible Package for Data Exploration, Classification and Correlation.
		Institute of Pharmaceutical and Food Analysis and Technologies, Via Brigata Salerno, 16147 Genoa, Italy.<br/><br/>
		<strong>Donor</strong><br/>
		Stefan Aeberhard, email: stefan@coral.cs.jcu.edu.au
		July 1991</p>
		<p><strong>3. Data Set Information</strong><br/>
		These data are the results of a chemical analysis of wines grown in the same region in Italy but derived from three different cultivars. The analysis determined the quantities of 13 constituents found in each of the three types of wines.<br/><br/>
		I think that the initial data set had around 30 variables, but for some reason I only have the 13 dimensional version. I had a list of what the 30 or so variables were, but a.) I lost it, and b.), I would not know which 13 variables are included in the set.
		<br/><br/>
		<strong>The attributes are (dontated by Riccardo Leardi, riclea@anchem.unige.it )</strong><br/>
		1) Alcohol<br/>
		2) Malic acid<br/>
		3) Ash<br/>
		4) Alcalinity of ash<br/>
		5) Magnesium<br/>
		6) Total phenols<br/>
		7) Flavanoids<br/>
		8) Nonflavanoid phenols<br/>
		9) Proanthocyanins<br/>
		10)Color intensity<br/>
		11)Hue<br/>
		12)OD280/OD315 of diluted wines<br/>
		13)Proline<br/>
		<br/>
		In a classification context, this is a well posed problem with "well behaved" class structures. A good data set for first testing of a new classifier, but not very challenging.
		</p>
		<p><strong>4. Attribute Information</strong><br/>
		All attributes are continuous<br/>
		No statistics available, but suggest to standardise variables for certain uses (e.g. for us with classifiers which are NOT scale invariant)
		NOTE: 1st attribute is class identifier (1-3)
		</p>
		<p><strong>5. Number of Instances</strong><br/>
		class 1 59<br/>
		class 2 71<br/>
		class 3 48<br/>
		</p>
		<p><strong>6. Number of Attributes</strong><br/>13</p>
		<p><strong>7. Missing Attribute Values</strong><br/>None</p>
		<p><strong>8. Class Distribution:</strong> number of instances per class<br/>
		class 1 59<br/>
		class 2 71<br/>
		class 3 48<br/>
		</p>
		<p><strong>9. Relevant Papers:</strong><br/>
		(1)
		S. Aeberhard, D. Coomans and O. de Vel,<br/>
		Comparison of Classifiers in High Dimensional Settings,<br/>
		Tech. Rep. no. 92-02, (1992), Dept. of Computer Science and Dept. of<br/>
		Mathematics and Statistics, James Cook University of North Queensland.<br/>
		(Also submitted to Technometrics).<br/>
		The data was used with many others for comparing various classifiers.<br/>
		The classes are separable, though only RDA has achieved 100% correct classification.<br/>
		(RDA:100%, QDA 99.4%, LDA 98.9%, 1NN 96.1% (z-transformed data))<br/>
		(All results using the leave-one-out technique)<br/><br/>
		(2)<br/>
		S. Aeberhard, D. Coomans and O. de Vel,<br/>
		"THE CLASSIFICATION PERFORMANCE OF RDA"<br/>
		Tech. Rep. no. 92-01, (1992), Dept. of Computer Science and Dept. of<br/>
		Mathematics and Statistics, James Cook University of North Queensland.<br/>
		(Also submitted to Journal of Chemometrics).<br/>
		Here, the data was used to illustrate the superior performance of<br/>
		the use of a new appreciation function with RDA.</p>
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