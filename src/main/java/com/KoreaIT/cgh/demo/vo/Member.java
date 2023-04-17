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
	private String name;
	private int age;
	private String nickname;
	private String cellphonenum;
	private String email;
	private String address;

}
