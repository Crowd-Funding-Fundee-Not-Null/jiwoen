<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String cp1 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="<%=cp1 %>/resources/css/bootstrap.css" />
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />


<style>
  .container { max-width: 1080px; }
  .brand { font-weight: 700; letter-spacing: .5px; color:#000; text-decoration:none; }
  .mypage-header {
    background:#f8f9fa; border-radius:16px; padding:28px; text-align:center; margin:24px 0 28px;
  }
  .mypage-header h2 { margin-bottom:8px; font-size:1.5rem; }
  .meta { color:#6c757d; margin-bottom:12px; }
  .quick a { margin:0 6px 8px; }
  .card-link { text-decoration:none; color:inherit; display:block; }
  .card-link .card { border-radius:14px; transition:.25s; }
  .card-link:hover .card { transform: translateY(-4px); box-shadow:0 10px 20px rgba(0,0,0,.08); }
  
  /* 주소 공백 링크는 비활성 느낌 */
  a[href=""] { pointer-events:none; opacity:.55; }
  
</style>
</head>
<body>

 <!-- header section start -->
  
  <%@ include file="header.jsp" %>
  
  <!-- header section end -->


<div class="container">


 
  <!-- 상단 영역 -->
  <section class="mypage-header">
  <h2 style="all: unset; font-size:1.5rem; font-weight:600; display:block; text-align:center;">
    ${me.name} 님, 반갑습니다!
  </h2>
  <div class="meta">아이디: ${me.id} · 닉네임: ${me.nickname}</div>
</section>


  <!-- 메뉴 카드 -->
  <div class="row g-3">
    <div class="col-6 col-md-3">
      <a class="card-link" href="<%=cp1 %>/mypage.do">
        <div class="card p-3 text-center">
          <div class="fw-bold">회원정보 수정</div>
          <small class="text-muted">이메일/닉네임/주소</small>
        </div>
      </a>
    </div>

    <div class="col-6 col-md-3">
      <a class="card-link" href="<%=cp1 %>/buyListOk.do">
        <div class="card p-3 text-center">
          <div class="fw-bold">나의 구매 내역</div>
          <small class="text-muted">결제/배송 현황</small>
        </div>
      </a>
    </div>

    <!-- 이하 항목들은 주소 공백(비활성)위에 디자인 설정에 링크 넣으면 풀리게 설정해둠 -->
    <div class="col-6 col-md-3">
      <a class="card-link" href="">
        <div class="card p-3 text-center">
          <div class="fw-bold">찜 목록</div>
          <small class="text-muted">관심 상품</small>
        </div>
      </a>
    </div>

    <div class="col-6 col-md-3">
      <a class="card-link" href="">
        <div class="card p-3 text-center">
          <div class="fw-bold">쿠폰</div>
          <small class="text-muted">보유/사용 내역</small>
        </div>
      </a>
    </div>

    <div class="col-6 col-md-3">
      <a class="card-link" href="<%=cp1 %>/qna.do">
        <div class="card p-3 text-center">
          <div class="fw-bold">문의 내역</div>
          <small class="text-muted">1:1 문의</small>
        </div>
      </a>
    </div>

    <div class="col-6 col-md-3">
      <a class="card-link" href="">
        <div class="card p-3 text-center">
          <div class="fw-bold">알림</div>
          <small class="text-muted">새 소식</small>
        </div>
      </a>
    </div>

    <div class="col-6 col-md-3">
      <a class="card-link" href="">
        <div class="card p-3 text-center">
          <div class="fw-bold">포인트</div>
          <small class="text-muted">적립/사용</small>
        </div>
      </a>
    </div>

    <div class="col-6 col-md-3">
      <a class="card-link" href="">
        <div class="card p-3 text-center">
          <div class="fw-bold">배송지 관리</div>
          <small class="text-muted">주소록</small>
        </div>
      </a>
    </div>
  </div>

  <!-- 최근 활동 (샘플) -->
  <div class="mt-4">
    <h5 class="mb-2">최근 활동</h5>
    <ul class="list-group">
      <li class="list-group-item">최근 펀딩: OO프로젝트</li>
      <li class="list-group-item">최근 작성 글: 게시판 제목</li>
    </ul>
  </div>

</div>
</body>
</html>
