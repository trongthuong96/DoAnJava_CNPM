<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Giỏ hàng <c:set var = "title" scope = "session" value = "${0}"/></title>
<body>
</div>
</div>
</div>
<h1>${cart1}</h1>
 <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số Lượng</th>
                            <th>Tổng Tiền</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<c:if test="${not empty CartData}">
                    	<c:forEach var="item" items="${CartData}">
                        <tr>
                            <td class="align-middle"><img src="<c:url value="/assets/img/${item.product.image}"/>" alt="" style="width: 50px;">${item.product.productName}</td>
                            <td class="align-middle"><fmt:formatNumber type = "number" groupingUsed="true" value = "${item.product.price}" />₫</td>
                            <td class="align-middle">
	                            <div class="form-group">
								    <select class="form-control" id="selectQuantiry" data-id="${item.productId}" onchange="QuantityChanged(this, ${item.quantity}, ${item.productId})">
								    
								    	<c:forEach var="i" begin="1" end="${item.product.quantity}">
								    		<c:if test="${i ==  item.quantity}">
								    			<option value="starter" selected>${i}</option>
								    		</c:if>
								    		<c:if test="${i !=  item.quantity}">
								    			<option>${i}</option>
								    		</c:if>
								      		
								      	</c:forEach>
								    </select>
								  </div>
                               
                            </td>
                            <td class="align-middle"><fmt:formatNumber type = "number" groupingUsed="true" value = "${item.totalPrice}" />₫</td>
                            <td class="align-middle"><a href='<c:url value = "/xoa-gio-hang/${item.productId}"/>' class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                        </tr>
                        </c:forEach>
                       </c:if>
                       
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <!-- <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form> -->
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng sản phẩm</h6>
                            <h6 class="font-weight-medium">${TotalQuantity}</h6>
                        </div>
                        
                       <!--  từ từ làm -->
                        <!-- <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">$10</h6>
                        </div> -->
                        
                        
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng Tiền</h5>
                            <h5 class="font-weight-bold"><fmt:formatNumber type = "number" groupingUsed="true" value = "${TotalPrice}" />₫</h5>
                        </div>
                        <button class="btn btn-block btn-primary my-3 py-3">Thanh toán</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->
    
    <content tag="script">
    	<script>
    	function QuantityChanged(obj, quantity, productId) {
			var value = obj.value;
			if (value != quantity){
				window.location = "sua-gio-hang/"+productId+"/" + value;
			}
		}
    		
    	</script>
    </content>
</body>