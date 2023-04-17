package com.KoreaIT.cgh.demo.service;

import org.springframework.stereotype.Service;

import com.KoreaIT.cgh.demo.repository.MemberRepository;
import com.KoreaIT.cgh.demo.vo.Member;

@Service
public class MemberService {
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	// 서비스 메서드
	public int Join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return -1;
		}

		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		return memberRepository.getLastInsertId();
	}

	private Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

}