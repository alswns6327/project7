<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/basket.js" ></script>
<script src="js/wishAndChoice.js" ></script>
<!-- 
<link rel="stylesheet" href="css/basket.css">
 -->
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

	<!-- 장바구니 -->	
	<!-- <form id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;" name="orderform"> -->
		<!-- 컨터이너 시작 -->
		<div class="container" align="center">
			<div style="width: 800px; display: flex; background-color: #d2d2d2; height: 30px;">
					<div style="width: 10%" align="center">등급</div>
					<div style="width: 30%" align="center">이미지</div>
					<div style="width: 20%" align="center">상품명</div>
					<div style="width: 20%" align="center">사용</div>
					<div style="width: 20%" align="center">삭제</div>
			</div>
			<!-- 상품 한묶음 -->
			<div id="basket">
			<br>
			<c:forEach var="item" items="${itemList}">
				<div class="basket" style="width: 800px; display: flex;">
					<c:if test="${item.grade=='basic'}">
						<c:set var="grade" value="1"/>
						<div style="width: 10%" align="center"><div class="badge bg-success text-white position-absolute" style="width: 100%; height: 100%;">Basic</div></div>
					</c:if>
					<c:if test="${item.grade=='standard'}">
						<c:set var="grade" value="2"/>
						<div style="width: 10%" align="center"><div class="badge bg-success text-white position-absolute" style="width: 100%; height: 100%;">Standard</div></div>
					</c:if>
					<c:if test="${item.grade=='premium'}">
						<c:set var="grade" value="3"/>
						<div style="width: 10%" align="center"><div class="badge bg-success text-white position-absolute" style="width: 100%; height: 100%;">Premium</div></div>
					</c:if>
					<div style="width: 30%" align="center"><img alt="" src="images/${item.img}.jpg" style="width: 100px; height: 100px;"></div>
					<div style="width: 20%" align="center">${item.furnitureName}</div>
					<div style="width: 20%" align="center"><button class="btn btn-secondary" onclick="choice('${grade}','${item.furnitureName}', '${id}','${img}')">사용</button></div>
					<form action="deleteWishItem">
						<div style="width: 20%" align="center"><button class="btn btn-secondary" type="submit">삭제</button></div>
						<input type="hidden" value="${id}" name="id"/>
						<input type="hidden" value="${item.img}" name="img"/>
					</form>
				</div>
				<hr style="width: 800px; color:#999999; border-style:dotted">
			</c:forEach>
			</div>
			
			<!-- 상품 한묶음 -->
			<div id="basket">
			<br>
			<div  style="width: 1200px; display: flex;">
				<div style="width: 10%" align="center"><input type="checkbox"></div>
				<div style="width: 30%" align="center">이미지</div>
				<div style="width: 15%" align="center">스피커</div>
				<div style="width: 15%" align="center">30,000원</div>
				<div style="width: 15%" align="center"><input class="text-center me-3" id="inputQuantity" type="number" min="1" value="1" style="max-width: 3rem" /></div>
				<div style="width: 15%" align="center"><button class="btn btn-secondary" onclick="deleteImg()">삭제</button></div>
			</div>
				<hr style="width: 1200px; color:#999999; border-style:dotted">
			</div>
			
			
			<!-- 구매하기버튼 -->
			<br>
			<div style="width: 1200px;">
				<div align="center"><input id="button" class="btn btn-secondary" onclick="pay()" value="구매하기" type="button"></div>
			</div>
		</div>
	<!-- </form> -->
	
</body>
</html>




















