<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp" %> 
<title>Thanh toán <c:set var = "title" scope = "session" value = "${0}"/></title>
<body>
</div>
</div>
</div>
<!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-6">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Thông tin khách hàng</h4>
                    <form:form class="login-form" method="POST" modelAttribute="userUdate">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Họ, tên lót</label>
                            <form:input path="firstName" class="form-control" type="text" placeholder="Đỗ Trọng" disabled="true" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Tên</label>
                            <form:input path="lastName" class="form-control" type="text" placeholder="Thưởng" disabled="true" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <form:input path="email" class="form-control" type="text" placeholder="example@email.com" disabled="true" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại</label>
                            <form:input path="phoneNumber" class="form-control" type="text" placeholder="0911 223 344" disabled="true" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số nhà, đường</label>
                            <form:input path="address" class="form-control" type="text" placeholder="123 Street" disabled="true" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Xã</label>
                            <form:input path="village" class="form-control" type="text" placeholder="Tân Thông Hội" disabled="true" />
                        </div>
                       <div class="col-md-6 form-group">
                            <label>Huyện</label>
                            <form:input path="district" class="form-control" type="text" placeholder="Củ Chi" disabled="true" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Thành phố</label>
                            <form:input path="city" class="form-control" type="text" placeholder="Hồ Chí Minh" disabled="true" />
                        </div>
                    </div>
                    </form:form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Hóa đơn</h4>
                    </div>
                    <div class="card-body">
                    	<table class="table table-bordered text-center mb-0">
		                    <thead class="bg-secondary text-dark">
		                        <tr>
		                            <th>Tên sản phẩm</th>
		                            <th>Giá</th>
		                            <th>Số Lượng</th>
		                        </tr>
		                    </thead>
		                    <tbody class="align-middle">
		                    	<c:if test="${not empty CartData}">
		                    	<c:forEach var="item" items="${CartData}">
		                        <tr>
		                            <td class="align-middle"><img src="<c:url value="/assets/img/${item.product.image}"/>" alt="" style="width: 50px;">${item.product.productName}</td>
		                            <td class="align-middle"><fmt:formatNumber type = "number" groupingUsed="true" value = "${item.product.price}" />₫</td>
		                            <td class="align-middle">${item.quantity}</td>
		                        </tr>
		                        </c:forEach>
		                       </c:if>
		                       
		                    </tbody>
		                </table>
                        
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng tiền sản phẩm</h6>
                            <h6 class="font-weight-medium"><fmt:formatNumber type = "number" groupingUsed="true" value = "${TotalPrice}" />₫</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">$0</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng</h5>
                            <h5 class="font-weight-bold"><fmt:formatNumber type = "number" groupingUsed="true" value = "${TotalPrice}" />₫</h5>
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Payment</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal">
                                <label class="custom-control-label" for="paypal">Paypal</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                <label class="custom-control-label" for="directcheck">Thanh Toán Tận Nơi</label>
                            </div>
                        </div>
                        <div class="">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                <label class="custom-control-label" for="banktransfer">Chuyển Khoản Ngân Hàng</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                    	<form action='<c:url value="/thanh-toan-pay"></c:url>' method="post">
                        	<button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Đặt Hàng</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->

</body>