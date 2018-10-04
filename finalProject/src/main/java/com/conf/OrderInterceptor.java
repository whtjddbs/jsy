package com.conf;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import member.bean.MemberDTO;

@Component
public class OrderInterceptor extends HandlerInterceptorAdapter {
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
						
			if(request.getParameterValues("seq")!=null && request.getParameterValues("color") != null) {
				String[] seq = request.getParameterValues("seq");
				String[] color = request.getParameterValues("color");
				String[] size1 = request.getParameterValues("size1");
				String[] size2 = request.getParameterValues("size2");
				String[] count = request.getParameterValues("count");
				
				List<Map<String,String>> list = new ArrayList<Map<String,String>>();
				
				for(int i=0; i < seq.length; i++) {
					Map<String,String> map = new HashMap<String, String>();
					map.put("seq", seq[i]);
					map.put("color", color[i]);
					map.put("size1", size1[i]);
					map.put("size2", size2[i]);
					map.put("count", count[i]);
					
					list.add(map);
				}
				
				session.setAttribute("list", list);
			}
			
			if(memberDTO==null) {
				String path = request.getServletPath();
		        String query = request.getQueryString(); //파라미터가 있는지 없는지

		        if(query != null)	session.setAttribute("prev_url", path+"?"+query);
		        else	session.setAttribute("prev_url", path);
		        
				request.getRequestDispatcher("/member/loginForm.do").forward(request, response);
				
				return false;
			}else {
				return true;
			}
		}
	}

