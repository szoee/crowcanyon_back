package com.bitstudy.app.controller;

import com.bitstudy.app.domain.CommentDto;
import com.bitstudy.app.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    CommentService service;

    // 해당 게시글의 모든 댓글 불러오기
    @GetMapping("/comments")
    @ResponseBody
    public ResponseEntity<List<CommentDto>> list(Integer bno) {
        // ResponseEntity: 응답이나 요청시 전송할 정보를 보낼 대상에 임의의 상태코드를 보낼수 있음
        try {
            List<CommentDto> list = service.getList(bno);
            return new ResponseEntity<List<CommentDto>> (list, HttpStatus.OK);// 200

        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>> (HttpStatus.BAD_REQUEST);// 400
        }
    }


    /* 댓글 등록 */
    @PostMapping("/comments")
//    @ResponseBody
    public ResponseEntity<String> write(@RequestBody CommentDto commentDto, Integer bno, HttpSession session) {
        try {
            String commenter = (String) session.getAttribute("id");
            commentDto.setCommenter(commenter);
            commentDto.setBno(commentDto.getBno());
            if(service.write(commentDto) != 1) {
                throw new Exception("실패");
            }
            System.out.println("commentDto: " + commentDto);

//            return new ResponseEntity<String> ("댓글 등록 성공", HttpStatus.OK); // 200

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type","text/html; charset=UTF-8");

            return new ResponseEntity<String> ("댓글 등록 성공", responseHeader, HttpStatus.OK);// 200

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> (HttpStatus.BAD_REQUEST);// 400
        }
    }

    /* 댓글 수정 - comment.jsp 에서 댓글 '등록' 누르고 온거 */
    @PatchMapping("/comments/{cno}")
    public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto commentDto, HttpSession session) {
        try {
            String commenter = (String) session.getAttribute("id");

            commentDto.setCommenter(commenter);
            commentDto.setCno(cno);

            if(service.modify(commentDto) != 1) {
                throw new Exception("실패");
            }
//            return new ResponseEntity<String> ("댓글 등록 성공", HttpStatus.OK);// 200

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type","text/html; charset=UTF-8");

            return new ResponseEntity<String> ("댓글 수정 성공", responseHeader, HttpStatus.OK);// 200

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> (HttpStatus.BAD_REQUEST);// 400
        }
    }


    /* 댓글 삭제 */
    @DeleteMapping("/comments/{cno}")
    public ResponseEntity<String> remove(@PathVariable Integer cno, CommentDto commentDto, HttpSession session) {
        try {
            String commenter = (String) session.getAttribute("id");
            System.out.println(commentDto.getBno()+", " + cno+","+commenter);
            System.out.println("commentDto: " + commentDto);
            if(service.remove(cno, commenter) != 1) {
                throw new Exception("실패");
            }

//            return new ResponseEntity<String> ("댓글 등록 성공", HttpStatus.OK);// 200

            HttpHeaders responseHeader = new HttpHeaders();
            responseHeader.add("content-type","text/html; charset=UTF-8");

            return new ResponseEntity<String> ("댓글 삭제 성공", responseHeader, HttpStatus.OK);// 200

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> (HttpStatus.BAD_REQUEST);// 400
        }
    }

}