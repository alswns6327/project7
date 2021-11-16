<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
	
<link href="css/productMain.css" rel="stylesheet" />
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/> -->
<style type="text/css">
	.table{
		width: 800px;
		height: 800px;
	}
	.reply .textarea{
		width: 750px;
		height: 100px;
	}
	.reply .input{
		width: 100px;
		height: 50px;
	}
	.replyTable .replyHead{
		width: 750px;
		height: 100px;
	}
	.replyTable .replyBody{
		width: 50px;
		height: 50px;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/view.css" rel="stylesheet" />
</head>
<body style="background-image: url(images/6.jpg);">
	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">홈페이지 이름</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- 글쓰기 -->
	<br/>
	<div class="container">
		<div class="writeWrap" style="width: 1000px; height: 500px;"
			align="center">
			<div class="contentTable">
				<div class="writeHeader">
					<h2 class="title" align="left">&nbsp;&nbsp;제목 : ${boardVO.title}</h2>
				</div>
				<hr />
				<div class="content">
					<table>
						<tbody>
							<tr>
								<td>${boardVO.content}</td>
							</tr>
						</tbody>
					</table>
				</div>
			<hr/>
			</div>
			<!-- 댓글이 있을때 -->
				<table width="600" cellpadding="0" cellspacind="0" class="replyTable">
					<c:set var="replyList" value="${replyBoardList.list}"/>
					<c:forEach var="reply" items="${replyList}">
						<tr align="center" class="replyHead">
							<td align="center" width="600">작성자: ${reply.id}</td>
						</tr>
						<tr align="center" class="replyBody">
							<td>내용: ${reply.reply}</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="5" align="center">
								<!-- 처음으로 -->
								<c:if test="${replyBoardList.currentPage>1}">
									<button type="button" class="button button1" title="첫 페이지로 이동" onclick="location.href='content?idx=${idx}&currentPage=1'"><<</button>
								</c:if>
								<c:if test="${replyBoardList.currentPage<=1}">
									<button type="button" class="button button2" title="이미 첫 페이지입니다." disabled="disabled"><<</button>
								</c:if>
								<!-- 10페이지 앞으로 -->
								<c:if test="${replyBoardList.startPage>1}">
									<button type="button" class="button button1" title="이전 10페이지로" onclick="location.href='content?idx=${idx}&currentPage=${replyBoardList.currentPage-replyBoardList.pageSize}'"><</button>
								</c:if>
								<c:if test="${replyBoardList.startPage<=1}"> 
									<button type="button" class="button button2" title="첫 페이지입니다." disabled="disabled"><</button>
								</c:if>
								<c:forEach var="i" begin="${replyBoardList.startPage}" end="${replyBoardList.endPage}" step="1">
									<c:if test="${replyBoardList.currentPage==i}">
											<button type="button" class="button button2" disabled="disabled">${i}</button>
									</c:if>
									<c:if test="${replyBoardList.currentPage!=i}">
											<button type="button" class="button button1" onclick="location.href='content?idx=${idx}&currentPage=${i}'">${i}</button>
									</c:if>
								</c:forEach>
								<c:if test="${replyBoardList.endPage<replyBoardList.totalPage }">
									<button type="button" class="button button1" onclick="location.href='content?idx=${idx}&currentPage=${replyBoardList.currentPage+replyBoardList.pageSize}'">></button>
								</c:if>
								<c:if test="${replyBoardList.endPage>=replyBoardList.totalPage}">
									<button type="button" class="button button2" disabled="disabled">></button>
								</c:if>
								<!-- 마지막으로 -->
								<c:if test="${replyBoardList.currentPage<replyBoardList.totalPage}">
									<button type="button" class="button button1" title="마지막 페이지로 이동" onclick="location.href='content?idx=${idx}&currentPage=${replyBoardList.totalPage}'">>></button>
								</c:if>
								<c:if test="${replyBoardList.currentPage>=replyBoardList.totalPage}">
									<button type="button" class="button button2" title="마지막 페이지입니다." disabled="disabled">>></button>
								</c:if>
							</td>
						</tr>
				</table>
			<br />
			<!-- 리플 글쓰기 -->
			<form action="reply">
				<div class="reply">
					<textarea name="reply" placeholder="댓글을 입력해주세요" class="contentIn textarea"></textarea>
					<input type="submit" value="등록하기" class="mybtn input">
					<input type="hidden" name="idx" value="${boardVO.idx}">
					<c:if test="${id!=null}">
						<input type="hidden" name="id" value="${id}">
					</c:if>
					<c:if test="${id==null}">
						<input type="hidden" name="id" value="비회원">
					</c:if>
				</div>
			</form>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>