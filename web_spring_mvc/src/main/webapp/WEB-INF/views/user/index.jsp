<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<title>Trang chủ <c:set var = "title" scope = "session" value = "${1}"/></title>

<body>
<div id="header-carousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
    
    <c:if test="${banners.size()>0}">
	    <c:forEach var="item" items="${banners}" varStatus="loop">
	        <div class="carousel-item <c:if test="${loop.first}"> active </c:if>" style="height: 410px;">
	            <img class="img-fluid" src="<c:url value="/assets/img/banner/${item.img}" />"  alt="Image">
	            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
	                <div class="p-3" style="max-width: 700px;">
	                    <h4 class="text-light text-uppercase font-weight-medium mb-3">${item.content}</h4>
	                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">${item.capption}</h3>
	                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
	                </div>
	            </div>
	        </div>
        </c:forEach>
  	</c:if>
    </div>
    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
        <div class="btn btn-dark" style="width: 45px; height: 45px;">
            <span class="carousel-control-prev-icon mb-n2"></span>
        </div>
    </a>
    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
        <div class="btn btn-dark" style="width: 45px; height: 45px;">
            <span class="carousel-control-next-icon mb-n2"></span>
        </div>
    </a>
</div>

</div>
</div>
</div>
<!-- Navbar End -->
<!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Sản phẩm mới</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        
        <!-- Sản phẩm mới -->
        	<c:if test="${ newProduct.size() > 0 }">
					<c:forEach var="item" items="${ newProduct }" varStatus="loop">
						<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			                <div class="card product-item border-0 mb-4">
			                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
			                        <img class="img-fluid w-100" src="<c:url value="/assets/img/${item.image}" />"  alt="">
			                    </div>
			                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
			                        <h6 class="text-truncate mb-3">${item.productName}</h6>
			                        <div class="d-flex justify-content-center">
			                            <h6><fmt:formatNumber type = "number" groupingUsed="true" value = "${item.price}" />₫</h6><h6 class="text-muted ml-2"><!-- <del>1,200,000đ</del> --></h6>
			                        </div>
			                    </div>
			                    <div class="card-footer d-flex justify-content-between bg-light border">
			                        <a href="<c:url value="/chi-tiet/${item.productId}" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết sản phẩm</a>
			                        <a href="<c:url value="/them-gio-hang/${item.productId}" />" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ hàng</a>
			                    </div>
			                </div>
			            </div>
					</c:forEach>
			</c:if>
			
        </div>
    </div>
    <!-- Products End -->

	
    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Sản phẩm nổi bật</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        
        	<!-- Sản nổi bật -->
        	<c:if test="${hotProduct.size() > 0 }">
		  
			  	<c:forEach var="item" items="${hotProduct}" varStatus="loop">
			  		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
			                <div class="card product-item border-0 mb-4">
			                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
			                        <img class="img-fluid w-100" src="<c:url value="/assets/img/${item.image}" />"  alt="">
			                    </div>
			                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
			                        <h6 class="text-truncate mb-3">${item.productName}</h6>
			                        <div class="d-flex justify-content-center">
			                            <h6><fmt:formatNumber type = "number" groupingUsed="true" value = "${item.price}" />₫</h6><h6 class="text-muted ml-2"><!-- <del>1,200,000đ</del> --></h6>
			                        </div>
			                    </div>
			                    <div class="card-footer d-flex justify-content-between bg-light border">
			                        <a href="<c:url value="/chi-tiet/${item.productId}" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết sản phẩm</a>
			                        <a href="<c:url value="/them-gio-hang/${item.productId}" />" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ hàng</a>
			                    </div>
			                </div>
			            </div>
				</c:forEach>
		  	</c:if>
            
        </div>
    </div>
    <!-- Products End -->
    
    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-1.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-2.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-3.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-4.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-5.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-6.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-7.jpg" />"  alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value="/assets/img/vendor-8.jpg" />"  alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->

</body>

