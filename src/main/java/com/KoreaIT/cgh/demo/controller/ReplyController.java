package com.KoreaIT.cgh.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.cgh.demo.service.ArticleService;
import com.KoreaIT.cgh.demo.service.ReactionPointService;
import com.KoreaIT.cgh.demo.service.ReplyService;
import com.KoreaIT.cgh.demo.util.Ut;
import com.KoreaIT.cgh.demo.vo.Article;
import com.KoreaIT.cgh.demo.vo.Reply;
import com.KoreaIT.cgh.demo.vo.ResultData;
import com.KoreaIT.cgh.demo.vo.Rq;

@Controller
@RequestMapping()
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	@Autowired
	private ArticleService articleService;

	@Autowired
	private Rq rq;
	@Autowired
	private ReactionPointService reactionPointService;

	@RequestMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(String relTypeCode, int relId, String body, String replaceUri) {

		if (Ut.empty(relTypeCode)) {
			return rq.jsHistoryBack("F-1", "relTypeCode 을(를) 입력해주세요");
		}
		if (Ut.empty(relId)) {
			return rq.jsHistoryBack("F-2", "relId 을(를) 입력해주세요");
		}
		if (Ut.empty(body)) {
			return rq.jsHistoryBack("F-3", "body 을(를) 입력해주세요");
		}

		ResultData<Integer> writeReplyRd = replyService.writeReply(rq.getLoginedMemberId(), relTypeCode, relId, body);

		int id = (int) writeReplyRd.getData1();

		if (Ut.empty(replaceUri)) {
			replaceUri = Ut.f("../article/detail?id=%d", relId);
		}

		return rq.jsReplace(writeReplyRd.getMsg(), replaceUri);
	}

	@RequestMapping("/usr/reply/modify")
	public String showModify(Model model, int id) {
		Reply reply = replyService.getForPrintReplise(rq.getLoginedMemberId(), id);
		if (reply == null) {
			return rq.jsHistoryBackOnView(Ut.f("%d번 댓글은 존재하지 않습니다!", id));
		}
		ResultData actorCanModifyRd = replyService.actorCanModify(rq.getLoginedMemberId(), reply);
		if (actorCanModifyRd.isFail()) {
			return rq.jsHistoryBackOnView(actorCanModifyRd.getMsg());
		}
		
		Article article = articleService.getArticle(reply.getRelId());
		
		model.addAttribute("reply", reply);
		model.addAttribute("article", article);
		return "usr/reply/modify";
	}

	@RequestMapping("/usr/reply/doModify")
	@ResponseBody
	public String doModify(int id, String body) {
		Reply reply = replyService.getReply(id);
		if (reply == null) {
			return rq.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다@", id));
		}
		ResultData actorCanModifyRd = replyService.actorCanModify(rq.getLoginedMemberId(), reply);
		if (actorCanModifyRd.isFail()) {
			return rq.jsHistoryBack(actorCanModifyRd.getResultCode(), actorCanModifyRd.getMsg());
		}
		replyService.modifyReply(id, body);
		return rq.jsReplace(Ut.f("%d번 댓글을 수정 했습니다", id), Ut.f("../article/detail?id=%d", reply.getRelId()));
	}

	@RequestMapping("/usr/reply/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		Reply reply = replyService.getReply(id);
		if (reply == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
		}
		if (reply.getMemberId() != rq.getLoginedMemberId()) {
			return Ut.jsHistoryBack("F-2", Ut.f("%d번 댓글에 대한 권한이 없습니다", id));
		}
		replyService.deleteReply(id);
		return Ut.jsReplace(Ut.f("%d번 댓글을 삭제 했습니다", id), Ut.f("../article/detail?id=%d", reply.getRelId()));

	}

}
