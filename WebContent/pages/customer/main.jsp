<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodcourt.common.UserType" %>
<%@ page import="com.foodcourt.common.model.Meal" %>

<%@ page import="java.util.List"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Smart Food Court System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo/favicon.ico">
</head>

<body>
	
    <c:import url="/header_customer.jsp">
    	<c:param name="navbar_opt" value="0"/>
    </c:import>

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
					<c:forEach items="${mealList}" var="meal" varStatus="loop">
						<div class="col-lg-3">
							<div class="categories__item set-bg" data-setbg=
							"${pageContext.request.contextPath}${meal.imgSrc}">
								<h5><a onclick="addToShoppingCart(${meal.id}, '${pageContext.request.contextPath}/customer/cart', 1)">Thêm vào giỏ</a></h5>
							</div>
						</div>
					</c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Các món nổi bật</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">Tất cả</li>
                            <li data-filter=".breakfast">Bữa sáng</li>
                            <li data-filter=".lunch">Bữa trưa</li>
                            <li data-filter=".dinner">Bữa tối</li>
                            <li data-filter=".drink">Nước uống</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            	<c:forEach items="${mealList}" var="meal" varStatus="loop">
            		<c:forEach items="${meal.tag}" var="tag" varStatus="loop">
            			<c:set var="tagstring" value="${tagstring} ${tag}"/>
            		</c:forEach>
                	<div class="col-lg-3 col-md-6 col-sm-12 mix <c:out value="${tagstring}"/>">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg=
	                        "${pageContext.request.contextPath}${meal.imgSrc}">
	                            <ul class="featured__item__pic__hover">
	                                <li><a onclick="addToShoppingCart(${meal.id}, '${pageContext.request.contextPath}/customer/cart', 1)"><i class="fa fa-shopping-cart"></i></a></li>
	                                <li><a href="${pageContext.request.contextPath}/customer/itemDetail?mealID=${meal.id}"><i class="fa fa-info-circle"></i></a></li>
	                            </ul>
	                        </div>
							<div class="featured__item__text">
								<h6><a href="${pageContext.request.contextPath}/customer/itemDetail?mealID=${meal.id}">${meal.name}</a></h6>
								<h5>${meal.price} &#8363;</h5>
							</div>	
	                    </div>
               	 	</div>
               	 	<c:remove var="tagstring"/>
                 </c:forEach>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="banner__pic">
                        <img src="${pageContext.request.contextPath}/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="banner__pic">
                        <img src="${pageContext.request.contextPath}/img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
   <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Mới nhất</h4>
                        <div class="latest-product__slider owl-carousel">
                        	<c:forEach var="idx" varStatus="" begin="0" end="1">
                        		<c:set var="begin_loop_idx" value="${idx * 3}"/>
                        		<c:set var="end_loop_idx" value="${idx * 3 + 2}"/>
	                            <div class="latest-prdouct__slider__item">
	                            	<c:forEach items="${mealList}" var="meal" varStatus="loop" begin="${begin_loop_idx}" end="${end_loop_idx}">
		                                <a href="${pageContext.request.contextPath}/customer/itemDetail?mealID=${meal.id}" class="latest-product__item">
		                                    <div class="latest-product__item__pic">
		                                        <img src="${pageContext.request.contextPath}${meal.imgSrc}"
		                                        alt="">
		                                    </div>
		                                    <div class="latest-product__item__text">
		                                        <h6>${meal.name}</h6>
		                                        <span>${meal.price}&#8363;</span>
		                                    </div>
		                                </a>
	                                </c:forEach>
	                            </div>		
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Đánh giá cao nhất</h4>
                        <div class="latest-product__slider owl-carousel">
                        	<c:forEach var="idx" varStatus="" begin="0" end="2">
                        		<c:set var="begin_loop_idx" value="${idx * 3}"/>
                        		<c:set var="end_loop_idx" value="${idx * 3 + 2}"/>
	                            <div class="latest-prdouct__slider__item">
	                            	<c:forEach items="${mealList}" var="meal" varStatus="loop" begin="${begin_loop_idx}" end="${end_loop_idx}">
		                                <a href="${pageContext.request.contextPath}/customer/itemDetail?mealID=${meal.id}" class="latest-product__item">
		                                    <div class="latest-product__item__pic">
		                                        <img src="${pageContext.request.contextPath}${meal.imgSrc}"
		                                        alt="">
		                                    </div>
		                                    <div class="latest-product__item__text">
		                                        <h6>${meal.name}</h6>
		                                        <span>${meal.price} &#8363;</span>
		                                    </div>
		                                </a>
	                                </c:forEach>
	                            </div>		
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Được đề cử</h4>
                        <div class="latest-product__slider owl-carousel">
                        	<c:forEach var="idx" varStatus="" begin="1" end="2">
                        		<c:set var="begin_loop_idx" value="${idx * 3}"/>
                        		<c:set var="end_loop_idx" value="${idx * 3 + 2}"/>
	                            <div class="latest-prdouct__slider__item">
	                            	<c:forEach items="${mealList}" var="meal" varStatus="loop" begin="${begin_loop_idx}" end="${end_loop_idx}">
		                                <a href="${pageContext.request.contextPath}/customer/itemDetail?mealID=${meal.id}" class="latest-product__item">
		                                    <div class="latest-product__item__pic">
		                                        <img src="${pageContext.request.contextPath}${meal.imgSrc}"
		                                        alt="">
		                                    </div>
		                                    <div class="latest-product__item__text">
		                                        <h6>${meal.name}</h6>
		                                        <span>${meal.price} &#8363;</span>
		                                    </div>
		                                </a>
	                                </c:forEach>
	                            </div>		
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->
    
    <c:import url="/footer.jsp" />
  
    <!-- Modals -->
	<div class="modal fade" id="orderSuccessModal" tabindex="-1" role="dialog" aria-labelledby="orderSuccessModalTitle" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
		      	<div class="modal-header">
	        		<h5 class="modal-title" id="orderSuccessModalTitle">Thông báo</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	<div class="modal-body">
		      		<p>Đã thêm vào giỏ hàng!</p>
	      		</div>

	    	</div>
	  	</div>
	</div>

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/main.js"></script>
</body>

</html>