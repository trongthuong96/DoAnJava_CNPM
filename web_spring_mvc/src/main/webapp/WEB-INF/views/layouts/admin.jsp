<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp" %> 
 
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="icon" href="images/favicon1.ico" type="image/ico" />
    <title><decorator:title></decorator:title></title>

    <!-- Bootstrap -->
    <link href="<c:url value = "/assets/admin/vendors/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value = "/assets/admin/vendors/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value = "/assets/admin/vendors/nprogress/nprogress.css" />" rel="stylesheet">
    <!-- iCheck -->
    <link href="<c:url value = "/assets/admin/vendors/iCheck/skins/flat/green.css" />" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="<c:url value = "/assets/admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<c:url value = "/assets/admin/build/css/custom.min.css" />" rel="stylesheet">
  	<link href="<c:url value = "/assets/admin/build/css/product.css" />" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
       
       <!-- HEADER -->
       <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>

        <!-- page content -->
        <decorator:body></decorator:body>
        <!-- /page content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="<c:url value = "/assets/admin/vendors/jquery/dist/jquery.min.js" />"></script>
    <!-- Bootstrap -->
    <script src="<c:url value = "/assets/admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js" />"></script>
    <!-- FastClick -->
    <script src="<c:url value = "/assets/admin/vendors/fastclick/lib/fastclick.js" />"></script>
    <!-- NProgress -->
    <script src="<c:url value = "/assets/admin/vendors/nprogress/nprogress.js" />"></script>
    <!-- bootstrap-progressbar -->
    <script src="<c:url value = "/assets/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js" />"></script>
    <!-- iCheck -->
    <script src="<c:url value = "/assets/admin/vendors/iCheck/icheck.min.js" />"></script>
    <!-- Skycons -->
    <script src="<c:url value = "/assets/admin/vendors/skycons/skycons.js" />"></script>
    <script src="<c:url value = "/assets/admin/vendors/moment/min/moment.min.js" />"></script>

    <!-- Custom Theme Scripts -->
    <script src="<c:url value = "/assets/admin/build/js/custom.min.js" />"></script>
	
  </body>
</html>
    