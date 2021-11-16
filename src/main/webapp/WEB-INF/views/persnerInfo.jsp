<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/productMain.css" rel="stylesheet"/>
<script type="text/javascript" src="js/check.js"></script>
<!-- jqure -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
label {
    width: 100%;
    margin-bottom: 0.375rem;
    line-height: 1.25rem;
    /* display: inline-block; */
    align-content: left;
    
}
form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
body {
    font-family: "Inter", 'NotoSansKR', "Helvetica Neue", Helvetica, Arial, "맑은 고딕", malgun gothic, "돋움", Dotum, sans-serif, "Apple Color Emoji", "Noto Color Emoji";
    font-size: 16px;
    background-color: white;
    color: #263747;
    line-height: 1.4;
}
.container {
    max-width: 50vw;
    max-height: 100vh;
    padding-right: 16px;
    padding-left: 16px;
    margin-right: auto;
    margin-left: auto;
    position: relative;
}
.form-group{
    position: relative;
    margin-bottom: 1.5rem;
}
.btn-sm {
    padding: 0.125rem 0.375rem;
    font-size: 0.75rem;
    line-height: 1.125rem;
}
div {
   /* display: block; */
}
.form-check-label{
	display: none;
}
.form-control{
	width: 50%;
} 
.form-check-input{
	margin: 0px;
}
footer{
	width: 100%;
	position: relative;
	bottom: -200%;
	left: 0;
}

.subscribe-box {
	width: 31%;
	height: 220px; 
	margin: 1%;

}

.img-box{
	width: 220px;
	height: 220px;
	position: relative;
	margin-right: 10px;
	border: 1px solid gray;
	border-radius: 4px;
}

.rankicon {
	position: absolute;

}

img {
  width: 99%;
  height: 99%;
  object-fit: fill;
}

.itemName1{
	padding-top: 40px;
	margin-bottom: 10px;

}

.name-box{
	width: 220px;
}

.top-rankicon{
	position: absolute;
	right: 70px;
	width: 100px;
	height: 27px;
	font-size: 23px;

}

hr.hr {
	margin-bottom: 0em;
}
/*
.bbb{
	width: 1000px;
	margin-left: auto;
	margin-right: auto;	
}

.s-horizon {
	float: left;
}

.s-horizon_wrap {
	content: "";
	display: block;
	clear: both;
}
*/

</style>
<title>persner infomation</title>
</head>
<body>

<fmt:requestEncoding value="UTF-8"/>
    	<!-- 홈페이지 메인 상단 -->
  	<c:if test="${id!=null&&id.trim().length()!=0}">
    	<div class="container-fluid p-5 bg-white text-black">
			<div class="row">
		    	<div class="col-sm-6 text-center">
					<h1>홈페이지 이름</h1>
		    	</div>
		    	<div class="col-sm-6 text-center" >
      				<button type="button" class="btn" onclick="location.href='logout'">logout</button>
      				<button type="button" class="btn" onclick="location.href='persnerInfo?id=${id}'">My</button>
      				<button type="button" class="btn">
      					<i class="bi-cart-fill me-1"></i>
      					Cart
      				</button>
				</div>
			</div>
		</div>
	</c:if>
   <c:if test="${id==null||id.trim().length()==0}">
    	<div class="container-fluid p-5 bg-white text-black">
			<div class="row">
		    	<div class="col-sm-6 text-center">
					<h1>홈페이지 이름</h1>
		    	</div>
		    	<div class="col-sm-6 text-center" >
      				<button type="button" class="btn" onclick="login('login')">Login</button>
      				<button type="button" class="btn" onclick="login('join')">Join</button>
				</div>
			</div>
		</div>
	</c:if>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                	aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                	<span class="navbar-toggler-icon"></span></button>
                	
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-0 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="homePage">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="speakerMain">Speaker</a></li>
                        <li class="nav-item"><a class="nav-link" href="interiorMain">Interior</a></li>
                        <li class="nav-item"><a class="nav-link" href="lightingMain">Lighting</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Service</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="as">Offline Store</a></li>
                                <li><a class="dropdown-item" href="comunity">Q & A</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
<!-- 중간 -->
	<div class="container">
		<div class="container" align="center">
		<br><br><br>
			<h2 class="h2 headline" role="heading">${id}님 안녕하세요</h2>
			<br>
			<hr class="hr">
				<div class="top-rankicon">
				<div class="badge bg-success text-white position-absolute" style="width: 100%; height: 100%;">Basic</div>
				<div class="badge bg-danger text-white position-absolute" style="color: black; width: 100%; height: 100%;">Standard</div>
				<div class="badge bg-dark text-white position-absolute" style="color: # FFD700; width: 100%; height: 100%;">Premium</div>
				</div>
			<br>
			<h4>나의 정보</h4>
		</div>
			<br>
		<form action="persnerInfo2" role="form" class="edit" id="edit" accept-charset="UTF-8" method="post" onsubmit="return check(this)" name="form">
			<input type="hidden" value="${id}" name="id">
			<div align="center">
			<div class="form-group">
				<label class="required" for="user_name">&nbsp;&nbsp;&nbsp;▲ 이름</label>
				<input class="form-control" type="text" value="${memberVO.name}" name="name" id="user_name">
	 		</div>
			<div class="form-group">
				<label class="required" for="user_password">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▲ 비밀번호</label>
				<input class="form-control" type="text" value="${memberVO.password}" name="password" id="user_password">
	 		</div>
			<div class="form-group">
				<label class="required">&nbsp;&nbsp;▲ 성별</label>
	 		</div>
			<c:if test="${memberVO.sex==1}">
				<div class="form-group" style="display: flex;">
				<div style="width:99%;">
					<input class="form-check-input" type="radio" checked="checked" value="1" name="sex" id="user_gender_m"> 남
					<label class="form-check-label" for="user_gender_m"></label>
				</div>
		 		</div>
				<div class="form-group" style="display: flex;">
				<div style="width:99%;">
					<input class="form-check-input" type="radio" value="0" name="sex" id="user_gender_f"> 여
					<label class="form-check-label" for="user_gender_f"></label>
	 			</div>
		 		</div>
	 		</c:if>
			<c:if test="${memberVO.sex==0}">
				<div class="form-group" style="display: flex;">
				<div style="width:99%;">
					<input class="form-check-input" type="radio" value="1" name="sex" id="user_gender_m"> 남
					<label class="form-check-label" for="user_gender_m"></label>
				</div>
	 			</div>
				<div class="form-group" style="display: flex;">
	 			<div style="width:99%;">
					<input class="form-check-input" type="radio" checked="checked" value="0" name="sex" id="user_gender_f"> 여
					<label class="form-check-label" for="user_gender_f"></label>
	 			</div>
	 			</div>
	 		</c:if>
			<div class="form-group">
				<label class="required" for="user_email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▲ 이메일</label>
				<input class="form-control" type="email" value="${memberVO.email}" name="email" id="user_email">
	 		</div>
			<div class="form-group">
				<label class="required" for="user_addr">▲ 주소</label>
				<input class="form-control" type="text" value="${memberVO.addr}" name="addr" id="user_addr">
	 		</div>
			<div class="form-group">
				<label class="required" for="user_phone">&nbsp;&nbsp;&nbsp;&nbsp;▲ 핸드폰</label>
				<input class="form-control" type="text" value="${memberVO.phone}" name="phone" id="user_phone">
	 		<br>
	 		<input type="submit" name="commit" value="저장" class="btn btn-black btn-sm" data-disable-with="저장" style="border-color: black;" >
	 		</div>
	 		
		 		 <!-- 구독 -->
		 		 <h5>구독 정보</h5>

	 	</div>
	</form>
	 		<c:forEach var="item" items="${itemList}">
	 			<form action="returnItem">
					<div style="display: flex;">
						<input type="hidden" value="${id}" name="id"/>
						<img alt="a" src="images/${item.img}.jpg" style="width:100px; height: 100px;" value="${item.img}" name="img">
						<div style="display: inline-block; width: 200px; height: 100px;" value="${item.furnitureName}" name="furnitureName">${item.furnitureName}</div>
						<div style="display: inline-block; width: 200px; height: 100px;" value="${item.grade}" name="grade">${item.grade}</div>
						<input type="submit" value="반납하기">
					</div>	 	
				</form>	 
			</c:forEach>
	</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/home.js"></script>	
</body>
</html>














