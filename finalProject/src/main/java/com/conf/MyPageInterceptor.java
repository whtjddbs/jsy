package com.conf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import buyList.dao.BuyListDAO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;

@Component
public class MyPageInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private BuyListDAO buyListDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		if(memberDTO==null) {
			response.sendRedirect("/finalProject/member/loginForm.do");
			return false;
		}else {
			int myHeartCount = itemDAO.getWishListCount(memberDTO.getId());
			int deliveringCount = buyListDAO.getDeliveryCountOfMember(memberDTO.getId());
			session.setAttribute("myHeartCount", myHeartCount);
			session.setAttribute("deliveringCount", deliveringCount);
			return true;
		}
	}
}
