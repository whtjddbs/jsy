package order.dao;

import java.util.List;
import java.util.Map;

public interface OrderDAO {

	public List<Map<String, String>> getInfoList(String id);

	public void shoppingBagDelete(Map<String,String> map);

	public void addShoppingBag(Map<String,String> map);
}
