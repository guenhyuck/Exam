package com.KoreaIT.cgh.demo.vo;

import lombok.Getter;

public class ResultData {
	@Getter
	private String resultCode;
	@Getter
	private String msg;
	@Getter
	private Object data1;
	
	//
	public static ResultData from(String resultCode, String msg) {
		return from(resultCode,msg,null);
	}
	
	public static ResultData from(String resultCode,String msg,Object data1) {
		ResultData rd = new ResultData();
		rd.resultCode = resultCode;
		rd.msg = msg;
		rd.data1 = data1;
		
		return rd;
	}
	
	
	public boolean isSuccess() {
		return resultCode.startsWith("S-");
	}


	public boolean isFail() {
		return isSuccess() == false;
	}
	

}


//{"resultCode":"S-1","msg":"1번게시물 입니다","data1":{"id":1,"title":"제목 1","body":"내용 1"},"fail":false,"success":true}
//fail과 sucess를 명시하지 않았는데 뜨는것은 스프링 내부적으로 입력되고 있기 때문임
//똑같이 주고싶으면 boolean a 같이 해놓고 롬복 주면 isA 이렇게 뜸