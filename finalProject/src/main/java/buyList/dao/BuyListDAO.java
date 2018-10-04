package buyList.dao;

import java.util.List;
import java.util.Map;

import buyList.bean.BuyListDTO;

public interface BuyListDAO {

	public List<Map<String, String>> getDeliveryDetail(String serial);

	public List<BuyListDTO> getBuyList(Map<String, String> map);

	public void changeStatus(Map<String, Object> map);

	public int getDeliveryTotalA(Map<String, String> map);
	
	public List<Map<String, String>> SalesList(Map<String, String> map);

	public int getSalesTotalA(Map<String, String> map);

	public List<Map<String, String>> searchText(Map<String, String> map);

	public int getSearchTotalA(Map<String, String> map);
	
	public int getDeliveryCountOfMember(String id);

	public Map<String, Integer> getBuyListCount(Map<String, String> map);
	
	public List<Map<String,String>> get5BuyList(String id);
	
	public int getSerialCount(String serial);
	
	public List<BuyListDTO> getoriginList(String id);

}
