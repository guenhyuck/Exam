<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style.css">
<link rel="stylesheet" href="/resources/style.css">

<script>

</script>

<div class="container">
<figure class="snip1584"><img class="img" src="https://t3.ftcdn.net/jpg/03/11/19/40/240_F_311194050_0ILCHahjCX7A8QwfptKx7yRw6fOxWgUN.jpg" alt="sample87"/>
  <figcaption>
    <h3>대전의 맛</h3>
    <h5>맛집 소개</h5>
  </figcaption><a href="/usr/article/list?boardId=1"></a>
</figure>
<figure class="snip1584"><img class="img" src="https://t4.ftcdn.net/jpg/05/77/64/59/240_F_577645920_49fs7UDyT6oKEdy9eUSXjiCM1j3vzMtj.jpg" alt="sample119"/>
  <figcaption>
    <h3>대전의 멋</h3>
    <h5>볼거리 &amp; 공원</h5>
  </figcaption><a href="/usr/article/list?boardId=2"></a>
</figure>
<figure class="snip1584"><img class="img" src="https://t3.ftcdn.net/jpg/05/88/99/00/240_F_588990090_hW8UGZ7AA2nDKYCnjk75HEIzHIw1Y3jI.jpg" alt="sample120"/>
  <figcaption>
    <h3>대전의 쉼터</h3>
    <h5>편의시설</h5>
  </figcaption><a href="/usr/article/list?boardId=3"></a>
</figure>

<figure class="snip1584"><img class="img" src="https://t3.ftcdn.net/jpg/03/11/19/40/240_F_311194050_0ILCHahjCX7A8QwfptKx7yRw6fOxWgUN.jpg" alt="sample87"/>
  <figcaption>
    <h3>메인 페이지로 가기</h3>
    <h5>클릭하세요</h5>
  </figcaption><a href="/usr/home/main"></a>
</figure>
</div>

<style>
body{
background-color: black;
}

.snip1584>.img {
  width: 200%; /* 2배로 늘리기 위해 width 속성을 200%로 설정 */
  height: auto; /* 가로 비율에 맞춰 자동으로 높이 조정 */
}
.container {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  margin-top: 25%;
}

.container figure {
  flex: 1 1 calc(33.33% - 20px);
  margin: 10px;
  text-align: center;
}

.container img {
  max-width: 100%;
}


.snip1584 {
  font-family: 'Raleway', sans-serif;
  position: relative;
  display: inline-block;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #ffffff;
  font-size: 16px;
  text-align: left;
}
.snip1584 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
}
.snip1584:before {
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
  top: 100%;
  content: '';
  background-color: rgba(51, 51, 51, 0.9);
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
  -webkit-transition-delay: 0.25s;
  transition-delay: 0.25s;
}
.snip1584 img {
  vertical-align: top;
  max-width: 100%;
  backface-visibility: hidden;
}
.snip1584 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.snip1584 h3,
.snip1584 h5 {
  margin: 0;
  opacity: 0;
  letter-spacing: 1px;
}
.snip1584 h3 {
  -webkit-transform: translateY(-100%);
  transform: translateY(-100%);
  text-transform: uppercase;
  font-weight: 400;
  -webkit-transition-delay: 0.05s;
  transition-delay: 0.05s;
  margin-bottom: 5px;
}
.snip1584 h5 {
  font-weight: normal;
  background-color: #ae895d;
  padding: 3px 10px;
  -webkit-transform: translateY(-100%);
  transform: translateY(-100%);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
.snip1584 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}


.snip1584:hover:before,
.snip1584.hover:before {
  top: 10px;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
.snip1584:hover h3,
.snip1584.hover h3,
.snip1584:hover h5,
.snip1584.hover h5 {
  -webkit-transform: translateY(0);
  transform: translateY(0);
  opacity: 1;
}
.snip1584:hover h3,
.snip1584.hover h3 {
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}
.snip1584:hover h5,
.snip1584.hover h5 {
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}

</style>