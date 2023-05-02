package com.KoreaIT.cgh.demo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.KoreaIT.cgh.demo.dao.ReplyDao;
import com.KoreaIT.cgh.demo.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDao dao;

	// 댓글 조회
	@Override
	public List<Reply> list(int bno) throws Exception {
	    return dao.list(bno);
	}

	@Override
	public void write(Reply vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(Reply vo) throws Exception {
	    dao.modify(vo);
	}

	@Override
	public void delete(Reply vo) throws Exception {
	    dao.delete(vo);
	}

}
