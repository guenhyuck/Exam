package com.KoreaIT.cgh.demo.controller;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.cgh.demo.service.ArticleService;
import com.KoreaIT.cgh.demo.service.BoardService;
import com.KoreaIT.cgh.demo.service.ReplyService;
import com.KoreaIT.cgh.demo.util.Ut;
import com.KoreaIT.cgh.demo.vo.Reply;
import com.KoreaIT.cgh.demo.vo.ResultData;
import com.KoreaIT.cgh.demo.vo.Rq;

@Controller
@RequestMapping()
public class ReplyController {
	@Inject
	private BoardService boardService;
	@Inject
	private ArticleService articleService;
	@Inject
	private Rq rq;

	@Inject
	private ReplyService replyService;

	// 댓글 작성
	@RequestMapping("/usr/reply/write")
	public String showRepWrite(String title, String body) {
		return "usr/reply/write";
	}
	
	@RequestMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doRepWrite(int boardId, String title, String body, String replaceUri) {
		if (Ut.empty(title)) {
			return rq.jsHitoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.empty(body)) {
			return rq.jsHitoryBack("F-2", "내용을 입력해주세요");
		}
		ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), boardId, title, body);
		int id = (int) writeArticleRd.getData1();
		if (Ut.empty(replaceUri)) {
			replaceUri = Ut.f("../article/detail?id=%d", id);
		}
		return rq.jsReplace(Ut.f("%d번 댓글이 생성되었습니다", id), replaceUri);
	}

}
