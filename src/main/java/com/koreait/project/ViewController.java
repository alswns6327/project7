package com.koreait.project;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.dao.MybatisDAO;
import com.koreait.vo.BoardVO;
import com.koreait.vo.ItemList;
import com.koreait.vo.ItemVO;
import com.koreait.vo.MemberVO;
 
 

@Controller
public class ViewController {
	
	@Autowired
	SqlSession sqlSession;
	
//	homePage.jsp를 호출 하는 메소드
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		System.out.println("컨트롤러로 homePage 호출");
		return "homePage";
	}
	
//	homePage.jsp를 호출 
	@RequestMapping("/homePage")
	public String homeback() {
		System.out.println("homeback 메소드 실행");
		return "homePage";
	}
	
//	interiorMain.jsp를 호출 
	@RequestMapping("/interiorMain")
	public String interiorMain() {
		System.out.println("컨트롤러로 interiorMain 호출");
		return "/productMain/interiorMain";
	}
	
//	lightingMain.jsp를 호출 
	@RequestMapping("/lightingMain")
	public String lightingMain() {
		System.out.println("컨트롤러로 lightingMain 호출");
		return "/productMain/lightingMain";
	}
	

//	productMain.jsp를 호출 하는 메소드
	@RequestMapping("/productMain")
	public String productMain(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 productMain 호출");
		return "productMain";
	}
	
//	======================================== speakerDetail 호출===============================================	
			
	@RequestMapping("/speakerDetail00")
	public String speakerDetail00() {
		System.out.println("컨트롤러로 speakerDetail00 호출");
		return "/productDetail/speakerDetail00";
	}
	@RequestMapping("/speakerDetail01")
	public String productDetail01() {
		System.out.println("컨트롤러로 productDetail01 호출");
		return "/productDetail/speakerDetail01";
	}
	@RequestMapping("/speakerDetail02")
	public String productDetail02() {
		System.out.println("컨트롤러로 productDetail02 호출");
		return "/productDetail/speakerDetail02";
	}
	@RequestMapping("/speakerDetail03")
	public String productDetail03() {
		System.out.println("컨트롤러로 productDetail03 호출");
		return "/productDetail/speakerDetail03";
	}
			
		//======================================== interiorDetail 호출===============================================	
			
//		interiorDetail01.jsp를 호출 
		@RequestMapping("/interiorDetail00")
		public String interiorDetail00() {
			System.out.println("컨트롤러로 interiorDetail00 호출");
			return "/productDetail/interiorDetail00";
		}
			
		//======================================== lightingDetail 호출===============================================	
			
//		lightingDetail01.jsp를 호출 
		@RequestMapping("/lightingDetail00")
		public String productDetail00() {
			System.out.println("컨트롤러로 lightingDetail00 호출");
			return "/productDetail/lightingDetail00";
		}

		//======================================== Detail 끝===============================================

	
//	as.jsp호출
	@RequestMapping("/as")
	public String as(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 as 호출");
		return "as";
	}
	
//	speakerMain에서 게시글 입력시 오는 요청처리
	@RequestMapping("/speakerMain")
	public String speakerMain(HttpServletRequest request, Model model, BoardVO boardVO) {
		System.out.println("컨트롤러로 speakerMain 호출");
		return "productMain/speakerMain";
	}
	
//	speakerMain에서 게시글 입력시 오는 요청처리
	@RequestMapping("/basket")
	public String basket(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 basket 호출");
		String id = request.getParameter("id");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		MemberVO memberVO = ctx.getBean("memberVO", MemberVO.class);
		
		memberVO = mapper.memberView(id);
		ItemList itemList=ctx.getBean("itemList", ItemList.class);
		itemList.setList(mapper.selectWish(id));
		System.out.println(itemList.getList());
		model.addAttribute("itemList",itemList.getList());
		System.out.println(memberVO);
		System.out.println(id);
		model.addAttribute("memberVO", memberVO);
		
		return "basket";
	}

	@RequestMapping("/deleteWishItem")
	public String deleteWishItem(HttpServletRequest request, Model model, ItemVO itemVO) {
		System.out.println("컨트롤러로 deleteWishItem 호출");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		mapper.deleteWishItem(itemVO);
		
		model.addAttribute("id", itemVO.getId());
		
		return "redirect:basket";
	}
	
	
	

	
	@RequestMapping("/tab")
	public String tab() {
		System.out.println("tab 메소드 실행");
		return "tab";
	}
}

