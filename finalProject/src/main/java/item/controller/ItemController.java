package item.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.conf.DefaultPaging;

import item.bean.BestPaging;
import item.bean.EventDTO;
import item.bean.ItemDTO;
import item.bean.ItemPaging;
import item.dao.ItemDAO;

@RequestMapping(value="new")
@Component
public class ItemController {
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private ItemPaging itemPaging;
	@Autowired
	private BestPaging bestPaging;
	@Autowired
	private DefaultPaging defaultPaging;
	
	@RequestMapping(value="newDisplay", method=RequestMethod.GET)
	public ModelAndView newDisplay(@RequestParam String main_codename,@RequestParam(required=false,defaultValue="1") String pg, HttpSession session) {
		//DB -1페이지당 16개씩
		int endNum = Integer.parseInt(pg)*16;
		int startNum = endNum-15;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("main_codename", main_codename);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
						
		List<Map<String,String>> list = itemDAO.getInfoList(map);
		
		//페이징 처리
		int totalA = itemDAO.getTotalA(map);
		itemPaging.setCurrentPage(Integer.parseInt(pg));
		itemPaging.setPageBlock(4);
		itemPaging.setPageSize(16);
		itemPaging.setTotalA(totalA);
		itemPaging.makePagingHTML(main_codename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("itemPaging", itemPaging);
		mav.addObject("display", "/new/newDisplay.jsp");
		mav.setViewName("/main/index");

		return mav;
	}
	
	@RequestMapping(value="getItemList", method=RequestMethod.POST)
	public ModelAndView getItemList() {
		
		List<ItemDTO> list = itemDAO.getItemList();
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="itemDisplay", method=RequestMethod.GET)
	public ModelAndView itemDisplay(@RequestParam String main_codename,
									@RequestParam(required=false) String sub_codename,
									@RequestParam(required=false,defaultValue="1") String pg) {
		if(sub_codename==null) {
			List<String> sublist = itemDAO.getSubList(main_codename);
			sub_codename = sublist.get(0);
		}
		
		//DB -1페이지당 16개씩
		int endNum = Integer.parseInt(pg)*16;
		int startNum = endNum-15;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("main_codename", main_codename);
		map.put("sub_codename", sub_codename);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
						
		List<Map<String,String>> list = itemDAO.getInfoList(map);
		
		//페이징 처리
		int totalA = itemDAO.getTotalA(map);
		
		itemPaging.setCurrentPage(Integer.parseInt(pg));
		itemPaging.setPageBlock(4);
		itemPaging.setPageSize(16);
		itemPaging.setTotalA(totalA);
		itemPaging.makePagingHTML(main_codename, sub_codename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("itemPaging", itemPaging);
		mav.addObject("display", "/new/itemDisplay.jsp");
		mav.setViewName("/main/index");

		return mav;
	}
	
	@RequestMapping(value="getSubList", method=RequestMethod.POST)
	public ModelAndView getSubList(@RequestParam String main_codename) {

		List<String> list = itemDAO.getSubList(main_codename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="bestDisplay",method=RequestMethod.GET)
	public ModelAndView bestDisplay(@RequestParam String main_codename,@RequestParam(required=false,defaultValue="1") String pg) {
		//DB -1페이지당 16개씩
		int endNum = Integer.parseInt(pg)*16;
		int startNum = endNum-15;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("main_codename", main_codename);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
						
		List<Map<String,String>> list = itemDAO.getBestInfoList(map);
		
		//페이징 처리
		int totalA = itemDAO.getBestTotalA(map);
		bestPaging.setCurrentPage(Integer.parseInt(pg));
		bestPaging.setPageBlock(4);
		bestPaging.setPageSize(16);
		bestPaging.setTotalA(totalA);
		bestPaging.makePagingHTML(main_codename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("bestPaging", bestPaging);
		mav.addObject("display", "/new/bestDisplay.jsp");
		mav.setViewName("/main/index");

		return mav;
	}
	
	//--------newController.java 합침
	@RequestMapping(value="newIndex",  method=RequestMethod.GET)
	public String newIndex(Model model) {
		model.addAttribute("display", "/new/newIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getCategory", method=RequestMethod.POST)
	public ModelAndView getCategory() {		
		List<ItemDTO> list = itemDAO.getCategory();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");		
		return mav;
	}
	
	@RequestMapping(value="getImageList", method=RequestMethod.POST)
	public ModelAndView getImageList(@RequestParam String main_codename) {	
		List<ItemDTO> list = itemDAO.getImageList(main_codename);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//best
	@RequestMapping(value="bestIndex",  method=RequestMethod.GET)
	public String bestIndex(Model model) {
		model.addAttribute("display", "/new/bestIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getBestImageList", method=RequestMethod.POST)
	public ModelAndView getBestImageList(@RequestParam String main_codename) {	
		List<Map<String,String>> list = itemDAO.getBestImageList(main_codename);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");	
		return mav;
	}
	
	@RequestMapping(value="event",method=RequestMethod.GET)
	public String event(Model model) {
		model.addAttribute("display", "/new/event.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="eventMainList",method=RequestMethod.POST)
	public ModelAndView eventMainList(@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 8개씩
		int endNum = Integer.parseInt(pg)*8;
		int startNum = endNum-7;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");	
		
		List<EventDTO> list = itemDAO.eventMainList(map);

		//페이징처리
		int totalA=itemDAO.getEventTotalA();
		
		defaultPaging.setCurrentPage(Integer.parseInt(pg));
		defaultPaging.setPageBlock(3);
		defaultPaging.setPageSize(8);
		defaultPaging.setTotalA(totalA);
		defaultPaging.makePagingHTML();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("list",list);
		mav.addObject("paging",defaultPaging);
		mav.setViewName("jsonView");	
		return mav;
	}
	
	@RequestMapping(value="eventDetail",method=RequestMethod.GET)
	public String eventDetail(@RequestParam(required=false) int seq
			                     ,Model model) {
		EventDTO eventDTO = itemDAO.eventDetailList(seq);
		
		model.addAttribute("eventDTO",eventDTO);
		model.addAttribute("display", "/new/eventDetail.jsp");
		return "/main/index";
	}
}
