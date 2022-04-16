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
            <div class="col-lg-12">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Kiểm tra thông tin</h4>
                    <form:form class="login-form" method="POST" modelAttribute="userUdate">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Họ, tên lót</label>
                            <form:input path="firstName" class="form-control" type="text" placeholder="Đỗ Trọng" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Tên</label>
                            <form:input path="lastName" class="form-control" type="text" placeholder="Thưởng" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <form:input path="email" class="form-control" type="text" placeholder="example@email.com" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại</label>
                            <form:input path="phoneNumber" class="form-control" type="text" placeholder="0911 223 344" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số nhà, đường</label>
                            <form:input path="address" class="form-control" type="text" placeholder="123 Street" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Xã</label>
                            <form:input path="village" class="form-control" type="text" placeholder="Tân Thông Hội" />
                        </div>
                       <div class="col-md-6 form-group">
                            <label>Huyện</label>
                            <form:input path="district" class="form-control" type="text" placeholder="Củ Chi" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Thành phố</label>
                            <form:input path="city" class="form-control" type="text" placeholder="Hồ Chí Minh" />
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Tiếp tục</button>
                    </div>
                    </form:form>
                </div>
            </div>
            
        </div>
    </div>
    <!-- Checkout End -->
</body>