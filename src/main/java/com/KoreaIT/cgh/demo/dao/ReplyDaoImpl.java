package com.KoreaIT.cgh.demo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.KoreaIT.cgh.demo.vo.Reply;

public class ReplyDaoImpl implements ReplyDao {
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.reply";

	// 댓글 조회
	@Override
	public List<Reply> list(int bno) throws Exception {
	    return sql.selectList(namespace + ".replyList", bno);
	}

	// 댓글 작성
	@Override
	public void write(Reply vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(Reply vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(Reply vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}

}
