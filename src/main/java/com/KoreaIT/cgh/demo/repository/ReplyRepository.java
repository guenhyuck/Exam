package com.KoreaIT.cgh.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.KoreaIT.cgh.demo.vo.Reply;

@Mapper
public interface ReplyRepository {
	
	@Insert("""
	INSERT INTO reply
	SET regDate = NOW(),
	updateDate =NOW(),
	memberId = #{memberId},
	boardId = #{boardId},
	title =#{title},
	`body`= #{body}
	""")
		


	public void writeReply(int loginedMemberId,  String body);

	@Select("""
			SELECT *
			FROM reply
			ORDER BY id DESC
				""")
	public List<Reply> getReplys();


	@Select("""
			SELECT *
			FROM reply
			WHERE id = #{id}
			""")
	public Reply getReply(int id);

	@Select("""
			<script>
			SELECT R.*, M.nickname AS extra__writer
			FROM reply AS R
			INNER JOIN `member` AS M
			ON R.memberId = M.id
			WHERE R.id = #{id}
			</script>
			""")
	public Reply getForPrintReply(int id);

	public void deleteReply(int id);

	public void modifyReply(int id, String title, String body);

	public int getLastInsertId();


	@Update("""
			<script>
				UPDATE reply
				SET goodReactionPoint = goodReactionPoint + 1
				WHERE id = #{relId}
			</script>
			""")
	public int increaseGoodReationPoint(int relId);

	@Update("""
			<script>
				UPDATE reply
				SET badReactionPoint = badReactionPoint + 1
				WHERE id = #{relId}
			</script>
			""")
	public int increaseBadReationPoint(int relId);
	

	@Update("""
			<script>
				UPDATE reply
				SET goodReactionPoint = goodReactionPoint - 1
				WHERE id = #{relId}
			</script>
			""")
	public int decreaseGoodReationPoint(int relId);

	@Update("""
			<script>
				UPDATE reply
				SET badReactionPoint = badReactionPoint - 1
				WHERE id = #{relId}
			</script>
			""")
	public int decreaseBadReationPoint(int relId);

	

}

