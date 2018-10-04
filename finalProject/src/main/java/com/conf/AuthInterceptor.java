package com.conf;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private MemberDAO memberDAO;

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberDTO");
		
		if(obj == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				String id = loginCookie.getValue();
				MemberDTO memberDTO = memberDAO.getMember(id);
				if(memberDTO != null) {
					session.setAttribute("memberDTO", memberDTO);
					return true;
				}
			}
			
			//로그인이 안되어 있는 상태 - 로그인 폼으로 돌려 보냄
			//response.sendRedirect("/finalProject/member/loginForm.do");
			return true;
		}
		
		return true;
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미 
		// true로 하면 컨트롤러 uri로 가게 됨
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
