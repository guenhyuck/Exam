package com.KoreaIT.cgh.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.cgh.demo.repository.ArticleRepository;
import com.KoreaIT.cgh.demo.repository.BoardRepository;
import com.KoreaIT.cgh.demo.vo.Board;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;

	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	public Board getBoardById(int boardId) {
		return boardRepository.getBoardById(boardId);
	}

}