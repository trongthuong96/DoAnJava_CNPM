<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<title>Đăng nhập<c:set var = "title" scope = "session" value = "${0}"/></title>
<body>
</div>
</div>
</div>
<!-- Returning Customer Start -->
 <section class="login-block">
    <div class="container">
	<div class="row ">
		<div class="col login-sec">
		    <h2 class="text-center">Đăng nhập</h2>
		    <form class="login-form">
  <div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase">Tài Khoản</label>
    <input type="text" class="form-control" placeholder="Email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Mật khẩu</label>
    <input type="password" class="form-control" placeholder="Mật Khẩu">
  </div>
  
  
    <div class="form-check">
    <label class="form-check-label">
      <input type="checkbox" class="form-check-input">
      <small>Nhớ mật khẩu</small>
    </label>
    <button type="submit" class="btn btn-login float-right">Đăng nhập</button>
  </div>
  
</form>
  </div>
    </div>
    </div>
</section>
<!-- Returning Customer End -->
</body>