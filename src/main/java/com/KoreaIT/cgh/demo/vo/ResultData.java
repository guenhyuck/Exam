package com.KoreaIT.cgh.demo.vo;

import lombok.Getter;

public class ResultData<DT> {
	@Getter
	private String resultCode;
	@Getter
	private String msg;
	@Getter
	private DT data1;
	@Getter
	private String data1Name;
	@Getter
	private Object data2;
	@Getter
	private String data2Name;
	@Getter
	private Object data3;
	@Getter
	private String data3Name;
	@Getter
	private Object data4;
	@Getter
	private String data4Name;

	public static <DT> ResultData<DT> from(String resultCode, String msg) {
		return from(resultCode, msg, null, null);
	}

	public static <DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1) {
		ResultData<DT> rd = new ResultData<DT>();
		rd.resultCode = resultCode;
		rd.msg = msg;
		rd.data1Name = data1Name;
		rd.data1 = data1;

		return rd;
	}

	public boolean isSuccess() {
		return resultCode.startsWith("S-");
	}

	public boolean isFail() {
		return isSuccess() == false;
	}

	public static <DT> ResultData<DT> newData(ResultData rd, String data1Name, DT newData) {
		return from(rd.getResultCode(), rd.getMsg(), data1Name, newData);
	}

	public void setData2(String data2Name,Object data2) {
		this.data2Name = data2Name;
		this.data2 = data2;
		
		
	}
   //추천
	public void setData3(String data3Name, Object data3) {
		this.data3Name = data3Name;
		this.data3 = data3;
	
		
	}
   //비추
	public void setData4(String data4Name, Object data4) {
		this.data4Name = data4Name;
		this.data4 = data4;
	}
}