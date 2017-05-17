package com.jeju.meoui.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class AccommodationDAO {
	@Autowired
	private SqlSessionTemplate template;
	//	숙박시설 추가하기
	public void insertAccommodation(Accommodation accommodation){
		template.insert("AccommodationMapper.insertAccommodation", accommodation);
	}
	//	숙박시설 수정하기
	public void updateAccommodation(Accommodation accommodation){
		template.update("AccommodationMapper.updateAccommodation", accommodation);
	}
	//	숙박시설 삭제하
	public void deleteAccommodation(int accommodationNo){
		template.delete("AccommodationMapper.deleteAccommodation", accommodationNo);
	}
	//	
/*
	<!-- 시설명별 시설번호 조회하기 -->
	<select id="selectByAccommodationNo" parameterType="String" resultType="int">
		<![CDATA[
			select accommodation_no from accommodation where accommodation_name=#{accommodationName}
		]]>
	</select>
	<!-- 시설번호별 관광명소번호 조회하기 -->
	<select id="selectBySiteNo" parameterType="int" resultType="int">
		<![CDATA[
			select site_no from accommodation where accommodation_no=#{accommodationNo}
		]]>
	</select>
	<!-- 시설번호별 업주번호 조회하기 -->
	<select id="selectByOwnerNo" parameterType="int" resultType="int">
		<![CDATA[
			select owner_no from accommodation where accommodation_no=#{accommodationNo}
		]]>
	</select>
	<!-- 숙박시설 페이지별 조회하기 -->
	<select id="selectAllAccommodation" parameterType="HashMap" resultType="Accommodation">
		<![CDATA[
			select t2.* from(select rownum rnum, t1.* from
			(select accommodation_no, accommodation_name, accommodation_address, accommodation_img, 
			accommodation_phone, accommodation_directions, site_no, owner_no 
			from accommodation order by accommodation_no desc)t1)t2 where rnum between #{startRow} and #{lastRow};
		]]>
	</select>
	<!-- 숙박시설 번호별 조회 -->
	<select id="findByAccommodation" parameterType="int" resultType="Accommodation">
		<![CDATA[
			select*from accommodation where accommodation_no=#{accommodationNo}
		]]>
	</select>
	<!-- 숙박시설DB개수 조회하기 -->
	<select id="findByAccommodationMax" resultType="int">
		<![CDATA[
			select count(accommodation_no)from accommodation
		]]>
	</select>
	<!-- 숙박명별 조회하기 -->
	<select id="selectByAccommodation" parameterType="String" resultType="Accommodation">
		<![CDATA[
			select * from accommodation where accommodation_name=#{accommodationName}
		]]>
	</select>
 * */
}
