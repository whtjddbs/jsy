package order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import buyList.bean.BuyListDTO;
import buyList.dao.BuyListDAO;
import item.bean.ItemDTO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;
import member.dao.MailService;
import member.dao.MemberDAO;
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
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MailService mailService;
	
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
	public String shoppingBagDelete(@RequestParam String[] seq
									,@RequestParam String[] color
									,@RequestParam String[] size1
									,@RequestParam String[] size2
									,HttpSession session
									,Model model) {
		List<Map<String,String>> list = (List<Map<String,String>>)session.getAttribute("list");
		System.out.println(list);
		//DB
		for(Map<String,String> map : list) {
			orderDAO.shoppingBagDelete(map);
		}
		
		model.addAttribute("display", "/order/shoppingBagDelete.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="checkout")
	public ModelAndView checkout(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		ModelAndView mav = new ModelAndView();
		
		if(memberDTO!=null) {
			List<BuyListDTO> originList = buyListDAO.getoriginList(memberDTO.getId());
			mav.addObject("originList", originList);
		}
		mav.addObject("display", "/order/checkout.jsp");
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
	@RequestMapping(value="addShoppingBag")
	public String addShoppingBag(HttpSession session) {
		List<Map<String,String>> list = (List<Map<String,String>>)session.getAttribute("list");
		System.out.println(list);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		if(list != null) {
			for(Map<String,String> map : list) {
				map.put("id", memberDTO.getId());
				orderDAO.addShoppingBag(map);
			}
			session.removeAttribute("list");
		}
		
		return "redirect:/order/shoppingBag.do";
	}
	
	//결제
	@RequestMapping(value="buyItems", method=RequestMethod.POST)
	@ResponseBody
	public String buyItems(@ModelAttribute BuyListDTO buyListDTO
						, @ModelAttribute MemberDTO guest
						, @RequestParam(required=false) String updateAddr
						, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		String id = null;
		if(memberDTO==null) {
			id = memberDAO.addGuest(guest);
		}else {
			id = memberDTO.getId();
		}
		int savePoint = 0;
		buyListDTO.setId(id);
		
		//buylist 레코드 추가
		String serial = buyListDAO.buyItems(buyListDTO);
		
		List<Map<String,String>> list = (List<Map<String,String>>)session.getAttribute("list");
		
		//serialmapper 레코드 추가
		if(list != null) {
			for(Map<String,String> map : list) {
				map.put("id", id);
				buyListDAO.InsertSerialmapper(map);
				savePoint += Integer.parseInt(map.get("price"))*Integer.parseInt(map.get("count"));
			}
			session.removeAttribute("list");
		}
		
		//주문확인 메일
		String subject = "BbanB 주문내역입니다";
		StringBuilder sb = new StringBuilder();
		sb.append("<h2>BbanB 주문내역</h2>");
		sb.append("<p>주문번호 : "+serial+"</p>");
		mailService.send(subject, sb.toString(), "sooellen10@gmail.com", guest.getEmail());
		
		//포인트 적립
		buyListDAO.savePoint(id, savePoint/100);
		
		//주소변경
		if(updateAddr!=null) {
			memberDAO.updateAddr(buyListDTO);
		}
		
		if(memberDTO==null) {
			return serial;
		}else {
			//memberDTO 갱신
			session.setAttribute("memberDTO", memberDAO.getMember(id));
			return "ok";
		}
	}
	
	//비회원 주문 폼
	@RequestMapping(value="guestCheckout")
	public String guestCheckout(Model model) {
		model.addAttribute("display", "/order/guestCheckout.jsp");
		return "/main/index";
	}
}