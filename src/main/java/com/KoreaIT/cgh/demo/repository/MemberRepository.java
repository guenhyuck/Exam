package com.KoreaIT.cgh.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.cgh.demo.vo.Member;
import com.KoreaIT.cgh.demo.vo.ResultData;

@Mapper
public interface MemberRepository {
   //회원가입
	@Insert("""
			INSERT INTO `member`
			SET regDate = NOW(),
			updateDate = NOW(),
			loginId = #{loginId},
			loginPw = #{loginPw},
			`name` = #{name},
			nickname = #{nickname},
			cellphoneNum = #{cellphoneNum},
			email = #{email}
			""")
	void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);
  //
	@Select("""
			SELECT *
			FROM `member`
			WHERE id = #{id}
			""")
	Member getMemberById(int id);

	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	int getLastInsertId();
	
	//아이디 중복체크
	
	@Select("""
		   SELECT COUNT(*) > 0;
		   FROM `member`;
		   WHERE loginId = #{loginId};
			""")


	Member getMemberByLoginId(String loginId);
	
	//이름,이메일 중복체크
	@Select("""
			   SELECT COUNT(*) > 0;
			   FROM `member`;
			   WHERE `name` = #{name}
			   AND email = #{email};
				""")

	Member getMemberByNameAndEmail(String loginId, String email);

}