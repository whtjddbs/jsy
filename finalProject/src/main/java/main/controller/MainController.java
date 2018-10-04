package main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import item.bean.ItemDTO;
import item.bean.SearchFormPaging;
import item.dao.ItemDAO;

@Component
@Controller
public class MainController {
	@Autowired
	private ItemDAO itemDAO;
	
	@Autowired
	private SearchFormPaging searchFormPaging;
	
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView index(Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/template/body.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	//마이페이지 메인화면
	@RequestMapping(value="/myPage/mainPage.do",method=RequestMethod.GET)
	public String mainPage(Model model) {
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//마이페이지 위시리스트
	@RequestMapping(value="/myPage/mainPage_wishList.do",method=RequestMethod.GET)
	public String mainPage_wishList(Model model) {
		model.addAttribute("display", "/myPage/wishList.jsp");
		return "/main/index";
	}
	
	//찾기 페이지 이동 
	@RequestMapping(value="/etc/searchForm.do", method=RequestMethod.GET)
	public String searchForm(Model model) {

		model.addAttribute("display","/etc/searchForm.jsp");
		return "/main/index";
	}
	
	//searchForm - list뿌리기 
	@RequestMapping(value="/etc/search.do", method=RequestMethod.POST)
	public ModelAndView getSearchFormList(@RequestParam String name, @RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 20개씩..
		int endNum = Integer.parseInt(pg)*20;
		int startNum = endNum-19;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");	
		map.put("name", name);
		
		List<ItemDTO> list = itemDAO.getSearchFormList(map);
		
		//페이징처리
		int totalA=itemDAO.getSearchFormTotalA(name);		
		searchFormPaging.setCurrentPage(Integer.parseInt(pg));
		searchFormPaging.setPageBlock(3);
		searchFormPaging.setPageSize(20);
		searchFormPaging.setTotalA(totalA);
		searchFormPaging.makePagingHTML(); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("searchFormPaging", searchFormPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//개인정보취급방침 이동 
	@RequestMapping(value="/etc/privacyPolicy.do", method=RequestMethod.GET)
	public String privacyPolicy(Model model) {
		
		model.addAttribute("display","/etc/privacyPolicy.jsp");
		return "/main/index";
	}
	//이용약관 이동 
	@RequestMapping(value="/etc/termsAndConditions.do", method=RequestMethod.GET)
	public String termsAndConditions(Model model) {
		
		
		model.addAttribute("display","/etc/termsAndConditions.jsp");
		return "/main/index";
	}
	
	//회사소개 이동
	@RequestMapping(value="/etc/introCompany.do", method=RequestMethod.GET)
	public String IntroCompany(Model model) {
		
		model.addAttribute("display", "/etc/introCompany.jsp");
		return "/main/index";
	}
	
	//recommendation 아이템 뿌리기 
	@RequestMapping(value="/template/recommend.do", method=RequestMethod.POST)
	public ModelAndView getRecommendation(@RequestParam String main_codename) {
		List<ItemDTO> list = itemDAO.getRecommendation(main_codename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}