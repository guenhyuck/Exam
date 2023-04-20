package com.KoreaIT.cgh.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {

	@Insert("""
			INSERTO INTO `member`
			set regDate = NOW(),
			updateDate = NOW(),
			loginId = #{loginID},
			loginPw = #{loginPw},
			`name` = #{name},
			nickname = #{nickname},
			cellphoneNum = #{cellphoneNum},
			email = #{email}
			""")
	void join(String loginId,String loginPw,  String name,String nickname,String cellphonenum,String email);

}