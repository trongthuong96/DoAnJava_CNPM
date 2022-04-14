<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/WEB-INF/common/taglib.jsp" %> 

<title>Quản lý sản phẩm</title>
<body>
<!-- page content -->
  <div class="right_col" role="main">
    <div class="container">
      <div class="row">
        <h1>Quản lí sản phẩm</h1>
        <button onclick="window.location.href='<c:url value="/quan-tri/them-san-pham" />'" class="btn btn-round btn-success" style="margin-left: 915px;">
          <i class="fa fa-folder"></i>  Thêm sản phẩm
      </button>
        <div class="col-12">
        <table class="table table-image">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Hình ảnh</th>
              <th scope="col">Tên sản phẩm</th>
              <th scope="col">Số lượng</th>
              <th scope="col">Xóa</th>
              <th scope="col">Sửa</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="item" items="${listProduct}">
            <tr>
              <td>${item.productId}</td>
              <td class="w-20">
                <img src='<c:url value="/assets/img/${item.image}"></c:url>' style="max-width: 7rem;" class="img-fluid img-thumbnail" alt="Sheep">
              </td>
              <td>${item.productName}</td>
              <td>${item.quantity}</td>
              <td><button type="button" class="btn btn-round btn-danger"><i class="fa fa-trash-o"></i> Xóa</button></td>
              <td><button onclick="window.location.href='editProduct.html'" class="btn btn-round btn-warning"><i class="fa fa-pencil"></i>Sửa</button></td>
            </tr>
            </c:forEach>
          </tbody>
        </table>   
        </div>
      </div>
    </div>
  </div>
  <!-- /page content -->
</body>