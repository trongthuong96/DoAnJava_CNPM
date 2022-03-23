<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="vi">
<head>
<title><decorator:title default="Trang chủ"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <head>
    <meta charset="utf-8">
    <title>Twitter Bootstrap shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href='<c:url value="/assets/css/bootstrap.css"></c:url>' rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="<c:url value = "/assets/style.css" />" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="<c:url value = "assets/font-awesome/css/font-awesome.css" />" rel="stylesheet">
		<!--[if IE 7]>
			<link href="<c:url value = "css/font-awesome-ie7.min.css" />" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	<!-- Favicons -->
    <link rel="shortcut icon" href="<c:url value = "assets/ico/favicon.ico" />" >
  </head>
<body>
<!-- 
	Upper Header Section 
-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
				</div>
				<a class="active" href="index.html"> <span class="icon-home"></span> Home</a> 
				<a href="#"><span class="icon-user"></span> My Account</a> 
				<a href="register.html"><span class="icon-edit"></span> Free Register </a> 
				<a href="contact.html"><span class="icon-envelope"></span> Contact us</a>
				<a href="cart.html"><span class="icon-shopping-cart"></span> 2 Item(s) - <span class="badge badge-warning"> $448.42</span></a>
			</div>
		</div>
	</div>
</div>

<!--
Lower Header Section 
-->
<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="index.html"><span>Twitter Bootstrap ecommerce template</span> 
		<img src="<c:url value ="assets/img/logo-bootstrap-shoping-cart.png" />" alt="bootstrap sexy shop">
	</a>
	</h1>
	</div>
	<div class="span4">
	<div class="offerNoteWrapper">
	<h1 class="dotmark">
	<i class="icon-cut"></i>
	Twitter Bootstrap shopping cart HTML template is available @ $14
	</h1>
	</div>
	</div>
	<div class="span4 alignR">
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<span class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span>
	<span class="btn btn-warning btn-mini">$</span>
	<span class="btn btn-mini">&pound;</span>
	<span class="btn btn-mini">&euro;</span>
	</div>
</div>
</header>


	
<%@include file="/WEB-INF/views/layouts/user/header.jsp" %>

<!-- body select -->

<decorator:body />

<!-- body select -->

<%@include file="/WEB-INF/views/layouts/user/footer.jsp" %>

	<div class="copyright">
	<div class="container">
		<p class="pull-right">
			<a href="#"><img src="<c:url value ="assets/img/maestro.png" />" alt="payment"></a>
			<a href="#"><img src="<c:url value ="assets/img/mc.png" />" alt="payment"></a>
			<a href="#"><img src="<c:url value ="assets/img/pp.png" />" alt="payment"></a>
			<a href="#"><img src="<c:url value ="assets/img/visa.png" />" alt="payment"></a>
			<a href="#"><img src="<c:url value ="assets/img/disc.png" />" alt="payment"></a>
		</p>
		<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
	</div>
	</div>
	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="<c:url value ="assets/js/jquery.js" />"></script>
		<script src="<c:url value ="assets/js/bootstrap.min.js" />"></script>
		<script src="<c:url value ="assets/js/jquery.easing-1.3.min.js" />"></script>
	    <script src="<c:url value ="assets/js/jquery.scrollTo-1.4.3.1-min.js" />"></script>
	    <script src="<c:url value ="assets/js/shop.js" />"></script>
  </body>
</html>


