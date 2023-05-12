<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.code}" />
<%@ include file="../common/head.jspf"%>
<hr />
<script>
var backgroundImage = document.querySelector('.background-image');
var currentURL = window.location.href;

// URL에 따라 다른 이미지 설정
if (currentURL.includes('boardId=1')) {
  backgroundImage.style.backgroundImage = "url('https://images.pexels.com/photos/16253138/pexels-photo-16253138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')";
} else if (currentURL.includes('boardId=2')) {
  backgroundImage.style.backgroundImage = "url('https://images.pexels.com/photos/14127976/pexels-photo-14127976.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')";
} else if (currentURL.includes('boardId=3')) {
  backgroundImage.style.backgroundImage = "url('https://images.pexels.com/photos/14127734/pexels-photo-14127734.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')";
} else {
  // 기본 이미지 설정
  backgroundImage.style.backgroundImage = "url('기본 이미지의 경로')";
}
</script>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<div class="flex mb-4">
				<div>
					게시물 갯수 :
					<span class="badge">${articlesCount }</span>
					개
				</div>
				<div class="flex-grow"></div>
				<form action="">
					<input type="hidden" name="boardId" value="${param.boardId }" />
					<select data-value="${param.searchKeywordTypeCode }" name="searchKeywordTypeCode" class="select select-ghost">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목 + 내용</option>
					</select>
					<input value="${param.searchKeyword }" maxlength="20" name="searchKeyword" class="input input-bordered" type="text"
						placeholder="검색어를 입력해주세요" />
					<button class="btn btn-ghost" type=submit>검색</button>
				</form>
			</div>
			<table class="table table-zebra w-full">
				<colgroup>
					<col width="70" />
					<col width="140" />
					<col width="140" />
					<col width="140" />
					<col width="140" />
					<col width="140" />
					<col width="140" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>날짜</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>싫어요</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr class="hover">
							<td>
								<div class="badge">${article.id}</div>
							</td>
							<td>${article.regDate.substring(2,16)}</td>
							<td>
								<a class="hover:underline" href="${rq.getArticleDetailUriFromArticleList(article) }">${article.title}</a>
							</td>
							<td>${article.extra__writer}</td>
							<td>${article.hitCount}</td>
							<td>${article.goodReactionPoint}</td>
							<td>${article.badReactionPoint}</td>
						
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="pagination flex justify-center mt-3">
			<div class="btn-group">
				<c:set var="paginationLen" value="4" />
				<c:set var="startPage" value="${page - paginationLen >= 1 ? page - paginationLen : 1}" />
				<c:set var="endPage" value="${page + paginationLen <= pagesCount ? page + paginationLen : pagesCount}" />
				<c:set var="baseUri" value="?boardId=${boardId }" />
				<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
				<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />
				<c:if test="${startPage > 1 }">
					<a class="btn" href="${baseUri }&page=1">1</a>
					<button class="btn btn-disabled">...</button>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="i">
					<a class="btn ${page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i}">${i }</a>
				</c:forEach>
				<c:if test="${endPage < pagesCount }">
					<button class="btn btn-disabled">...</button>
					<a class="btn" href="${baseUri }&page=${pagesCount}">${pagesCount }</a>
				</c:if>
			</div>
		</div>
	</div>
	 <div class="background-image"></div>
</section>

<style>
/* 백그라운드 이미지 */
.background-images {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: -1;
  
}

.background-image {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-repeat: no-repeat;
      background-position: center center;
      background-size: cover;
      transition: opacity 0.5s ease-in-out;
      z-index: -1;
    }


@keyframes fade-in-out {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>
<%@ include file="../common/foot.jspf"%>