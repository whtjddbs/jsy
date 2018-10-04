package item.dao;

import java.util.List;
import java.util.Map;

import item.bean.EventDTO;
import item.bean.ItemDTO;
import item.bean.Item_infoDTO;
import item.bean.Item_reviewDTO;

public interface ItemDAO {

	public List<ItemDTO> getItemList();

	public List<Map<String, String>> getInfoList(Map<String, String> map);

	public int getTotalA(Map<String,String> map);
	
	public List<ItemDTO> getCategory();

	public List<ItemDTO> getImageList(String main_codename);

	public List<String> getSubList(String main_codename);

	public List<ItemDTO> wishList(Map<String,String> map);

	public int getWishListCount(String id);
	
	public List<String> getColor(int seq);

	public List<String> getSize1(Map<String, String> map);

	public List<String> getSize2(Map<String, String> map);
	
	public ItemDTO getItemDTO(int seq);

	public List<String> checkMain_codename();

	public List<String> checkSub_codename(String main_codename);

	public List<Map<String,String>> getSerialMapper(String serial);
	
	public List<ItemDTO> getRecommendation(String main_codename);

	public int getSearchFormTotalA(String name);
	
	public List<ItemDTO> getSearchFormList(Map<String, String> map);
	
	public void itemDelete(String[] seq);

	public List<ItemDTO> itemSearchList(Map<String, String> map);

	public void itemModify(Item_infoDTO item_infoDTO);

	public int getAllTotalA(Map<String, String> map);

	public List<Item_infoDTO> itemDetailList(int seq);

	public void item_infoDelete(String[] sub_seq);

	public void itemAdd(Map<String, String> map);

	public List<Map<String, String>> getBestImageList(String main_codename);

	public List<Map<String, String>> getBestInfoList(Map<String, String> map);

	public int getBestTotalA(Map<String, String> map);
	
	public List<Map<String,String>> reviewAvailableList(String id);
	
	public List<Map<String,String>> reviewList(String id);
	
	public Item_reviewDTO getReviewDetail(Map<String,String> map);
	
	public List<EventDTO> eventMainList(Map<String, String> map);
	
	public int getEventTotalA();

	public EventDTO eventDetailList(int seq);

	public void eventAdd(Map<String, String> map);

	public void itemViewReview(Map<String, String> map);
	
	public void itemDetailAdd(Map<String, String> map);
}

