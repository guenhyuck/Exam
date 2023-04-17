package com.KoreaIT.cgh.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private int id;
	private String loginId;
	private String loginPw;
	private String authLeverl;
	private String name;
	private String nickname;
	private String cellphonenum;
	private String email;
	private String delStatus;
	private String delDate;
	

}
