package member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import buyList.bean.BuyListDTO;
import member.bean.MemberDTO;

@Transactional
@Component
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;

	public MemberDTO login(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.login",map);
	}

	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write",memberDTO);
	}

	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("memberSQL.getMember",id);
	}
	
	public void modify(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.modify",memberDTO);
		
	}

	public MemberDTO finedOneByEmail(String email) {
		return sqlSession.selectOne("memberSQL.finedOneByEmail",email);
	}

	public void newpwdUpdate(Map<String, String> map) {
		sqlSession.update("memberSQL.newpwdUpdate",map);
	}

	public List<String> getWishList(String id) {
		return sqlSession.selectList("memberSQL.getWishList", id);
	}

	public void addWishList(Map<String, String> map) {
		sqlSession.insert("memberSQL.addWishList", map);
	}

	public void deleteWishList(Map<String, String> map) {
		sqlSession.delete("memberSQL.deleteWishList", map);
	}
	
	public int getWishListTotalA(String id) {
		return sqlSession.selectOne("memberSQL.getWishListTotalA", id);
	}

	public void byeMember(Map<String, String> map) {
		sqlSession.delete("memberSQL.byeMember", map);
	}
	
	public void updateAddr(BuyListDTO buylistDTO) {
		sqlSession.update("memberSQL.updateAddr", buylistDTO);
	}
	
	public String addGuest(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.addGuest", memberDTO);
		return sqlSession.selectOne("memberSQL.getGuestId");
	}
	
	public MemberDTO getGuest(Map<String,String> map) {
		return sqlSession.selectOne("memberSQL.getGuest", map);
	}
}
