package customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.FaQDTO;
import customerService.bean.MantomanDTO;
import customerService.bean.NoticeDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FaQDTO> getFaqList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.getFaqList",map);
	
	}

	public int getTotalA(String faq_type) {
		return sqlSession.selectOne("customerServiceSQL.getTotalA",faq_type);
	}

	public List<FaQDTO> searchFaqList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.searchFaqList",map);
	}

	public int getTotalA2(String search) {
		return sqlSession.selectOne("customerServiceSQL.getTotalA2",search);
	}

	public List<NoticeDTO> viewNoticeList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.viewNoticeList", map);
	}

	public int getNoticeTotalA() {
		return sqlSession.selectOne("customerServiceSQL.getNoticeTotalA");
	}
	
	public void noticeUpload(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.noticeUpload", map);
	}
	public void noticeDelete(int seq) {
		sqlSession.delete("customerServiceSQL.noticeDelete", seq);
	}
	
	public NoticeDTO noticeModifyForm(int seq) {
		return sqlSession.selectOne("customerServiceSQL.noticeModifyForm", seq);
	}
	public void noticeUpdate(Map<String, String> map) {
		sqlSession.update("customerServiceSQL.noticeUpdate", map);
	}
	
	public void mantomanWrite(MantomanDTO mantomanDTO) {
		sqlSession.insert("customerServiceSQL.mantomanWrite", mantomanDTO);
	}

	public int getTotalA3(String id) {
		return sqlSession.selectOne("customerServiceSQL.getTotalA3",id);
	}

	public List<MantomanDTO> getMantomanList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.getMantomanList",map);
	}

	public void deleteMtm(int seq) {
		sqlSession.delete("customerServiceSQL.deleteMtm", seq);
	}
	
	public int getTotalA4(String id) {
		return sqlSession.selectOne("customerServiceSQL.getTotalA4",id);
	}

	public List<Map<String, String>> getMyQnA(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.getMyQnA",map);
	}
	
	public void deleteQnA(int seq) {
		sqlSession.delete("customerServiceSQL.deleteQnA", seq);
	}
}
