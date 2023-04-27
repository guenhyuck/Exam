package com.KoreaIT.cgh.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.cgh.demo.service.BoardService;
import com.KoreaIT.cgh.demo.service.UsrReactionService;
import com.KoreaIT.cgh.demo.vo.ResultData;
import com.KoreaIT.cgh.demo.vo.Rq;

@Controller
public class UsrReationController {

	@Autowired
	private UsrReactionService usrReactionService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private Rq rq;
	
	@RequestMapping("/usr/article/doIncreaseReactionCountRd")
	@ResponseBody
	public ResultData doIncreaseReactionCountRd(int id) {

		ResultData increaseReactionCountRd = usrReactionService.increaseReactionCount(id);

		if (increaseReactionCountRd.isFail()) {
			return increaseReactionCountRd;
		}

		ResultData rd = ResultData.newData(increaseReactionCountRd, "ReactionCount", usrReactionService.getReactionCount(id));

		rd.setData3("id", id);

		return rd;
	}
	@RequestMapping("/usr/article/doDecreaseReactionCountRd")
	@ResponseBody
	public ResultData doDecreaseReactionCountRd(int id) {

		ResultData decreaseReactionCountRd = usrReactionService.increaseReactionCount(id);

		if (decreaseReactionCountRd.isFail()) {
			return decreaseReactionCountRd;
		}

		ResultData rd = ResultData.newData(decreaseReactionCountRd, "ReactionCount", usrReactionService.getReactionCount(id));

		rd.setData4("id", id);

		return rd;
	}
}