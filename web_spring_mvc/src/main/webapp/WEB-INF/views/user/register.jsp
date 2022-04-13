<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
<title>Đăng ký<c:set var = "title" scope = "session" value = "${0}"/></title>
<body>
</div>
</div>
</div>

<!-- Returning Customer Start -->
 <section class="login-block">
    <div class="container">
	<div class="row ">
		<div class="col login-sec">
		    <h2 class="text-center">Đăng ký</h2>
	<form:form class="login-form" action="dang-ky" method="POST" modelAttribute="user">
	  <div class="form-group">
	    <label for="exampleInputEmail1" class="text-uppercase">Tài Khoản</label>
	    <form:input type="email" path="email" class="form-control" placeholder="Nhập email" required="required" />
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputPassword1" class="text-uppercase">Mật khẩu</label>
	    <form:input type="password" path="password" class="form-control" placeholder="Nhập mật khẩu" required="required" />
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputFullname" class="text-uppercase">Họ</label>
	    <form:input type="text" path="firstName" class="form-control" placeholder="Nhập họ" />
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputFullname" class="text-uppercase">Tên</label>
	    <form:input type="text" path="lastName" class="form-control" placeholder="Nhập tên" />
	  </div>
	  
	    <div class="form-check">
	     <label class="form-check-label">
	      <small><a href='<c:url value="/dang-nhap" />'>Đăng nhập</a></small>
	      <small>Đã có tài khoản</small>
	    </label>
	    <button type="submit" class="btn btn-login float-right">Đăng ký</button>
	   	<p> ${statusRegister}</p>
	  </div>
	  
	</form:form>
  </div>
    </div>
    </div>
</section>
<!-- Returning Customer End -->
</body>