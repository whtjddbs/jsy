package customerService.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.FaQDTO;
import customerService.bean.NoticeDTO;
import customerService.bean.NoticePaging;
import customerService.dao.CustomerServiceDAO;
import item.bean.Paging;

@RequestMapping(value="customerService")
@Component
public class CustomerServiceController {	
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private Paging paging;
	@Autowired
	private NoticePaging noticePaging;
	
	//faqs
	@RequestMapping(value="faq.do",method=RequestMethod.GET)
	public String faq(@RequestParam(required=false,defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/myPage/myPageIndex.jsp");
		model.addAttribute("myPageBody", "/customerService/faq.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getFaqList.do",method=RequestMethod.GET)
	public ModelAndView getFaqList(@RequestParam(required=false,defaultValue="1") String pg
								   ,@RequestParam String faq_type) {
		
		int endNum=Integer.parseInt(pg)*10;
		int startNum=endNum-9;
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		if(faq_type.equals("자주찾는 FAQ")) faq_type="";
		map.put("type", faq_type);
		
		int totalA=customerServiceDAO.getTotalA(faq_type);
		
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(10);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<FaQDTO> list=customerServiceDAO.getFaqList(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="faq_guide.do")
	public String faq_guide(Model model) {
		model.addAttribute("display", "/myPage/myPageIndex.jsp");
		model.addAttribute("myPageBody", "/customerService/faq_guide.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="searchFaqList.do")
	public ModelAndView searchFaqList(@RequestParam(required=false,defaultValue="1") String pg
								      ,@RequestParam String search) {
		
		int endNum=Integer.parseInt(pg)*10;
		int startNum=endNum-9;
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("content", search);
		
		int totalA=customerServiceDAO.getTotalA2(search);
		
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(10);
		paging.setTotalA(totalA);
		paging.makePagingHTML2();
		
		List<FaQDTO> list=customerServiceDAO.searchFaqList(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging2", paging);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//notice
	@RequestMapping(value="notice.do", method=RequestMethod.GET)
	public String notice(Model model) {
		model.addAttribute("myPageBody", "/customerService/notice.jsp");
		model.addAttribute("display", "/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	//공지사항 목록띄우기 
	@RequestMapping(value="noticeList.do", method=RequestMethod.POST)
	public ModelAndView viewNoticeList(@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");	
		
		List<NoticeDTO>list = customerServiceDAO.viewNoticeList(map);
		
		//페이징처리
		int totalA=customerServiceDAO.getNoticeTotalA();
		
		noticePaging.setCurrentPage(Integer.parseInt(pg));
		noticePaging.setPageBlock(3);
		noticePaging.setPageSize(5);
		noticePaging.setTotalA(totalA);
		noticePaging.makePagingHTML(); 
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("noticePaging", noticePaging);
		mav.setViewName("jsonView");
		return mav;
	}
}






























