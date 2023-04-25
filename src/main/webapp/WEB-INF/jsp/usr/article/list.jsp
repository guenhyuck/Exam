<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<c:set var="pageTitle" value="${board.code}" />
<%@ include file="../common/head.jspf"%>

<hr />
<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
				<div class="table-box-type-1">
						<div>${articlesCount }개</div>
						<table class="table table-zebra w-full">
								<colgroup>
										<col width="70" />
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
										</tr>
								</thead>
								<tbody>
										<c:forEach var="article" items="${articles }" varStatus="status">
												<c:if test="${status.index >= (currentPage - 1) * pageSize && status.index < currentPage * pageSize}">
														<tr class="hover">
																<td>
																		<div class="badge">${article.id}</div>
																</td>
																<td>${article.regDate.substring(2,16)}</td>
																<td>
																		<a class="hover:underline" href="../article/detail?id=${article.id}">${article.title}</a>
																</td>
																<td>${article.extra__writer}</td>
														</tr>
												</c:if>
										</c:forEach>
								</tbody>
						</table>
						<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
										<ul class="pagination">
												<!-- Previous 시작 -->
												<li class="paginate_button page-item previous <c:if test='${list.startPage<6 }'>disabled</c:if>"
														id="dataTable_previous">
														<a href="/lprod/list?currentPage=${list.startPage-5 }" aria-controls="dataTable" data-dt-idx="0"
																tabindex="0" class="page-link">Previous</a>
												</li>
												<!-- Previous 끝 -->
												<!-- Page번호 시작 -->
												<c:forEach var="pNo" begin="${list.startPage }" end="${list.endPage }" step="1">
														<li class="paginate_button page-item  <c:if test='${param.currentPage eq pNo }'>active</c:if>">
																<a href="/lprod/list?currentPage=${pNo }" aria-controls="dataTable" data-dt-idx="1" tabindex="0"
																		class="page-link">${pNo }</a>
														</li>
												</c:forEach>
												<!-- Page번호 끝 -->
												<!-- Next 시작 -->
												<li class="paginate_button page-item next <c:if test='${list.endPage>=list.totalPages }'>disabled</c:if>"
														id="dataTable_next">
														<a href="/lprod/list?currentPage=${list.startPage+5 }" aria-controls="dataTable" data-dt-idx="7"
																tabindex="0" class="page-link">Next</a>
												</li>
												<!-- Next 끝 -->
										</ul>
								</div>
						</div>
				</div>
		</div>
</section>
<%@ include file="../common/foot.jspf"%>