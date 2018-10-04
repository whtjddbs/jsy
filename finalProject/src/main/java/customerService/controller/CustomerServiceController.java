package customerService.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.conf.DefaultPaging;

import buyList.dao.BuyListDAO;
import customerService.bean.FaQDTO;
import customerService.bean.MantomanDTO;
import customerService.bean.NoticeDTO;
import customerService.bean.NoticePaging;
import customerService.dao.CustomerServiceDAO;
import item.bean.ItemDTO;
import item.bean.Paging;
import item.dao.ItemDAO;
import member.bean.MemberDTO;

@RequestMapping(value="customerService")
@Component
public class CustomerServiceController {	
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private Paging paging;
	@Autowired
	private NoticePaging noticePaging;
	@Autowired
	private BuyListDAO buyListDAO;
	@Autowired
	private ItemDAO itemDAO;
	
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
	
	//1:1 문의
	@RequestMapping(value="mantomanList.do")
	public String mantomanList(Model model) {
		model.addAttribute("display", "/myPage/myPageIndex.jsp");
		model.addAttribute("myPageBody", "/customerService/mantomanList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getMantomanList.do")
	public ModelAndView getMantomanList(@RequestParam(required=false,defaultValue="1") String pg,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		String id=memberDTO.getId();
		
		int endNum=Integer.parseInt(pg)*5;
		int startNum=endNum-4;
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("id", id);
		
		int totalA=customerServiceDAO.getTotalA3(id);
		
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(5);
		paging.setTotalA(totalA);
		paging.makePagingHTML3();
		
		List<MantomanDTO> list=customerServiceDAO.getMantomanList(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="mantomanWriteForm.do")
	public String mantomanWriteForm(Model model) {
		model.addAttribute("display", "/myPage/myPageIndex.jsp");
		model.addAttribute("myPageBody", "/customerService/mantomanWriteForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="mantomanWriteForm2.do")
	public ModelAndView mantomanWriteForm2(@RequestParam(required=false, defaultValue="1") String pg, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		//구매목록 가져오기
		int currentPage = Integer.parseInt(pg);
		int pageSize = 5;
		int endNum = pageSize*currentPage;
		int startNum = endNum-pageSize+1;
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",memberDTO.getId());
		map.put("status", "");
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<Map<String,String>> list = buyListDAO.getMtmWrite(map);
		int totalA = buyListDAO.getDeliveryTotalA(map);
		
		//list data 수정
		for(Map<String,String> mapList : list) {
			String[] names= mapList.get("NAME").split(",");
			String cnt= String.valueOf(mapList.get("CNT"));
			String nameCnt=names[0]+" 등 "+cnt+"건";
			String total=String.valueOf(mapList.get("TOTALPRICE"))+"원";
			
			mapList.put("TOTALPRICE", total);
			mapList.put("NAME", nameCnt);
		}
		
		DefaultPaging paging = new DefaultPaging();
		paging.setCurrentPage(currentPage);
		paging.setPageSize(pageSize);
		paging.setPageBlock(3);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="mantomanWrite.do")
	public String mantomanWrite(@ModelAttribute MantomanDTO mantomanDTO
									  ,MultipartHttpServletRequest multi
									  , HttpSession session
									  , Model model) throws IOException {
		
		String fileName=null;
		InputStream inputStream=null;
		String newFileName="";
		
		
		Iterator<String> itr = multi.getFileNames();
		if(itr.hasNext()) {
			MultipartFile mf=multi.getFile(itr.next());
			fileName=mf.getOriginalFilename();
			inputStream=mf.getInputStream();
			
			String filePath=session.getServletContext().getRealPath("/image/mantoman/");
			newFileName =System.currentTimeMillis() + "_" + fileName ;
			File file=new File(filePath, newFileName);
			FileCopyUtils.copy(inputStream, new FileOutputStream(file));
		}
		
		
		//DTO에 나머지 담기
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		mantomanDTO.setId(memberDTO.getId());
		mantomanDTO.setImg(newFileName);
		
		customerServiceDAO.mantomanWrite(mantomanDTO);
		
		return "success";
	}
	
	@RequestMapping(value="findItem.do")
	public ModelAndView findItem(@RequestParam String itemSeq) {
		
		int seq=Integer.parseInt(itemSeq);
		ItemDTO itemDTO=itemDAO.getItemDTO(seq);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteMtm.do")
	public String deleteMtm(@RequestParam int seq) {
		
		customerServiceDAO.deleteMtm(seq);
		
		return "success";
	}
	
	//myQnA
	@RequestMapping(value="myQnA.do",method=RequestMethod.GET)
	public String myQnA(@RequestParam(required=false,defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/myPage/myPageIndex.jsp");
		model.addAttribute("myPageBody", "/customerService/myQnA.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getMyQnA.do")
	public ModelAndView getMyQnA(@RequestParam(required=false,defaultValue="1") String pg,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		String id=memberDTO.getId();
		
		int endNum=Integer.parseInt(pg)*5;
		int startNum=endNum-4;
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("id", id);
		
		int totalA=customerServiceDAO.getTotalA4(id);
		
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(5);
		paging.setTotalA(totalA);
		paging.makePagingHTML4();
		
		List<Map<String,String>> list=customerServiceDAO.getMyQnA(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteQnA.do")
	public String deleteQnA(@RequestParam int seq) {
		
		customerServiceDAO.deleteQnA(seq);
		
		return "success";
	}
}






























