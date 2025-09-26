<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />

<style>
  .heading_container{
    display:flex;justify-content:center;align-items:center;
    margin:32px 0 24px;
  }
  .form_box{
    max-width:640px;margin:0 auto;background:#f8f9fa;
    padding:32px;border-radius:16px;box-shadow:0 4px 12px rgba(0,0,0,.06);
  }
  .form_box h2{ text-align:center;margin-bottom:22px;font-size:1.6rem;font-weight:600; }
  .form-group{ margin-bottom:16px; }
  label{ font-weight:500;margin-bottom:6px; }
  .btn-area{ text-align:center;margin-top:18px; }
  <!-- 내 정보 폰트 디자인 -->
  .lalala{
  font-size: 300px;
  align-items:center;
  }
  
  
</style>
<!-- 카카오 시작 -->
  <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 카카오 끝 -->

</head>
<body>

 <div class="heading_container">
    <a class="navbar-brand" href="<%=cp%>/index.do">
      <span style="color:#000;">Fundee</span>
    </a>
  </div>
  

  <!-- 카드형 폼 박스 -->
  <div class="form_box">
  

    <!-- 메시지 -->
    <c:if test="${not empty message}">
      <script>alert('${fn:escapeXml(message)}');</script>
    </c:if>

   <form action="<c:url value='/mypage/update.do'/>" method="post">

      <div class="form-group">
        <label>아이디</label>
        <input type="text" name="id" class="form-control" value="${me.id}" readonly />
      </div>
	
	  <!-- 새 비밀번호(선택) -->
	  <div class="form-group">
	    <label>새 비밀번호 (변경 시에만 입력)</label>
	    <input type="password" name="newPassword" class="form-control"
	           placeholder="변경 할 비밀번호" autocomplete="new-password" />
	  </div>
	  <div class="form-group">
	    <label>새 비밀번호 확인</label>
	    <input type="password" name="newPasswordConfirm" class="form-control"
	           placeholder="새 비밀번호 확인" />
	  </div>

      <div class="form-group">
        <label>닉네임</label>
        <input type="text" name="nickname" class="form-control" value="${fn:escapeXml(me.nickname)}" />
      </div>

      <div class="form-group">
        <label>이름</label>
        <input type="text" name="name" class="form-control" value="${fn:escapeXml(me.name)}" />
      </div>

      <div class="form-group">
        <label>이메일</label>
        <input type="email" name="email" class="form-control" value="${fn:escapeXml(me.email)}" />
      </div>

      <div class="form-group">
        <label>전화번호</label>
        <input type="text" name="phone" class="form-control" value="${fn:escapeXml(me.phone)}" />
      </div>

      <div class="field">
            <label for="address" readonly>주소</label>
<input type="text" id="sample6_postcode" name="zip_code"  value="${fn:escapeXml(me.zip_code)}" readonly>
<input type="button" onclick="sample6_execDaumPostcode()"value="우편번호 찾기"><br>
<input type="text" id="sample6_address" name="address1" class="form-control"  value="${fn:escapeXml(me.address1)}" readonly>
<input type="text" id="sample6_extraAddress" name="address2" class="form-control"  value="${fn:escapeXml(me.address2)}" readonly>
<input type="text" id="sample6_detailAddress" name="dong" class="form-control"  value="${fn:escapeXml(me.dong)}" >

          </div>
 	  <div class="form-group">
	    <label>현재 비밀번호</label>
	    <input type="password" name="verifyPassword" class="form-control"
	           required autocomplete="current-password" placeholder="현재 비밀번호 입력" />
	  </div>

      <div class="btn-area">
        <button type="submit" class="btn btn-primary px-4">정보 수정</button>
      </div>
    </form>
  </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
</body>
</html>
