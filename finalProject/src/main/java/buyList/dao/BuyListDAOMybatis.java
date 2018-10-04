package buyList.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import buyList.bean.BuyListDTO;

@Transactional
@Component
public class BuyListDAOMybatis implements BuyListDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//배송관리
	public List<Map<String, String>> getDeliveryDetail(String serial) {
		return sqlSession.selectList("buyListSQL.getDeliveryDetail", serial);
	}

	public List<BuyListDTO> getBuyList(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.getBuyList", map);
	}

	public void changeStatus(Map<String, Object> map) {
		sqlSession.update("buyListSQL.changeStatus", map);
	}

	
	public int getDeliveryTotalA(Map<String, String> map) {
		return sqlSession.selectOne("buyListSQL.getDeliveryTotalA", map);
	}
	
	//매출관리
	public List<Map<String, String>> SalesList(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.SalesList", map);
	}

	public int getSalesTotalA(Map<String, String> map) {
		return sqlSession.selectOne("buyListSQL.getSalesTotalA", map);
	}

	public List<Map<String, String>> searchText(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.searchText", map);
	}

	public int getSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("buyListSQL.getSearchTotalA", map);
	}
	
	//로그인한 회원의 배송중인 주문의 개수
	public int getDeliveryCountOfMember(String id) {
		return sqlSession.selectOne("buyListSQL.getDeliveryCountOfMember", id);
	}

	//로그인한 회원의 구매횟수,가격
	public Map<String, Integer> getBuyListCount(Map<String, String> map) {
		return sqlSession.selectOne("buyListSQL.getBuyListCount", map);
	}
	
	//myPageIndex 최근 주문내역 5개
	public List<Map<String,String>> get5BuyList(String id) {
		return sqlSession.selectList("buyListSQL.get5BuyList", id);
	}
	
	public Map<String,Integer> getSerialCount(String serial) {
		return sqlSession.selectOne("buyListSQL.getSerialCount", serial);
	}
	
	public List<BuyListDTO> getoriginList(String id) {
		return sqlSession.selectList("buyListSQL.getoriginList", id);
	}
	
	//나의 마일리지
	public int getTotalPoint(String id) {
		return sqlSession.selectOne("buyListSQL.getTotalPoint", id);
	}
	public int getTotalUsedPoint(String id) {
		return sqlSession.selectOne("buyListSQL.getTotalUsedPoint", id);
	}
	public int getPointTotalA(Map<String, String> map) {
		return sqlSession.selectOne("buyListSQL.getPointTotalA",map);
	}
	public List<Map<String, String>> myPointInfo(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.myPointInfo",map);
	}
	public int getUsedPointTotalA(Map<String, String> map) {
		return sqlSession.selectOne("buyListSQL.getUsedPointTotalA",map);
	}
	public List<Map<String, String>> myUsedPointInfo(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.myUsedPointInfo",map);
	}
	
	//상품 구매
	public String buyItems(BuyListDTO buyListDTO) {
		sqlSession.insert("buyListSQL.buyItems", buyListDTO);
		return sqlSession.selectOne("buyListSQL.getLatestSerial");
	}
	public void InsertSerialmapper(Map<String,String> map) {
		sqlSession.insert("buyListSQL.InsertSerialmapper", map);
	}
	public void savePoint(String id, int savePoint) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("point", savePoint+"");
		sqlSession.update("buyListSQL.savePoint", map);
	}
	
	public List<Map<String, String>> getMtmWrite(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.getMtmWrite", map);
	}
	
	public BuyListDTO getOneBuylist(String serial) {
		return sqlSession.selectOne("buyListSQL.getOneBuylist", serial);
	}
}