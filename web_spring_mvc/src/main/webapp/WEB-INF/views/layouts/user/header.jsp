<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!--
Navigation Bar Section 
-->
<nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
    <a href="" class="text-decoration-none d-block d-lg-none">
        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
    </a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
        <div class="navbar-nav mr-auto py-0">
        	<c:forEach var="item" items="${menus}">
        		<a href="<c:url value = "${item.url}" />" class="nav-item nav-link">${item.name}</a>
        	</c:forEach>
        </div>
        <div class="navbar-nav ml-auto py-0">
            <a href="" class="nav-item nav-link">Đăng nhập</a>
            <a href="" class="nav-item nav-link">Đăng ký</a>
        </div>
    </div>
</nav>