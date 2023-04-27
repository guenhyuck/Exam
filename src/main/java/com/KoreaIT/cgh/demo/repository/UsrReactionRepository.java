package com.KoreaIT.cgh.demo.repository;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UsrReactionRepository {
	@Select("""
			<script>
				SELECT `point`
				FROM reactionPoint
				WHERE id = #{id}
			</script>
			""")
	
	public int getusrReactionPoint(int id);
	
	
	@Update("""
			<script>
				UPDATE reactionPoint
				SET `point` = `point` + 1
				WHERE id = #{id}
			</script>
			""")
	
	
	public int increaseReactionPoint(int id);
	
	@Update("""
			<script>
				UPDATE reactionPoint
				SET `point` = `point` - 1
				WHERE id = #{id}
			</script>
			""")

	public int decreaseReactionPoint(int id);
}