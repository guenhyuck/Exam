package com.KoreaIT.cgh.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.KoreaIT.cgh.demo.vo.Reply;

@Mapper
public interface ReplyRepository {
	
	@Insert("""
			<script>
				INSERT INTO reply
				SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{actorId},
				relTypeCode = #{relTypeCode},
				relId =#{relId},
				`body`= #{body}
			</script>
			""")

	void writeReply(int actorId, String relTypeCode, int relId, String body);
	
	@Select("""
			<script>
				SELECT LAST_INSERT_ID()
			</script>
			""")
	int getLastInsertId();
	
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
	public Reply getForPrintReplise(int memberId,int id);
	
	@Select("""
			SELECT R.*, M.nickname AS extra__writer
			FROM reply AS R
			LEFT JOIN `member` AS M
			ON R.memberId = M.id
			WHERE R.relTypeCode = #{relTypeCode}
			AND R.relId = #{relId}
			ORDER BY R.id ASC
		""")
     List<Reply> getForPrintReplies(int actorId, String relTypeCode, int relId);

	@Delete("""
		DELETE FROM
		reply
		WHERE id = #{id}
			""")

			
	
	public void deleteReply(int id);
	
	@Update("""
		<script>
		UPDATE reply
		<set>
		<if test="body != null and body != ''">`body` = #{body},</if>
		updateDate= NOW()
		</set>
		WHERE id = #{id}
		</script>
			""")

	public void modifyReply(int id, String body);


//
//
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

