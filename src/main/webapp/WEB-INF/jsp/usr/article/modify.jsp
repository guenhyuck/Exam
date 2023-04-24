<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE MODIFY" />
<%@ include file="../common/head.jspf"%>

<title>수정 페이지</title>

</head>
<body>

    <h1>게시글 수정</h1>
    <form method="post" action="doModify"
		onsubmit="ModifyForm__submit(this); return false;">

		<div class="modify">
			글 번호 : <td>${article.id}</td>
		</div>
		<div class="modify">
			새 제목 : <input autocomplete="off" type="text" placeholder="새 제목을 입력해주세요"
				name="newtitle" />
		</div>
				<div class="modify">
			새 내용 : <input autocomplete="off" type="text" placeholder="새 내용을 입력해주세요"
				name="newbody" />
		</div>
    

		<div class="btns">
			<button class="btn-text-link" type="button" onclick="history.back();">뒤로가기</button>
           <c:if test="${article.actorCanModify }">
			<a class="btn-text-link" href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.actorCanDelete }">
				<a class="btn-text-link" onclick="if(confirm('정말 삭제하시겠습니까?')==false) return false;"
					href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>
		</div>

	</form>
</body>
<%@ include file="../common/foot.jspf"%>
