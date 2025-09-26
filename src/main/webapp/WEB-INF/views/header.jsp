<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Cookie[] ck = request.getCookies();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


  <!-- Basic -->
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="<%=cp %>/resources/images/favicon.png" type="">

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> Feane </title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=cp%>/resources/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="<%=cp %>/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%=cp %>/resources/css/responsive.css" rel="stylesheet" />




<style>

body {
	font-family: 'AppleSDGothicNeo', Pretendard-Regular, sans-serif;
	
}


.custom_nav-container .navbar-nav .nav-item .nav-link {
	color: black;
}


.hero_area {
	flex: none;
	min-height: 0;
}


.slider_section {
	margin: 0 auto;
	width: 900px;
	display: block;
	flex: none;
	padding-bottom: 20px;
}


.carousel-inner {
	border-radius: 10px;
}


.carousel-img {
	width: 900px;
	height: 304px;
	background-size: contain;
	border-radius: 10px;
}

.carousel-img1 {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm01/2025/0909/20250909093059458_7746.jpg/wadiz/resize/900/format/jpg/quality/85/");
}

.carousel-img2 {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm02/2025/0916/20250916165816865_7746.jpg/wadiz/resize/900/format/jpg/quality/85/");
	
}

.carousel-img3 {
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm01/2025/0916/20250916164542769_7746.png/wadiz/resize/900/format/jpg/quality/85/");
}


.carousel-img-explain {
	width: 600px !important;
	margin-top: 200px;
	margin-left: 20px;
	vertical-align: bottom;
	
}


.slider_section .carousel-indicators li {
	border: 1px solid #ffbe33;
}

.carousel-indicators {
	margin-top: 10px !important;
}

.carousel-control-prev {
	margin-top: 165px;
	height: 50px;
}
.carousel-control-next {
	margin-top: 165px;
	height: 50px;
}


.main-rcm-intro {
	font-size: 21px;
	font-weight: 600;
	margin-bottom: 0;
	margin-left: 15px;
}

.main-rcm-box {
	margin-top: 10px !important;
	
}


.offer_section {
	padding-bottom: 45px;
}

.offer_section .box {
	background-color: #ffffff;
}


.main-rcm-img {
	width: 240px; 
	height: 180px;
	border-radius: 10px;
	object-fit: cover;
	margin-right: 17px;
}


.detail-box-left {
	color: black;
}
.detail-box-right {
	height: 180px;
	color: black;
}


.main-rcm-percent {
	color: #ff6666; 
	font-weight: 500; 
	font-size:17pt;
}
.main-rcm-amount {
	color: #212529; 
	font-weight: 300; 
	font-size:12pt;
}
.main-rcm-price {
	color: #27caa1; 
	font-weight: 500; 
	font-size:17pt;
	
}
.main-rcm-subject {
	color: #212529;
}
.main-rcm-seller {
	color: gray;
}
.main-rcm-rate {
	color: #212529;
}
.main-rcm-ratecount {
	font-size:10pt; color: gray;
}


.detail-box-top {
	
}
.detail-box-price {
	margin-bottom: 3px;
}
.detail-box-subject {

}
.detail-box-seller {
	position: absolute;
	bottom: 50px;
}
.detail-box-bottom {
	position: absolute;
	bottom: 22px;
}



.main-random-intro {
	font-size: 21px;
	font-weight: 600;
	margin-bottom: 30px;
	margin-left: 15px;
}


.refreshBtn {
	display: inline-block;
	border: 1px darkgray solid;
	border-radius: 5px;
	cursor: pointer;
	float: right;
	margin-right: 30px;
	vertical-align: middle;
	padding: 7px 9px 7px 9px;
	color: #212529; 
	font-size: 15px;
	box-shadow: 0 0 3px;
}






</style>


<style>


/* From Uiverse.io by KSAplay */ 
.likey-container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.likey-container {
  display: block;
  position: absolute;
  right: 50px;
  bottom: 0px;
  cursor: pointer;
  font-size: 20px;
  user-select: none;
  transition: 100ms;
}

.checkmark {
  top: 0;
  left: 0;
  height: 2em;
  width: 2em;
  transition: 100ms;
  animation: dislike_effect 400ms ease;
}

.likey-container input:checked ~ .checkmark path {
  fill: #FF5353;
  stroke-width: 0;
}

.likey-container input:checked ~ .checkmark {
  animation: like_effect 400ms ease;
}

.likey-container:hover {
  transform: scale(1.1);
}

@keyframes like_effect {
  0% {
    transform: scale(0);
  }

  50% {
    transform: scale(1.2);
  }

  100% {
    transform: scale(1);
  }
}

@keyframes dislike_effect {
  0% {
    transform: scale(0);
  }

  50% {
    transform: scale(1.2);
  }

  100% {
    transform: scale(1);
  }
}

/* 네비게이션바 스타일 */
.navbar-nav .nav-item .nav-link {
    color: #000000 !important;
    font-weight: 500;
    padding: 10px 20px !important;
    margin: 0 5px;
    border-radius: 25px;
    transition: all 0.3s ease;
    text-decoration: none !important;
    border: none !important;
    background: none !important;
    box-shadow: none !important;
}

.navbar-nav .nav-item .nav-link:hover {
    color: #ffbe33 !important;
    background-color: transparent !important;
    transform: translateY(-2px);
}

.navbar-nav .nav-item.active .nav-link {
    color: #333 !important;
    background-color: transparent !important;
    border-bottom: none !important;
    box-shadow: none !important;
}

.navbar-nav .nav-item.active .nav-link:hover {
    color: #ffbe33 !important;
    transform: translateY(-2px);
}

.navbar-nav .nav-link:focus,
.navbar-nav .nav-link:active {
    outline: none !important;
    box-shadow: none !important;
    border: none !important;
}

.navbar {
    padding-top: 1rem;
    padding-bottom: 1rem;
}

.navbar-brand {
    font-size: 1.8rem;
    font-weight: bold;
    color: #333 !important;
}

.navbar-brand:hover {
    color: #ffbe33 !important;
}


.header_section .navbar-nav { 
  flex-direction: row !important;      
  align-items: center;
}
.header_section .navbar-nav .nav-item {
  display: inline-block;             
  margin: 0 8px;
}
.header_section .navbar-nav .nav-link {
  writing-mode: horizontal-tb !important; 
  white-space: nowrap;                 
  display: inline-block;
  line-height: 1.2;                     
}

.admin-only, .admin-only * {
  writing-mode: horizontal-tb !important;
}
.admin-only { 
  max-width: 1100px; 
  margin: 24px auto; 
}
.admin-only h2 { 
  margin: 0 0 12px; 
  font-size: 22px; 
  line-height: 1.3;
}

.logout-box {
  display: flex;
  flex-direction: column; 
  align-items: center;    
  margin-left: 10px;
}

.logout-box .nickname {
  margin-top: 6px;       
  color: black;
  font-weight: 500;
  white-space: nowrap;   
}





</style>





</head>
<body>

  <div class="hero_area">
  <!--  
  	<div class="bg-box">
      <img src="< %=cp %>/resources/images/hero-bg.jpg" alt="">
    </div>
-->

    <!-- header section strats -->
   <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.do">
            <span style="color:black !important;">
              Fundee
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto "  style="padding-left: 0; margin-left:20px !important;">
              <li class="nav-item active">
                <a class="nav-link" href="index.do">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="list.do">펀딩하기</a>
              </li>            
              
              <li class="nav-item">
                <a class="nav-link" href="notice.do">공지사항</a>
              </li>          

              <!-- 관리자만 보이는 링크 -->
			  <c:if test="${sessionScope.loginRole == 1}">
			    <li class="nav-item">
			      <a class="nav-link" href="${pageContext.request.contextPath}/admin.do">관리자 페이지</a>
			    </li>
			  </c:if>
			</ul>
						  
			  <!-- 관리자 전용  관리자만 보임 -->
			<c:if test="${sessionScope.loginRole == 1}">
			  <section class="admin-only" style="margin:24px 0;">
			    <div class="container">			   
			    </div>
			  </section>
			</c:if>
			             
           
            
            <div class="user_option">
            
                <a href="${pageContext.request.contextPath}/userpage.do" class="user_link">
				  <i class="fa fa-user" aria-hidden="true" style="color:#ffbe33; font-size:1.3em;"></i>
				</a>

              
              <c:choose>
				  <c:when test="${not empty sessionScope.loginId}">
				  
				    <!-- 로그인 상태: 로그아웃 버튼 -->
				    <div class="logout-box">
					  <a href="${pageContext.request.contextPath}/logout" class="order_online">logout</a>
					
					<!-- 닉네임(없으면 ID로 대체) -->
					  <div class="nickname">
					    <c:choose>
					      <c:when test="${not empty sessionScope.loginNickname}">
					        ${fn:escapeXml(sessionScope.loginNickname)}님
					      </c:when>
					      <c:otherwise>
					        ${fn:escapeXml(sessionScope.loginId)}님
					      </c:otherwise>
					    </c:choose>
					  </div>
					</div>
				  </c:when>
				
				  <c:otherwise>
				    <!-- 비로그인 상태: 로그인/회원가입 -->
				    <a href="${pageContext.request.contextPath}/loginForm.do" class="order_online">login</a>
				    <a href="${pageContext.request.contextPath}/join.do" class="order_online">join</a>
				  </c:otherwise>
				</c:choose>
              
              
              
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>









</body>
</html>