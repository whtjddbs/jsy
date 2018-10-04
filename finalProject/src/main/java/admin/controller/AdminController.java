package admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.conf.DefaultPaging;

import buyList.bean.BuyListDTO;
import buyList.bean.DeliveryControllPaging;
import buyList.bean.SalesMgmtPaging;
import buyList.dao.BuyListDAO;
import customerService.bean.NoticeDTO;
import customerService.dao.CustomerServiceDAO;
import item.bean.ItemControllPaging;
import item.bean.ItemDTO;
import item.bean.Item_infoDTO;
import item.dao.ItemDAO;
import refundRequest.dao.RefundRequestDAO;

@RequestMapping(value="admin")
@Component
public class AdminController {
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private BuyListDAO buyListDAO;
	@Autowired
	private ItemControllPaging paging;
	@Autowired
	private RefundRequestDAO refundRequestDAO;
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	
	@RequestMapping(value="adminIndex", method=RequestMethod.GET)
	public String adminIndex(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/deliveryControll.jsp");
		return "/main/index";
	}
	
	//배송관리
	@RequestMapping(value="deliveryControll", method=RequestMethod.GET)
	public String deliveryControll(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/deliveryControll.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="refundControll", method=RequestMethod.GET)
	public String refundControll(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/refundControll.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="itemControll", method=RequestMethod.GET)
	public String itemControll(Model model) {
		
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/itemControll.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="itemAddForm", method=RequestMethod.GET)
	public String itemAddForm(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/itemAddForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="deliveryDetail", method=RequestMethod.POST)
	public ModelAndView deliveryDetail(@RequestParam String serial) {
		List<Map<String,String>> list = buyListDAO.getDeliveryDetail(serial);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("logtime", list.get(0).get("LOGTIME"));
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="getDeliveryList", method=RequestMethod.POST)
	public ModelAndView getConditionalDeliveryList(@RequestParam Map<String,String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 5;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA = buyListDAO.getDeliveryTotalA(map);
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		DeliveryControllPaging paging = new DeliveryControllPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<BuyListDTO> list = buyListDAO.getBuyList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="changeDeliveryStatus", method=RequestMethod.POST)
	public ModelAndView changeDeliveryStatus(@RequestParam(value="check[]", required=false) List<String> check, @RequestParam String checkStatus
											, @RequestParam Map<String,Object> map) {
		String status = null;
		if(checkStatus.equals("준비중")) status="배송중";
		else if(checkStatus.equals("배송중")) status="배송완료";
		
		//Map<String, Object> finishMap = new HashMap<String, Object>();
		map.put("serials", check);
		map.put("status", status);
		
		buyListDAO.changeStatus(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("check", check);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="itemDelete",method=RequestMethod.POST)
	public ModelAndView itemDelete(@RequestParam(required=false) String[] seq
							,@RequestParam(required=false) String[] sub_seq
							,@RequestParam String compare
							,Model model) {
		if(compare.equals("sub_seq")) {
			itemDAO.item_infoDelete(sub_seq);//item_info
		}else {
			itemDAO.itemDelete(seq); //item
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="getSubList",method=RequestMethod.POST)
	public ModelAndView getSubList(@RequestParam String main_codename) {
		List<String> list = itemDAO.getSubList(main_codename);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="itemSearchList",method=RequestMethod.POST)
	public ModelAndView itemSearchList(@RequestParam(required=false,defaultValue="1") String pg
			                          ,@RequestParam Map<String,String> map) {
		if(map.get("startPrice").equals("")) map.put("startPrice", "0");
		if(map.get("endPrice").equals("")) map.put("endPrice", "10000000");
		
		int endNum=Integer.parseInt(pg)*10;
		int startNum=endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<ItemDTO> list = itemDAO.itemSearchList(map);
		int totalA=itemDAO.getAllTotalA(map);

		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(10);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="itemDetailList",method=RequestMethod.POST)
	public ModelAndView itemDetailList(@RequestParam int seq) {
		List<Item_infoDTO> list = itemDAO.itemDetailList(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="itemAdd",method=RequestMethod.POST)
	public String itemAdd(@RequestParam Map<String,String> map
						 ,@RequestParam MultipartFile[] image 
						 ,Model model
						 ,HttpSession session) {
		String filePath = session.getServletContext().getRealPath("/image/");
		filePath += map.get("main_codename");
		String fileName1 = image[0].getOriginalFilename(); 
		String fileName2 = image[1].getOriginalFilename();
		
		File file1 = new File(filePath,fileName1);
		File file2 = new File(filePath,fileName2);
		
		try {
			FileCopyUtils.copy(image[0].getInputStream(), new FileOutputStream(file1));
			FileCopyUtils.copy(image[1].getInputStream(), new FileOutputStream(file2));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		map.put("img1", fileName1);
		map.put("img2", fileName2);
		if(!map.containsKey("size2")) map.put("size2", "");
		
		itemDAO.itemAdd(map);
		
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/itemAdd.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="itemDetailAdd",method=RequestMethod.POST)
	public ModelAndView itemDetailAdd(@RequestParam Map<String,String> map
									 ,Model model) {
		itemDAO.itemDetailAdd(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="itemModify",method=RequestMethod.POST)
	@ResponseBody
	public String itemModify(@ModelAttribute Item_infoDTO item_infoDTO) {
		itemDAO.itemModify(item_infoDTO);
		return "modifyOk";
	}
	
	//매출 관리
	@RequestMapping(value="salesMgmt", method=RequestMethod.GET)
	public String SalesMgmt(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/SalesMgmt.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="checkMain_codename", method=RequestMethod.GET)
	public ModelAndView checkMain_codename() {
		ModelAndView mav = new ModelAndView();
		List<String> list = itemDAO.checkMain_codename();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="checkSub_codename", method=RequestMethod.GET)
	public ModelAndView checkSub_codename(@RequestParam String main_codename) {
		ModelAndView mav = new ModelAndView();
		List<String> list = itemDAO.checkSub_codename(main_codename);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="SalesList", method=RequestMethod.POST)
	public ModelAndView SalesList(@RequestParam Map<String, String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));

		
		int pageSize = 10;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA = buyListDAO.getSalesTotalA(map);
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		SalesMgmtPaging paging = new SalesMgmtPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		
		List<Map<String, String>> list = buyListDAO.SalesList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
	@RequestMapping(value="searchText", method=RequestMethod.POST)
	public ModelAndView searchText(@RequestParam Map<String, String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 10;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA = buyListDAO.getSearchTotalA(map);
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		SalesMgmtPaging paging = new SalesMgmtPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<Map<String, String>> list = buyListDAO.searchText(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//취소,교환,반품 관리
	@RequestMapping(value="getRefundList", method=RequestMethod.POST)
	public ModelAndView getRefundList(@RequestParam Map<String,String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 3;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA =  refundRequestDAO.getRefundTotalA(map);
		
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		
		DefaultPaging paging = new DefaultPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		 mapList = refundRequestDAO.getRefundList(map);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", paging);
		mav.addObject("mapList", mapList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	@RequestMapping(value="getRefundDetail",method=RequestMethod.POST)
	public ModelAndView getRefundDetail(@RequestParam String serial) {

		List<Map<String,String>> list = refundRequestDAO.getRefundDetail(serial);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="getRefundInfo",method=RequestMethod.POST)
	public ModelAndView getRefundInfo(@RequestParam String serial) {
		
		List<Map<String,String>> mapList1 = refundRequestDAO.getRefundInfo(serial);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mapList1",mapList1);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="changeRefundInfo",method=RequestMethod.POST)
	public ModelAndView changeRefundInfo(@RequestParam String itemSerial) {
		
		System.out.println(itemSerial);
		
		List<Map<String,String>> mapList = refundRequestDAO.changeRefundInfo(itemSerial);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mapList",mapList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="changeAllRefundInfo",method=RequestMethod.POST)
	public ModelAndView changeAllRefundInfo(@RequestParam(value="check[]") List<String> check) {
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("serials", check);
		
		refundRequestDAO.changeAllRefundInfo(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("check",check);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//공지사항
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String notice(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/customerService/notice.jsp");
		return "/main/index";
	}
	
	//관리자 공지사항 글쓰기 
	@RequestMapping(value="noticeWriteForm", method=RequestMethod.GET)
	public String noticeWriteForm(Model model) {
		model.addAttribute("adminBody", "/admin/noticeWriteForm.jsp");
		model.addAttribute("display", "/admin/adminIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="noticeUpload", method=RequestMethod.POST)
	public String noticeUpload(@RequestParam Map<String,String> map, Model model) {
		customerServiceDAO.noticeUpload(map);
		
		return "redirect:/admin/notice.do";
	}
	
	//공지사항 글삭제
	@RequestMapping(value="noticeDelete", method=RequestMethod.GET)
	public  String noticeDelete(@RequestParam int seq, Model model) {
		
		customerServiceDAO.noticeDelete(seq);
		
		model.addAttribute("adminBody", "/customerService/notice.jsp");
		model.addAttribute("display", "/admin/adminIndex.jsp");
		return "/main/index";
	}
	
	//공지사항 글수정 이동 
	@RequestMapping(value="noticeModifyForm", method=RequestMethod.GET)
	public String noticeModifyForm(@RequestParam int seq, Model model) {
		
		NoticeDTO noticeDTO = customerServiceDAO.noticeModifyForm(seq);

		model.addAttribute("seq", seq);
		model.addAttribute("noticeDTO", noticeDTO);
		model.addAttribute("adminBody", "/admin/noticeModifyForm.jsp");
		model.addAttribute("display", "/admin/adminIndex.jsp");
		return "/main/index";
	}
	
	//공지사항 글수정하기 
	@RequestMapping(value="noticeUpdate", method=RequestMethod.POST)
	public String noticeModifyUpdate(@RequestParam Map<String,String> map, Model model) {
		
		customerServiceDAO.noticeUpdate(map);
		
		return "redirect:/admin/notice.do";
	}
	
	//이벤트 등록
	@RequestMapping(value="eventAdd", method=RequestMethod.GET)
	public String eventAdd(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/eventAdd.jsp");
		return "/main/index";
	}
	
	
	@RequestMapping(value="eventAddOk",method=RequestMethod.POST)
	public String eventAddOk(@RequestParam Map<String,String> map
						   ,@RequestParam MultipartFile[] image 
						   ,Model model
						   ,HttpSession session) {
		String filePath = session.getServletContext().getRealPath("/image/");
		filePath += "event";
		String fileName1 = image[0].getOriginalFilename(); 
		String fileName2 = image[1].getOriginalFilename();
		
		File file1 = new File(filePath,fileName1);
		File file2 = new File(filePath,fileName2);
		
		try {
			FileCopyUtils.copy(image[0].getInputStream(), new FileOutputStream(file1));
			FileCopyUtils.copy(image[1].getInputStream(), new FileOutputStream(file2));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		map.put("img1", fileName1);
		map.put("img2", fileName2);
		
		itemDAO.eventAdd(map);
		
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/eventAddOk.jsp");
		return "/main/index";
	}
}
