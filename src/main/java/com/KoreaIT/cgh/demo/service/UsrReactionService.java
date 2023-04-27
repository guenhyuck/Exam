package com.KoreaIT.cgh.demo.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.cgh.demo.repository.UsrReactionRepository;
import com.KoreaIT.cgh.demo.vo.ResultData;

@Service
public class UsrReactionService {

	@Autowired
	private UsrReactionRepository usrReactionRepository;

	public UsrReactionService(UsrReactionRepository usrReactionRepository) {
		this.usrReactionRepository = usrReactionRepository;
	}

	public ResultData increaseReactionCount(int id) {
		int affectedRow = usrReactionRepository.increaseReactionPoint(id);
		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물은 없음", "affectedRow", affectedRow);
		}

		if (affectedRow == 1) {
			return ResultData.from("S-1", "추천", "affectedRow", affectedRow);
		}

		return ResultData.from("S-1", "추천 증가", "affectedRowRd", affectedRow);
	}
	
	public ResultData decreaseReactionCount(int id) {
		int affectedRow = usrReactionRepository.decreaseReactionPoint(id);
		
		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물은 없음", "affectedRow", affectedRow);
		}

		if (affectedRow == -1) {
			return ResultData.from("S-2", "비추", "affectedRow", affectedRow);
		}

		return ResultData.from("S-2", "비추 증가", "affectedRowRd", affectedRow);
	}

	public Object getReactionCount(int id) {
		return usrReactionRepository.getusrReactionPoint(id);
	}
}