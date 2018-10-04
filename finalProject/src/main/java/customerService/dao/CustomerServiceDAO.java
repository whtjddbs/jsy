package customerService.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.FaQDTO;
import customerService.bean.MantomanDTO;
import customerService.bean.NoticeDTO;

public interface CustomerServiceDAO {

	public List<FaQDTO> getFaqList(Map<String, String> map);

	public int getTotalA(String faq_type);

	public List<FaQDTO> searchFaqList(Map<String, String> map);

	public int getTotalA2(String search);
	
	List<NoticeDTO> viewNoticeList(Map<String, String> map);

	public int getNoticeTotalA();
	
	public void noticeUpload(Map<String, String> map);

	public void noticeDelete(int seq);

	public NoticeDTO noticeModifyForm(int seq);

	public void noticeUpdate(Map<String, String> map);
	
	public void mantomanWrite(MantomanDTO mantomanDTO);

	public int getTotalA3(String id);

	public List<MantomanDTO> getMantomanList(Map<String, String> map);

	public void deleteMtm(int seq);

	public int getTotalA4(String id);

	public List<Map<String, String>> getMyQnA(Map<String, String> map);

	public void deleteQnA(int seq);
}
