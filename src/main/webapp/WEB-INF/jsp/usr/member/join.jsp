<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER JOIN" />
<%@ include file="../common/head.jspf"%>

<title>회원가입</title>

</head>
<body>

    <h1>회원가입</h1>
    
    <form method="post" action="doJoin"
		onsubmit="LoginForm__submit(this); return false;">
		<div class="login">
			로그인 아이디 : <input autocomplete="off" type="text" placeholder="아이디를 입력해주세요"
				name="loginId" />
		</div>
		<div class="login">
			로그인 비밀번호 : <input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요"
				name="loginPw" />
		</div>
				<div class="login">
			로그인 비밀번호 확인 : <input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요"
				name="loginPw" />
		</div>


		<button class="button" type="submit">회원 아이디 찾기</button>
		<button class="button" type="submit">회원 비밀번호 찾기</button>

	</form>
</body>
<%@ include file="../common/foot.jspf"%>
