<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="col-md-3 left_col">
   <div class="left_col scroll-view">
     <div class="navbar nav_title" style="border: 0;">
       <a href="indexAdmin.html" class="site_title"><img src="<c:url value="/assets/admin/production/images/favicon1.ico" />" style="height: 40%; width: 11%;"> 
         <span>Linh Kiện</span></a>
     </div>

     <div class="clearfix"></div>

     <!-- menu profile quick info -->
     <div class="profile clearfix">
       <div class="profile_pic">
         <img src="<c:url value="/assets/admin/production/images/img.jpg" />" alt="..." class="img-circle profile_img">
       </div>
       <div class="profile_info">
         <span>Xin chào,</span>
         <h2>${userAdmin.firstName} ${userAdmin.lastName}</h2>
       </div>
     </div>
     <!-- /menu profile quick info -->

     <br />

     <!-- sidebar menu -->
     <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
       <div class="menu_section">
         <ul class="nav side-menu">
           <li><a href='<c:url value="/quan-tri" />'><i class="fa fa-home"></i> Trang chủ </a></li>
           <li><a><i class="fa fa-edit"></i> Quản lí cửa hàng <span class="fa fa-chevron-down"></span></a>
             <ul class="nav child_menu">
               <li><a href="#">Quản lí khách hàng</a></li>
               <li><a href='<c:url value="/quan-tri/san-pham" />'>Quản lí sản phẩm</a></li>
             </ul>
           </li>
           <li><a href="#"><i class="fa fa-calendar-o"></i> Quản lí đơn hàng </a></li>
         </ul>
       </div>
     </div>
     <!-- /sidebar menu -->
   </div>
 </div>

 <!-- top navigation -->
 <div class="top_nav">
   <div class="nav_menu">
       <div class="nav toggle">
         <a id="menu_toggle"><i class="fa fa-bars"></i></a>
       </div>
       <nav class="nav navbar-nav">
       <ul class=" navbar-right">
         <li class="nav-item dropdown open" style="padding-left: 15px;">
           <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
             <img src="<c:url value="/assets/admin/production/images/img.jpg" />" alt="">${userAdmin.firstName} ${userAdmin.lastName}
           </a>
           <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
             <a class="dropdown-item"  href="javascript:;"> Thông tin</a>
             <a class="dropdown-item"  href='<c:url value="/dang-xuat"/>'><i class="fa fa-sign-out pull-right"></i> Đăng xuất</a>
           </div>
         </li>
       </ul>
     </nav>
   </div>
 </div>
 <!-- /top navigation -->