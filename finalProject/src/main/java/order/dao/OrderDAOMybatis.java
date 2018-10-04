package order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public class OrderDAOMybatis implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, String>> getInfoList(String id) {
		return sqlSession.selectList("orderSQL.getInfoList", id);
	}

	public void shoppingBagDelete(Map<String,String> map) {
		sqlSession.delete("orderSQL.shoppingBagDelete", map);
		
	}
	
	public void addShoppingBag(Map<String,String> map) {
		sqlSession.insert("orderSQL.addShoppingBag", map);
	}

}
