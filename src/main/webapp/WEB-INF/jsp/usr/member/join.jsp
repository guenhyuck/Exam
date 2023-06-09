<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원가입" />
<%@ include file="../common/head.jspf"%>

<!-- lodash debounce -->
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

<script>
	let submitJoinFormDone = false;
	let validLoginId = "";
	function submitJoinForm(form) {
		if (submitJoinFormDone) {
			alert('처리중입니다');
			return;
		}
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value == 0) {
			alert('아이디를 입력해주세요');
			return;
		}
		if (form.loginId.value != validLoginId) {
			alert('사용 불가능한 아이디!');
			form.loginId.focus();
			return;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value == 0) {
			alert('비밀번호를 입력해주세요');

			return;
		}
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		if (form.loginPwConfirm.value == 0) {
			alert('비밀번호 확인을 입력해주세요');
			return;
		}
		if (form.loginPwConfirm.value != form.loginPw.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.loginPw.focus();
			return;
		}
		form.name.value = form.name.value.trim();
		if (form.name.value == 0) {
			alert('이름을 입력해주세요');
			return;
		}
		form.nickname.value = form.nickname.value.trim();
		if (form.nickname.value == 0) {
			alert('닉네임을 입력해주세요');
			return;
		}
		form.email.value = form.email.value.trim();
		if (form.email.value == 0) {
			alert('이메일을 입력해주세요');
			return;
		}
		form.cellphoneNum.value = form.cellphoneNum.value.trim();
		if (form.cellphoneNum.value == 0) {
			alert('전화번호를 입력해주세요');
			return;
		}
		submitJoinFormDone = true;
		form.submit();
	}
	
	
	
	const checkLoginIdDupDebounced = _.debounce(checkLoginIdDup, 1000);
	
	function checkLoginIdDup(el) {
		$('.checkDup-msg').empty();
		const form = $(el).closest('form').get(0);
		if(validLoginId == form.loginId.value){
			return;
		}
		if (form.loginId.value.length < 4) { 
			 $('.login-id-error-msg').text('로그인 ID는 4글자 이상 입력해야 합니다.');
		} else {
			$('.login-id-error-msg').empty();
			$.get('../member/getLoginIdDup', {
				isAjax : 'Y',
				loginId : form.loginId.value
			}, function(data) {
				$('.checkDup-msg').html('<div class="mt-2">' + data.msg + '</div>')
				if (data.success) {
					validLoginId = data.data1;
				} else {
					validLoginId = '';
				}
			}, 'json');
			

			
		}
	}
	
	const checkEmailDupDebounced = _.debounce(checkEmailDup, 1000);

	function checkEmailDup(el) {
	    $('.checkEDup-msg').empty();
	    const form = $(el).closest('form').get(0);
	    if (validEmail === form.email.value) {
	        return;
	    }
	    if (form.email.value.length < 8) {
	        $('.email-error-msg').text('이메일은 8글자 이상 입력해야 합니다.');
	    } else {
	        $('.email-error-msg').empty();
	        $.get('../member/getEmailDup', {
	            isAjax: 'Y',
	            email: form.email.value
	        }, function (data) {
	            $('.checkEDup-msg').html('<div class="mt-2">' + data.msg + '</div>');
	            if (data.success) {
	                validEmail = data.data1;
	            } else {
	                validEmail = '';
	            }
	        }, 'json');
	    }
	}

</script>

<section class="mt-8 text-xl">

	<div class="container mx-auto px-3">
		<form class="table-box-type-1" method="POST" action="../member/doJoin" onsubmit="submitJoinForm(this); return false;">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />
			<table class="table table-zebra w-full">
				<colgroup>
					<col width="200" />
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input onkeyup="checkLoginIdDupDebounced(this);" name="loginId" class="w-full input input-bordered  max-w-xs"
								placeholder="아이디를 입력해주세요"  autocomplete="off"/>
							<div class="checkDup-msg"></div>
							<div class="login-id-error-msg"></div>
						</td>
					</tr>
					<tr>

						<th>비밀번호</th>
						<td>
							<input name="loginPw" class="w-full input input-bordered  max-w-xs" placeholder="비밀번호를 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input name="loginPwConfirm" class="w-full input input-bordered  max-w-xs" placeholder="비밀번호 확인을 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input name="name" class="w-full input input-bordered  max-w-xs" placeholder="이름을 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input name="nickname" class="w-full input input-bordered  max-w-xs" placeholder="닉네임을 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input name="cellphoneNum" class="w-full input input-bordered  max-w-xs" placeholder="전화번호를 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input onkeyup="checkEmailDupDebounced(this);" name="email" 
							class="w-full input input-bordered  max-w-xs" placeholder="이메일을 입력해주세요" autocomplete="off" />
						
						 	<div class="checkEDup-msg"></div>
							<div class="email-error-msg"></div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<button class="btn btn-active btn-ghost" type="submit" value="회원가입">회원가입</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="container mx-auto btns">
		<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
	</div>
</section>
<%@ include file="../common/foot.jspf"%>