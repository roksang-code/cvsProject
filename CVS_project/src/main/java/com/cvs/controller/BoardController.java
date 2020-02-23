package com.cvs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;
import com.cvs.model.Functionkey_infoVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.PageMaker;
import com.cvs.model.Pos_boardVO;
import com.cvs.service.BoardService;

@Controller
@RequestMapping("/admin")
public class BoardController {
	
		@Autowired
		private BoardService bservice;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	
	
	
		@RequestMapping(value = "/adminMain", method = RequestMethod.GET)//로그인 화면
		public void adminMainGet() throws Exception {
	
			logger.info("adminMain get...");
			

		}@RequestMapping(value = "/adminMain", method = RequestMethod.POST)//로그인 화면
		public void adminMainPOST() throws Exception {
	
			logger.info("adminMain get...");
			
		}
			
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String registGet(String type, Criteria cri, Model model) throws Exception {
			logger.info("regist get...");
			
		    model.addAttribute("type", type); 
		    model.addAttribute("cri", cri);
			
			return "admin/adminMain";
		}
	
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String registPost(BoardVO board, @RequestParam(value = "files", required = false) MultipartFile files) throws Exception {
			logger.info("regist Post" + board);
			
			logger.info("files = "+board.getFiles());
			bservice.boardWrite(board);
			 
			return "redirect:/admin/adminMain";
		}
	
		@RequestMapping(value = "/detail", method = RequestMethod.GET)
		public String detailGet(@RequestParam("no") int no, String type, Criteria cri, Model model) throws Exception {
			logger.info("detail get...");
			bservice.boardCnt(no);

			System.out.println(cri.getKeyword());
			System.out.println(cri.getPageNum());
			
			model.addAttribute(bservice.boardDetail(no));
		    model.addAttribute("type", type); 
			model.addAttribute("cri", cri);
			
			return "admin/adminMain";

		}
	
	
	
		
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String updatePost(@RequestParam("no") int no, BoardVO board, Criteria cri,  Model model) throws Exception {
			logger.info("update Post..." + board);
	
			bservice.boardUpdate(board);
			bservice.listCriteria(cri);
			model.addAttribute("cri", cri);
			model.addAttribute("no", no);
			
			return "redirect:/admin/detail";
			
			
		}
	
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deletePost(BoardVO board, Criteria cri,  Model model, RedirectAttributes redirectAttributes) throws Exception {
			logger.info("delete Post..." + board);
			bservice.boardDelete(board);
			
			redirectAttributes.addAttribute("no", board.getNo());
			
			redirectAttributes.addAttribute("pageNum", cri.getPageNum());
			redirectAttributes.addAttribute("keyword", cri.getKeyword());
			return "redirect:/admin/list";
		}

	
		
		@RequestMapping(value = "/list", method = RequestMethod.GET) 
		public void listGet(Criteria cri, Model model) throws Exception{
			 logger.info("page = "+cri.getPageNum()+" key = "+cri.getKeyword());
			  
			  
			  
			 PageMaker pageMaker = new PageMaker(cri, bservice.listCountCriteria(cri)); 
			 model.addAttribute("list", bservice.listCriteria(cri)); 
			  
			  
			  
			  
			  model.addAttribute("pageMaker", pageMaker);
			 
		  
		  }
		  
		 @RequestMapping(value = "/list", method = RequestMethod.POST) 
		 public void listPOST(Criteria cri, Model model) throws Exception{
			  logger.info("page = "+cri.getPageNum()+" key = "+cri.getKeyword());
			  
			  PageMaker pageMaker = new PageMaker(cri, bservice.listCountCriteria(cri)); 
			  model.addAttribute("list", bservice.listCriteria(cri)); 
			  
			  
			  
			  
			  model.addAttribute("pageMaker", pageMaker);
		 
		  
		 }
		  
		 
			  
		 @RequestMapping(value = "/replyboard",  method = RequestMethod.GET) 
		 public void replyGET() throws Exception{
			  
		 }
		
			
		@ResponseBody
		@RequestMapping(value = "/approval_list", method = RequestMethod.GET)//발주승인 리스트
		public ResponseEntity<List<Md_infoVO>> approval_list(Md_infoVO mdvo) throws Exception {
				
				ResponseEntity<List<Md_infoVO>> entity = null;
				logger.info("approval_list GET...");
				List<Md_infoVO> approval_list = bservice.approval_list(mdvo);

				
				
				entity = new ResponseEntity<List<Md_infoVO>>(approval_list, HttpStatus.OK);

				logger.info("approval_list entity = "+entity.toString());
				
				return entity;
		}
			
		@ResponseBody
		@RequestMapping(value = "/approval_detail_list", method = RequestMethod.GET)//발주승인 세부리스트
		public ResponseEntity<List<Md_infoVO>> approval_detail_list(@RequestParam int member_no, Md_infoVO mdvo) throws Exception {
				
				ResponseEntity<List<Md_infoVO>> entity = null;
				logger.info("approval_detail_list GET...");
				List<Md_infoVO> approval_list = bservice.approval_detail_list(member_no);

				
				
				entity = new ResponseEntity<List<Md_infoVO>>(approval_list, HttpStatus.OK);

				logger.info("approval_detail_list entity = "+entity.toString());
				
				return entity;
		}

		@ResponseBody
		@RequestMapping(value = "/order_approval_check/{barcode_no}/{member_no}", method = RequestMethod.DELETE)//발주 승인 체크
		public void order_approval_check(@PathVariable String barcode_no, @PathVariable int member_no,  Md_infoVO mdvo) throws Exception {

			if(barcode_no.equals("0")){
				barcode_no="";
			}
			logger.info("order_approval_check get...");
			logger.info("barcode_no = "+barcode_no);
			logger.info("member_no = "+member_no);
			logger.info("mdvo = "+mdvo);

			bservice.order_approval_check(barcode_no, member_no);
			
			
		}
		
		
		
	}