<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER JOIN" />
<%@ include file="../common/head.jspf"%>
<hr />
<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
				<div class="table-box-type-1">
						<form action="../member/doJoin" method="POST">
								<table>
										<colgroup>
												<col width="200" />
										</colgroup>
<title>회원가입</title>

</head>
<body>

    <h1>회원가입</h1>
    
    <form method="post" action="doJoin"
		onsubmit="LoginForm__submit(this); return false;">
		<div class="join">
			로그인 아이디 : <input autocomplete="off" type="text" placeholder="아이디를 입력해주세요"
				name="loginId" />
		</div>
		<div class="join">
			로그인 비밀번호 : <input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요"
				name="loginPw" />
		</div>
				<div class="join">
			로그인 비밀번호 확인 : <input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요"
				name="loginPwConFirm" />
		</div>
				<div class="join">
			이름 : <input autocomplete="off" type="text" placeholder="이름을 입력해주세요"
				name="name" />
		</div>
				<div class="join">
			닉네임 : <input autocomplete="off" type="text" placeholder="닉네임을 입력해주세요"
				name="nickname" />
		</div>
				<div class="join">
			전화번호 : <input autocomplete="off" type="text" placeholder="전화번호를 입력해주세요"
				name="cellphoneNum" />
		</div>
				<div class="join">
			이메일 주소 : <input autocomplete="off" type="text" placeholder="이메일 주소를 입력해주세요"
				name="email" />
		</div>


		<button class="button" type="submit">회원 아이디 찾기</button>
		<button class="button" type="submit">회원 비밀번호 찾기</button>
		<br>
		<button class="btn-text-link" type="button" onclick="history.back();">뒤로가기</button>
		<button class="button" type="submit">회원가입</button>

	</form>
</body>
<%@ include file="../common/foot.jspf"%>
