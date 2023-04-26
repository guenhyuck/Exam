$(".search_area button").on("click", function(e){
		
		var type = $(".search_area select").val();
		var searchKerword = $(".search_area input[name='searchKerword']").val();
		
		var sKey = '<c:out value="${article.id}"/>';
		// Criteria 필드 멤버의 검색어.
		
		console.log("이전 검색어: " + searchKerwordTypeCode);
		console.log("현재 검색어: " + searchKerword);
		
		if(!type){
			alert("키워드를 입력하세요");
			return false;
		}
		
		if(!searchKerword){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		if(searchKerwordTypeCode != searchKerword){
			actionForm.find("input[name='page']").val(1);
			// 새로운 검색어라면 1페이지로 이동.
		}
		
		
		actionForm.find("input[name='type']").val(type);
		actionForm.find("input[name='searchKerword']").val(searchKerword);
		// 1페이지로 이동하는 구문
		/* actionForm.find("input[name='pageNum']").val(1); */
		actionForm.submit();
	});