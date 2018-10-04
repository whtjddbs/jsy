package order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import buyList.bean.BuyListDTO;
import buyList.dao.BuyListDAO;
import item.bean.ItemDTO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;
import order.dao.OrderDAO;

@RequestMapping(value="order")
@Controller
public class OrderController {
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private BuyListDAO buyListDAO;
	
	//쇼핑백 화면
	@RequestMapping(value="shoppingBag", method=RequestMethod.GET)
	public ModelAndView shoppingBag(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		List<Map<String, String>> list = orderDAO.getInfoList(memberDTO.getId()); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/order/shoppingBag.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="shoppingBagDelete", method=RequestMethod.POST)
	public String shoppingBagDelete(@RequestParam String[] checkone, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		
		for(String seq : checkone) {
			System.out.println("seq : "+seq);
			list.add(Integer.parseInt(seq));			
		}
		//DB
		orderDAO.shoppingBagDelete(list);
		
		model.addAttribute("display", "/order/shoppingBagDelete.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="checkout", method=RequestMethod.POST)
	public ModelAndView checkout(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		List<BuyListDTO> originList = buyListDAO.getoriginList(memberDTO.getId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/order/checkout.jsp");
		mav.addObject("originList", originList);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="getItemDetail", method=RequestMethod.POST)
	public ModelAndView getItemDetail(@RequestParam String seq) {
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq));
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//장바구니에 추가
	@RequestMapping(value="addShoppingBag", method=RequestMethod.POST)
	public ModelAndView addShoppingBag(HttpSession session) {
		List<Map<String,String>> list = (List<Map<String,String>>)session.getAttribute("list");
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		for(Map<String,String> map : list) {
			map.put("id", memberDTO.getId());
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
}