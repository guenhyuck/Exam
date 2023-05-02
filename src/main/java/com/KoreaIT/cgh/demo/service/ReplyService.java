package com.KoreaIT.cgh.demo.service;

import java.util.List;

import com.KoreaIT.cgh.demo.vo.Reply;

public interface ReplyService {
	// 댓글 조회
	public List<Reply> list(int bno) throws Exception;

	// 댓글 조회
	public void write(Reply vo) throws Exception;

	// 댓글 수정
	public void modify(Reply vo) throws Exception;

	// 댓글 삭제
	public void delete(Reply vo) throws Exception;

}
