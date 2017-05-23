package com.jeju.meoui.service;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class ReserveService {
	@Autowired
	private ReserveDAO dao;
	@Autowired
	private ReserveDetailsDAO detailsDao;
	private Logger logger= LoggerFactory.getLogger(ReserveService.class);
	
	//	예약, 예약상세 추가하기
	public void createReserve(Reserve reserve, ReserveDetails details){
		dao.insertReserve(reserve);
		details.setReserveNo(dao.selectByMaxReserveNo());
		detailsDao.insertReserveDetails(details);
	}
/*
 * //	예약추가하기
	public void insertReserve(Reserve reserve){
		template.insert("ReserveMapper.insertReserve", reserve);
	}
	//	예약수정하기
	public void updateReserve(Reserve reserve){
		template.update("ReserveMapper.updateReserve", reserve);
	}
	//	예약취소하기
	public void deleteReserve(int reserveNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("reserveNo", reserveNo);
		map.put("memberNo", memberNo);
		template.delete("ReserveMapper.deleteReserve", map);
	}
	//	업주번호별 예약리스트 조회하기
	public List<Reserve>selectAllByOwnerNo(int ownerNo){
		return template.selectList("ReserveMapper.selectAllByOwnerNo", ownerNo);
	}
	//	회원번호별 예약리스트 조회하기
	public List<Reserve>selectAllByMemberNo(int memberNo){
		return template.selectList("ReserveMapper.selectAllByMemberNo", memberNo);
	}
	//	예약번호별 업주번호 조회하기
	public int electByOwner(int reserveNo){
		return template.selectOne("ReserveMapper.electByOwner", reserveNo);
	}
	//	회원번호별 에약번호 조회하기
	public int selectByReserveNo(int memberNo){
		return template.selectOne("ReserveMapper.selectByReserveNo", memberNo);
	}
	=========================================================================
	//	예약상세 추가하기
	public void insertReserveDetails(ReserveDetails details){
		template.insert("ReserveDetailsMapper.insertReserveDetails", details);
	}
	//	예약상세 삭제하기
	public void deleteReserveDetails(int accommodationNo, int roomNo, int reserveNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("accommodationNo", accommodationNo);
		map.put("roomNo", roomNo);
		map.put("reserveNo", reserveNo);
		template.delete("ReserveDetailsMapper.deleteReserveDetails", map);
	}
	//	객실종류번호별 예약상세 조회하기
	public List<ReserveDetails> selectAllByRoomNo(int roomNo){
		return template.selectList("ReserveDetailsMapper.selectAllByRoomNo", roomNo);
	}
	=====================================================================
 * // TODO Auto-generated method stub
		Connection conn= JDBCUtil.getConnection();
		SimpleDateFormat sdf= new SimpleDateFormat("YYYY-MM-DD");
		java.util.Date date= null;
		HttpSession session= request.getSession();
		String basicInfoUsername= session.getAttribute("basicInfoUsername")+"";
		try {
			System.out.println(session.getAttribute("wineInfoId"));
			date= sdf.parse(request.getParameter("wineOrderDate"));
			int wineOrderInfoCount= Integer.parseInt(request.getParameter("wineOrderInfoCount"));
			int wineOrderAmount= ((int)session.getAttribute("wineInfoPrice"))*wineOrderInfoCount;
			int customerId= new BasicInfoDAOImpl().selectByUsernameOfCustomerId(conn, basicInfoUsername);
			int wineSellerId= (int)session.getAttribute("wineSellerId");
			Date getDate= new Date(date.getTime());
			int wineOrderResult= dao.wineOrderInsert(conn, new WineOrder(getDate, wineOrderAmount, customerId, wineSellerId));
			//	와인상세를 위한 추가
			int wineOrderId= dao.selectWineOrderIdMax(conn);
			System.out.println("오더아이디"+wineOrderId);
			int wineInfoId= (int)session.getAttribute("wineInfoId");
			int wineOrderInfoResult= new WineOrderInfoDAOImpl().wineOrderInfoInsert(conn, wineOrderInfoCount, wineOrderId, wineInfoId);
 * */
}
