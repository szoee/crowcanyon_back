package com.bitstudy.app.controller;


import com.bitstudy.app.domain.BoardDto;
import com.bitstudy.app.domain.PageHandler;
import com.bitstudy.app.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class borderController {
    @Autowired
    BoardService boardService;

    /* 글 쓰기 - 폼 불러오기 */
    @GetMapping("/board/write")
    public String write(Model m) {
        m.addAttribute("mode","new");
        return "crowcanyon_board";
    }

    /* 글 쓰기 - DB에 저장 */
    @PostMapping("/board/write")
    public String write(BoardDto boardDto, HttpSession session ) {
        String currUserId = (String) session.getAttribute("id");

        boardDto.setWriter(currUserId);  //가져온 사용자 id를 작성자로 설정
        boardService.write(boardDto);   // boardDto에 담긴 데이터를 DB에 저장

        return "redirect:/board/list";
    }

    /* 수정 */
    @RequestMapping("/board/modify")
    public String modify(BoardDto boardDto, Integer page, Integer pageSize, Model m, HttpSession session) {
        String currUserId = (String) session.getAttribute("id");

        boardDto.setWriter(currUserId);
        boardService.modify(boardDto);

        return "redirect:/board/list?page="+page+"&pageSize="+pageSize;
    }

    /* 게시글 삭제 */
    @RequestMapping("/board/remove")
    public String remove(Integer bno, Integer page, Integer pageSize, HttpSession session) {
        String currUserId = (String) session.getAttribute("id");
        int rowCount = boardService.remove(bno, currUserId);

        if(rowCount == 1) { // 하나(해당 글) 지웠다는 뜻
            System.out.println("삭제했음");
        }
        else { // 해당 글이 없어서 못지웠다는 뜻
            System.out.println("삭제 못했음");
        }
        return "redirect:/board/list?page="+page+"&pageSize="+pageSize;
    }

    /* 게시글 하나만 읽기 (상세페이지) */
    @GetMapping("/board/read")
    public String read(Integer bno, Integer page, Integer pageSize, Model m ) { //
        BoardDto boardDto = boardService.read(bno);

        if(boardDto != null) { // 해당 게시글이 있을때
            m.addAttribute("boardDto", boardDto);

            // page랑 pageSize는 게시글 불러오는거랑 상관은 없지만, 목록으로 돌아갈때 다시 기존 페이지로 돌아가야 하기 때문에 정보를 boardList.jsp 에 다시 보내줘야 해서 필요함
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            return "crowcanyon_board";
        }
        else { // 해당 게시글이 없을때

        }

        return "crowcanyon_board";
    }

    /* 리스트 화면, 페이징 구현 */
    @GetMapping("/board/list")
    public String list(Integer page, Integer pageSize, Model m) {

        try {
            if(page == null) page=1;
            if(pageSize == null) pageSize=10;

            // 총 게시글 수 구하기 (221개)
            int totalCount = boardService.getCount();

            // 페이징 계산 (221 / (double)10)
            PageHandler pageHandler = new PageHandler(totalCount, page, pageSize);


            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize); // startPage
            map.put("pageSize", pageSize);


            List<BoardDto> list = boardService.getPage(map);

            m.addAttribute("list", list);
            m.addAttribute("ph",pageHandler);

            return "crowcanyon_boardList";
        } catch (Exception e) {
            System.out.println("에러났슈");
            throw new RuntimeException(e);
        }
    }

    /*/////////////////////////모바일 화면///////////////////////////////*/
    /*리스트 화면*/
    @GetMapping("/m.board/list")
    public String mList(Integer page, Integer pageSize, Model m) {
        try {
            if (page == null) page=1;
            if (pageSize == null) pageSize=10;
            int totalCount = boardService.getCount();
            PageHandler pageHandler = new PageHandler(totalCount, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<BoardDto> list = boardService.getPage(map);

            m.addAttribute("list", list);
            m.addAttribute("ph",pageHandler);
            return "m.crowcanyon_boardList";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /* 글쓰기 클릭*/
    @GetMapping("/m.board/write")
    public String mWrite(Model m) {
        m.addAttribute("mode","new");
        return "m.crowcanyon_board";
    }

    /*글쓰기 저장*/
    @PostMapping("/m.board/write")
    public String mWrite(BoardDto boardDto, HttpSession session) {
        String currUserId = (String) session.getAttribute("id");
        boardDto.setWriter(currUserId);
        boardService.write(boardDto);
        return "redirect:/m.board/list";
    }
    /* 수정 */
    @RequestMapping("/m.board/modify")
    public String mModify(BoardDto boardDto, Integer page, Integer pageSize, Model m, HttpSession session) {
        String currUserId = (String) session.getAttribute("id");
        boardDto.setWriter(currUserId);
        boardService.modify(boardDto);
        return "redirect:/m.board/list?page="+page+"&pageSize="+pageSize;
    }
    /*삭제*/
    @RequestMapping("/m.board/remove")
    public String mRemove(Integer bno, Integer page, Integer pageSize, HttpSession session) {
        String currUserId = (String) session.getAttribute("id");
        int rowCount = boardService.remove(bno, currUserId);

        if(rowCount == 1) {
            System.out.println("삭제했음");
        }
        else {
            System.out.println("삭제 못했음");
        }
        return "redirect:/m.board/list?page="+page+"&pageSize="+pageSize;
    }
    /*상세읽기*/
    @GetMapping("/m.board/read")
    public String mRead(Integer bno, Integer page, Integer pageSize, Model m) {
        BoardDto boardDto = boardService.read(bno);
        if(boardDto != null) {
            m.addAttribute("boardDto", boardDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            return "m.crowcanyon_board";
        }
        else {

        }
        return "m.crowcanyon_board";
    }



    private boolean loginChk(HttpSession session) {
        return session.getAttribute("id") != null;

    }
}
