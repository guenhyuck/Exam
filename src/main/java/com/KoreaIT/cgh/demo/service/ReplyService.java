package com.KoreaIT.cgh.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.cgh.demo.repository.ReplyRepository;
import com.KoreaIT.cgh.demo.util.Ut;
import com.KoreaIT.cgh.demo.vo.Reply;
import com.KoreaIT.cgh.demo.vo.ResultData;

@Service
public class ReplyService {
	@Autowired
	private ReplyRepository replyRepository;
	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	public ResultData<Integer> writeReply(int actorId, String relTypeCode, int relId, String body) {
		replyRepository.writeReply(actorId, relTypeCode, relId, body);

		int id = replyRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 댓글이 생성되었습니다", id), "id", id);
	}
	
//	
//	public void deleteReply(int id) {
//		replyRepository.deleteReply(id);
//	}
//	public ResultData modifyReply(int id, String title, String body) {
//		replyRepository.modifyReply(id, title, body);
//		Reply reply = getReply(id);
//		return ResultData.from("S-1", Ut.f("%d번 댓글을 수정 했습니다", id), "reply", reply);
//	}
	public List<Reply> replys() {
		return replyRepository.getReplys();
	}
	public Reply getReply(int id) {
		return replyRepository.getReply(id);
	}
	
	
	
	public List<Reply> getForPrintReplies(int actorId,String relTypeCode, int relId) {
		return replyRepository.getForPrintReplies(actorId,relTypeCode,relId);
	
	}

	// 댓글 권한
	
	
	
//	private void controlForPrintData(int actorId, Reply reply) {
//		if (reply == null) {
//			return;
//		}
//		ResultData actorCanDeleteRd = actorCanDelete(actorId, reply);
//		reply.setActorCanDelete(actorCanDeleteRd.isSuccess());
//		ResultData actorCanModifyRd = actorCanModify(actorId, reply);
//		reply.setActorCanModify(actorCanModifyRd.isSuccess());
//	}
//	public ResultData actorCanModify(int loginedMemberId, Reply reply) {
//		if (reply.getMemberId() != loginedMemberId) {
//			return ResultData.from("F-2", Ut.f("해당 글에 대한 권한이 없습니다"));
//		}
//		return ResultData.from("S-1", "수정 가능");
//	}
//	private ResultData actorCanDelete(int actorId, Article article) {
//		if (reply == null) {
//			return ResultData.from("F-1", "게시물이 존재하지 않습니다");
//		}
//		if (reply.getMemberId() != actorId) {
//			return ResultData.from("F-2", "해당 게시물에 대한 권한이 없습니다");
//		}
//		return ResultData.from("S-1", "삭제 가능");
//	}
	
	
	//좋아요

//	public ResultData increaseGoodReationPoint(int relId) {
//		int affectedRow = articleRepository.increaseGoodReationPoint(relId);
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "해당 게시물은 없습니다", "affectedRow", affectedRow);
//		}
//		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
//	}
//	public ResultData increaseBadReationPoint(int relId) {
//		int affectedRow = articleRepository.increaseBadReationPoint(relId);
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "해당 게시물은 없습니다", "affectedRow", affectedRow);
//		}
//		return ResultData.from("S-1", "싫어요 증가", "affectedRow", affectedRow);
//	}
//
//	public ResultData decreaseGoodReationPoint(int relId) {
//		int affectedRow = articleRepository.decreaseGoodReationPoint(relId);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "해당 게시물은 없습니다", "affectedRow", affectedRow);
//		}
//		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
//	}
//
//	public ResultData decreaseBadReationPoint(int relId) {
//		int affectedRow = articleRepository.decreaseBadReationPoint(relId);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "해당 게시물은 없습니다", "affectedRow", affectedRow);
//		}
//		return ResultData.from("S-1", "싫어요 감소", "affectedRow", affectedRow);
//
//	}

}