package com.rental.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rental.dao.BoardDao;
import com.rental.model.Board;
import com.rental.model.Content;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	public Log log = LogFactory.getLog(BoardController.class);
	
	@Autowired
	BoardDao boardDao;
	
//	@Resource
//	private FileManager fileManager;

	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String board() {
		
		return "board/board";
	}
	
	@RequestMapping(value="/previousPage", method=RequestMethod.GET)
	public String previousPage(HttpServletRequest request, HttpSession session) {
		
		Integer curPage = Integer.parseInt(request.getParameter("curPage"));
		Integer group = (curPage + 4) / 5 ;
		if (group == 1) {
			return null;
		} 
		else {
			session.setAttribute("page", (group * 5) - 9);
			return "board/previousPage";
		}
	}

	@RequestMapping(value="/nextPage", method=RequestMethod.GET)
	public String nextPage(HttpServletRequest request, HttpSession session) {
		Integer lastPage;
		
		if (boardDao.getBoardCount() % 10 == 0) {
			lastPage = (boardDao.getBoardCount()) / 10;
		} else {
			lastPage = ((boardDao.getBoardCount()) / 10) + 1;
		}
		
		Integer curPage = Integer.parseInt(request.getParameter("curPage"));
		Integer group = (curPage + 4) / 5;
		Integer lastGroup = (lastPage + 4) / 5;
		if (group == lastGroup) {
			return null;
		} else {
			session.setAttribute("page", (group * 5) + 1);
			return "board/nextPage";
		}
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list() {
		
		return "board/list";
	}
	
	@RequestMapping(value="/count", method=RequestMethod.GET)
	public String count(HttpServletRequest request, HttpSession session) {
		
			try {
			
		    Board board = boardDao.getContentInfo(Integer.parseInt(request.getParameter("idx")));

			String regip = request.getRemoteAddr();
			
			if (!regip.equals(board.getRegip())) {
				int count = board.getCount();
				count++;
				board.setCount(count);
				
				boardDao.addCount(board);
			}
			}catch (Exception e) {
			 
			log.info("############ Oracle Database Connection Something Problem ############");

		    log.info(e.getMessage());

		    e.printStackTrace();

		}
			
		request.setAttribute("url", "content?idx="+request.getParameter("idx"));
		
		return "board/redirectContent";
	}
	
	@RequestMapping(value="/list_test", method=RequestMethod.GET)
	public String indexGET(HttpServletRequest request, HttpSession session) {
			
		try {
			
			Content content = new Content();
			
			content.setFirstContent(((Integer.parseInt(request.getParameter("page"))-1) * 10) + 1);
		    
			content.setCount(boardDao.getBoardCount());
			
			List<Board> list = boardDao.getBoardInfo(content);

			request.setAttribute("list", list); // 셋팅된 리스트를 뷰에 포워드합니다.
			
			session.setAttribute("curPage", Integer.parseInt(request.getParameter("page")));
			
			Integer curPage = Integer.parseInt(request.getParameter("page"));
			
			Integer group = (curPage + 4) / 5;
			
			Integer lastPage;
			
			if (boardDao.getBoardCount() % 10 == 0) {
				lastPage = (boardDao.getBoardCount()) / 10;
			} else {
				lastPage = ((boardDao.getBoardCount()) / 10) + 1;
			}
			
			session.setAttribute("lastPage", lastPage);
			
			if (group == 1) {
				session.setAttribute("startOfGroup", group);
				session.setAttribute("endOfGroup", group + 4);
			} 
			else {
				session.setAttribute("startOfGroup", (group * 5) - 4);
				session.setAttribute("endOfGroup", ((group * 5) - 4) + 4);
			}
			
			}catch (Exception e) {
			 
//			log.info("############ Oracle Database Connection Something Problem ############");

		    log.info(e.getMessage());

		    e.printStackTrace();

		}
		 
		return "board/list_test";
	}
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String indexGET() {
		
		return "board/index";
	}
	
	@RequestMapping(value="/path", method=RequestMethod.GET)
	@ResponseBody
	public String path(HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("/");
		
		return path;
	}
	
	@RequestMapping(value="/index", method=RequestMethod.POST)
	public String indexPOST() {
		
		return "board/index";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() {
		
		return "board/write";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(HttpServletRequest request, HttpSession session,
			@RequestParam("uploadFile")MultipartFile multipartFile, Model model) 
					throws IllegalStateException, IOException {
		
		Board board = new Board();
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setCount(0);
		board.setContent(request.getParameter("content"));
		board.setRegip(request.getRemoteAddr());
		
		if (!multipartFile.isEmpty()) {
			File file = new File("C:\\temp", board.getWriter() + "_" + multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			model.addAttribute("title", board.getTitle());
			model.addAttribute("fileName", multipartFile.getOriginalFilename()+ "_" +board.getWriter());
			model.addAttribute("uploadPath", file.getAbsolutePath());
		}
		

//############################### 유효성검사 차후 구현 ###############################		
//		if(title == "" ||title == null) out.println("title이 null입니다.");
//		 
//		if(writer == "" ||writer == null)
//		    out.println("writer가 null입니다.");   
//		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
//		    out.println("이메일 형식이 아닙니다.");
//		 
//		if(content == "" ||content == null) out.println("content가 null입니다.");
		
		try {
			
		    boardDao.insertContent(board);

			}catch (Exception e) {
			 
		    log.info("############ Oracle Database Connection Something Problem ############");

		    log.info(e.getMessage());

		    e.printStackTrace();

		}
		
		return "board/insert";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(HttpServletRequest request, HttpSession session) {
		
		try {
			
		    Board board = boardDao.getContentInfo(Integer.parseInt(request.getParameter("idx")));

			request.setAttribute("board", board); // 셋팅된 리스트를 뷰에 포워드합니다.
			
			
			}catch (Exception e) {
			 
			log.info("############ Oracle Database Connection Something Problem ############");

		    log.info(e.getMessage());

		    e.printStackTrace();

		}
		
		return "board/content";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpSession session) {
		
		try {
		boardDao.deleteContent(Integer.parseInt(request.getParameter("idx")));

		}catch (Exception e) {
		 
		log.info("############ Oracle Database Connection Something Problem ############");

	    log.info(e.getMessage());

	    e.printStackTrace();

	}
		
		return "board/delete";
	}
	
	@RequestMapping(value="/redirect", method=RequestMethod.GET)
	public String redirect() {
		
		return "board/redirect";
	}
}
