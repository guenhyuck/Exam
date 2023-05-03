<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPLY MODIFY" />
<%@ include file="../common/head.jspf"%>
<hr />

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<form action="../reply/doModify" method="POST">
				<input type="hidden" name="id" value="${reply.id }" />
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>

					<tbody>
					<tr>
							<th>작성날짜</th>
							<td>${reply.regDate }</td>
						</tr>
						<tr>
							<th>수정날짜</th>
							<td>${reply.updateDate }</td>
						</tr>
						<tr>
							<th>번호</th>
							<td>
								<div class="badge">${reply.id}</div>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${reply.extra__writer }</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea class="input input-bordered w-full max-w-xs" type="text" name="body" placeholder="내용을 입력해주세요" />${reply.body }</textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<button type="submit" value="수정" />
								수정
								</button>
							</td>
						</tr>
					</tbody>

				</table>
			</form>
		</div>
		<div class="btns">
			<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>

			<c:if test="${reply.actorCanModify }">
				<a class="btn-text-link btn btn-active btn-ghost" href="../reply/modify?id=${reply.id }">수정</a>
			</c:if>
			<c:if test="${reply.actorCanDelete }">
				<a class="btn-text-link btn btn-active btn-ghost" onclick="if(confirm('정말 삭제하시겠습니까?')==false) return false;"
					href="../reply/doDelete?id=${reply.id }">삭제</a>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>