<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER MODIFY" />
<%@ include file="../common/head.jspf"%>
<hr />


<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
		
				<input type="hidden" name="id" value="${member.id }" />
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>

					<tbody>
						<tr>
							<th>회원 번호</th>
							<td>
								<div class="badge">${member.id}</div>
							</td>
						</tr>
						<tr>
							<th>가입날짜</th>
							<td>${member.regDate }</td>
						</tr>
						<tr>
							<th>회원이름</th>
							<td>${member.name}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input class="input input-bordered w-full max-w-xs" type="text" name="title" placeholder="제목을 입력해주세요"
									value="${article.title }" />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea class="input input-bordered w-full max-w-xs" type="text" name="body" placeholder="내용을 입력해주세요" />${article.body }</textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
						<a class="btn-text-link btn btn-active btn-ghost" href="../member/modify?id=${member.id }">수정</a>
							</td>
						</tr>
					</tbody>

				</table>
		</div>
		<div class="btns">
			<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>