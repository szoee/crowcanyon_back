package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.domain.UserLoginDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.net.URLEncoder;

import static java.lang.System.out;

@Controller
public class LoginController {

    @Autowired
    UserDao userDao;

    @GetMapping("/login")
    public String login() {
        return "crowcanyon_login";
    }

    @GetMapping("/m.login")
    public String mLogin() {
        return "m.crowcanyon_login";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  //로그아웃하면 세션 삭제
        return "redirect:/";
    }

    @GetMapping("/m.logout")
    public String mLogout(HttpSession session) {
        session.invalidate();  //로그아웃하면 세션 삭제
        return "redirect:/m";
    }


    @PostMapping("/login")
    public String login(UserLoginDto userLoginDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 유효성 검사 - 서버에 현재 받은 id , pw 가 있는지
        String id = userLoginDto.getUser_id();
        String pw = userLoginDto.getUser_pw();
        boolean rememberId = userLoginDto.isRememberId();

        // 2) 회원이 아니거나 비밀번호가 틀린 경우
        if(!loginChk(id, pw)) {
            String msg = URLEncoder.encode("일치하는 회원정보가 없습니다.", "UTF-8");

            PrintWriter out = response.getWriter();
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
            out.println("history.go(-1); </script>");
            out.close();
            return "redirect:/login?msg="+msg;
        }

        // 2) 회원인 경우
        // 쿠키생성
        Cookie cookie = new Cookie("id", id);
        if(!rememberId) { // '아이디 기억' 체크 안 했을때 (쿠키 바로 삭제)
            cookie.setMaxAge(0);
        }
        response.addCookie(cookie); //체크 했을 때 (사용자에게 보내기) > 상태 유지

        // 세션생성
        HttpSession session = request.getSession(); // 세션 객체 얻어오기 (세션 준비)
        session.setAttribute("id", id); // 세션 객체에 userId 라는 키로 id값 저장

        // prevPage가 있으면 해당 페이지로 이동, 비어있으면 메인페이지로 이동
        String prevPage = String.valueOf(session.getAttribute("prevPage")); // /board/list
        return "redirect:"+(("null".equals(prevPage))?"/":prevPage);
    }


    @PostMapping("/m.login")
    public String mLogin(UserLoginDto userLoginDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = userLoginDto.getUser_id();
        String pw = userLoginDto.getUser_pw();
        boolean rememberId = userLoginDto.isRememberId();

        if(!loginChk(id, pw)) {
            String msg = URLEncoder.encode("일치하는 회원정보가 없습니다.", "UTF-8");

            PrintWriter out = response.getWriter();
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
            out.println("history.go(-1); </script>");
            out.close();
            return "redirect:/m.login?msg="+msg;
        }

        Cookie cookie = new Cookie("id", id);
        if(!rememberId) {
            cookie.setMaxAge(0);
        }
        response.addCookie(cookie);

        HttpSession session = request.getSession();
        session.setAttribute("id", id);

        return "redirect:/m";
    }


    // 1) id,pw 를 DB에 보내서 해당 정보가 있냐 없냐 판별
    private boolean loginChk(String id, String pw) {
        UserDto userDto = userDao.login(id);
        out.println("userDto:" + userDto);
        if(userDto == null) return false;

        return userDto.getUser_pw().equals(pw); // 사용자가 입력한 비번과 DB에 비번 비교 (T/F)
    }



}