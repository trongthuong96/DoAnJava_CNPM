<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <title><decorator:title default="Trang chủ" /></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="<c:url value="/assets/img/favicon.ico" />" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/assets/lib/owlcarousel/assets/owl.carousel.min.css" />" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value="/assets/css/style.css" />" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">TKQ</span>Dream</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                <a href="" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge">0</span>
                </a>
                <a href="<c:url value="/gio-hang" />" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">${TotalQuantity}</span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Danh sách</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse <c:if test="${title == 1}"> show </c:if> <c:if test="${title == 0}"> position-absolute bg-light </c:if> navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical" <c:if test="${title == 0}"> style="width: calc(100% - 30px); z-index: 1;" </c:if>>
                    <div class="navbar-nav w-100 overflow-auto" style="height: 410px">
                        <c:forEach var="item" items="${typeProducts}">
                        	<a href="<c:url value="/san-pham/${item.id}" />" class="nav-item nav-link">${item.name}</a>
                        </c:forEach>
                    </div>
                </nav>
                
            </div>
            <div class="col-lg-9">
                
				<%@include file="/WEB-INF/views/layouts/user/header.jsp" %>
			
                
    <!-- Navbar End -->

<!-- body select -->

<decorator:body />

<!-- body select -->

<%@include file="/WEB-INF/views/layouts/user/footer.jsp" %>

 <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value="/assets/lib/easing/easing.min.js" />" ></script>
    <script src="<c:url value="/assets/lib/owlcarousel/owl.carousel.min.js" />" ></script>

    <!-- Contact Javascript File -->
    <script src="<c:url value="/assets/mail/jqBootstrapValidation.min.js"/>" ></script>
    <script src="<c:url value="/assets/mail/contact.js" />" ></script>

    <!-- Template Javascript -->
    <script src="<c:url value="/assets/js/main.js" />" ></script>
    
    <decorator:getProperty property="page.script"></decorator:getProperty>
</body>

</html>


