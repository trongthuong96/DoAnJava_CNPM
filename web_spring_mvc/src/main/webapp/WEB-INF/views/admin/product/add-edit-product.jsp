<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/WEB-INF/common/taglib.jsp" %> 
<title>Thêm sản phẩm</title>
<body>
<!-- page content -->
 <div class="right_col" role="main">
   <h1>Thêm sản phẩm</h1>
   <form:form class="form-register" method="POST" modelAttribute="addAndUpdateProduct" enctype="multipart/form-data">
     <fieldset>
         <!-- <div class="form-group d-md-flex align-items-md-center">
           <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Ảnh sản phẩm</label>
           <div class="col-md-5">
             <input name="image" type="file" id="file" />
         </div>
         </div> -->
         <div class="form-group d-md-flex align-items-md-center">
             <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Tên sản phẩm</label>
             <div class="col-md-5">
                 <form:input path="productName" type="text" class="form-control" id="name" placeholder="Tên sản phẩm" required="required" />
             </div>
         </div>
         <div class="form-group d-md-flex align-items-md-center">
           <label class="control-label col-md-2" for="phone"><span class="require">*</span>Số lượng</label>
           <div class="col-md-5">
               <form:input path="quantity" type="text" class="form-control" id="amount" placeholder="Số lượng" maxlength="100" 
               onkeyup="checkNumber(this)" required="required" />
           </div>
          </div>
          <div class="form-group d-md-flex align-items-md-center">
            <label class="control-label col-md-2" for="price"><span class="require">*</span>Giá gốc</label>
            <div class="col-md-5">
               <form:input path="priceImport" type="text" class="form-control" id="price" placeholder="Giá gốc" maxlength="20" 
               onkeyup="checkNumber(this)" required="required" />
            </div>
         </div>
         <div class="form-group d-md-flex align-items-md-center">
            <label class="control-label col-md-2" for="price"><span class="require">*</span>Giá Bán</label>
            <div class="col-md-5">
               <form:input path="price" type="text" class="form-control" id="price" placeholder="Giá sản phẩm" maxlength="20" 
               onkeyup="checkNumber(this)" required="required" />
            </div>
         </div>
         <div class="form-group d-md-flex align-items-md-center">
           <label class="control-label col-md-2" for="sale"><span class="require">*</span>Giảm giá</label>
           <div class="col-md-5">
              <form:input path="sale" type="text" class="form-control" id="sale" placeholder="Số lượng" maxlength="20" 
              onkeyup="checkNumber(this)" required="required" />
           </div>
        </div>
         <div class="form-group d-md-flex align-items-md-center">
           <label class="control-label col-md-2" for="kind"><span class="require">*</span>Loại sản phẩm</label>
           <div class="col-md-5">
           
           <!-- category -->
                 <form:select path="typeId" class="wide">
                 	<option disabled selected value="NONE"> -- Chọn thể loại -- </option>
                 	<c:forEach var="type" items="${typeProduct}">
	                     <form:option value="${type.id}">${type.name}</form:option>
                     </c:forEach>
                 </form:select>
            <!-- category --> 
           
           </div>
        </div>
         <div class="form-group d-md-flex align-items-md-center">
           <label class="control-label col-md-2" for="kind"><span class="require">*</span>Nhãn hàng</label>
           <div class="col-md-5">
            
            <!-- brand -->
                 <form:select path="typeId" class="wide">
                 	<option disabled selected value="NONE"> -- Chọn nhãn hàng -- </option>
                 	<c:forEach var="type" items="${manufacter}">
	                     <form:option value="${type.id}">${type.name}</form:option>
                     </c:forEach>
                 </form:select>
            <!-- brand -->      
           
           </div>
        </div>
        
         <div class="form-group d-md-flex align-items-md-center">
             <label class="control-label col-md-2" for="l-name"><span class="require">*</span>Mô tả</label>
             <div class="col-md-5">
               <form:textarea path="decription" style="height: 100px;" name="message" class="form-control" placeholder="Mô tả sản phẩm" />
             </div>
         </div>  
     </fieldset>
     <div class="terms">
         <div class="float-md-center">
           <button type="submit" class="btn btn-dark" style="margin-left: 390px;">XÁC NHẬN</button>
         </div>
     </div>
 </form:form>
 </div>
 <!-- /page content -->

</body>