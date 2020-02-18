package com.cvs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;
import com.cvs.model.PageMaker;
import com.cvs.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
		@Autowired
		private BoardService bservice;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	
	
	
		@RequestMapping(value = "/adminMain", method = RequestMethod.GET)//로그인 화면
		public void adminMainGet() throws Exception {
	
			logger.info("adminMain get...");
	
		}
			
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String registGet() throws Exception {
			logger.info("regist get...");
			
			return "board/write";
		}
	
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String registPost(BoardVO board) throws Exception {
			logger.info("regist Post..." + board);
			
			logger.info("files = "+board.getFiles());
			bservice.boardWrite(board);
			
			return "redirect:/board/list";
		}
	
		@RequestMapping(value = "/detail", method = RequestMethod.GET)
		public void detailGet(@RequestParam("no") int no, Criteria cri, Model model) throws Exception {
			logger.info("detail get...");
			bservice.boardCnt(no);
			
			System.out.println(cri.getKeyword());
			System.out.println(cri.getPageNum());
			
			model.addAttribute(bservice.boardDetail(no));
			model.addAttribute("cri", cri);
			
			
		}
	
	
	
		
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String updatePost(@RequestParam("no") int no, BoardVO board, Criteria cri,  Model model) throws Exception {
			logger.info("update Post..." + board);
	
			bservice.boardUpdate(board);
			bservice.listCriteria(cri);
			model.addAttribute("cri", cri);
			model.addAttribute("no", no);
			
			return "redirect:/board/detail";
			
			
		}
	
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deletePost(BoardVO board, Criteria cri,  Model model, RedirectAttributes redirectAttributes) throws Exception {
			logger.info("delete Post..." + board);
			bservice.boardDelete(board);
			
			redirectAttributes.addAttribute("no", board.getNo());
			
			redirectAttributes.addAttribute("pageNum", cri.getPageNum());
			redirectAttributes.addAttribute("keyword", cri.getKeyword());
			return "redirect:/board/list";
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
		
	
		
	}