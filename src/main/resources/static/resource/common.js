$(".search_area button").on("click", function(e){
		
		var type = $(".search_area select").val();
		var keyword = $(".search_area input[name='keyword']").val();
		
		var sKey = '<c:out value="${pageMaker.cri.keyword}"/>';
		// Criteria 필드 멤버의 검색어.
		
		console.log("이전 검색어: " + sKey);
		console.log("현재 검색어: " + keyword);
		
		if(!type){
			alert("키워드를 입력하세요");
			return false;
		}
		
		if(!keyword){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		if(sKey != keyword){
			actionForm.find("input[name='pageNum']").val(1);
			// 새로운 검색어라면 1페이지로 이동.
		}
		
		
		actionForm.find("input[name='type']").val(type);
		actionForm.find("input[name='keyword']").val(keyword);
		// 1페이지로 이동하는 구문
		/* actionForm.find("input[name='pageNum']").val(1); */
		actionForm.submit();
	});