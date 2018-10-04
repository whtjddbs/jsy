package refundRequest.dao;

import java.util.List;
import java.util.Map;

import refundRequest.bean.RefundRequestDTO;

public interface RefundRequestDAO {
	public List<Map<String, String>> getRefundList(Map<String, String> map);

	public List<Map<String, String>> getRefundDetail(String serial);

	public List<Map<String, String>> getRefundInfo(String serial);

	public  int getRefundTotalA(Map<String, String> map);

	public List<Map<String, String>> changeRefundInfo(String itemSerial);

	public void changeAllRefundInfo(Map<String, Object> map);

	public List<RefundRequestDTO> viewModifyList(Map<String, String> map);

	public int getrefundRequestTotalA(Map<String, String> map);

	public List<RefundRequestDTO> vieworderType(Map<String, String> map);

	public int getorderTypeTotalA(Map<String, String> map);
}
