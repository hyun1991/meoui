package com.jeju.meoui.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class TravlescheduleDAO {
	@Autowired
	private SqlSessionTemplate template;
	//	일정추가하기
	public void insertTravle(Travleschedule travleschedule){
		template.insert("TravlescheduleMapper.insertTravle", travleschedule);
	}
/*
 * 	<!-- 1. 일정추가하기 -->
	<insert id="insertTravle" parameterType="Travleschedule">
		<selectKey keyProperty="travlescheduleNo" resultType="int" order="BEFORE">
	    	select travleschedule_seq.nextval from dual
		</selectKey>
		<![CDATA[
			insert into travleschedule(travleschedule_no, member_no, travleschedule_date, schedule)
			values(#{travlescheduleNo}, #{memberNo}, #{travlescheduleDate}, #{schedule})
		]]>
	</insert>
	<!-- 2. 일정수정하기 -->
	<update id="updateTravle" parameterType="Travleschedule">
		<![CDATA[
			update travleschedule set schedule=#{schedule} where travleschedule_no=#{travlescheduleNo} and
			member_no=#{memberNo} and travleschedule_date=#{travlescheduleDate}
		]]>
	</update>

	<!-- 4. 일정번호별 고객번호 조회하기 -->
	<select id="selectByMemberNo" parameterType="int" resultType="int">
		select member_no from travleschedule where travleschedule_no=#{travlescheduleNo}
	</select>

	<!-- 5. 일정삭제하기 -->
	<delete id="deleteTravle" parameterType="HashMap">
		delete from travleschedule where travleschedule_no=#{travlescheduleNo} and member_no=#{memberNo}
	</delete>

	<!-- 6. 일정번호 및 고객번호별 일정정보 가져오기 -->
	<select id="findByTravle" parameterType="HashMap" resultType="Travleschedule">
		select * from travleschedule where travleschedule_no=#{travlescheduleNo} and member_no=#{memberNo}
	</select>
	<!-- 7. 고객번호별 일정전체리스트 출력하기 -->
	<select id="findAllMemberNo" parameterType="int" resultType="Travleschedule">
		select * from travleschedule where member_no=#{memberNo}
	</select>

 * */
}
