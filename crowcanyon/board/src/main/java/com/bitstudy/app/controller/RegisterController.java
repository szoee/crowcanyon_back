package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.net.URLEncoder;
import static java.lang.System.out;

@Controller
public class RegisterController {
    @Autowired
    UserDao userDao;

    @GetMapping("/register/join")
    public String loginForm() {
        return "crowcanyon_register";
    }

    @GetMapping("/m.register/join")
    public String mLoginForm() {
        return "m.crowcanyon_register";
    }

    @PostMapping("/register/save")
    public String save(UserDto userDto, HttpServletResponse response) throws Exception {

        if(userDao.login(userDto.getUser_id()) != null) { // null 이면 사용 가능, 아니면 이미 사용중인 아이디
            String msg = URLEncoder.encode("이미 사용중인 아이디 입니다.", "UTF-8");

            PrintWriter out = response.getWriter();
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            out.println("<script> alert('이미 사용중인 아이디입니다.');");
            out.println("history.go(-1); </script>");
            out.close();
            return "redirect:/register/join?msg="+msg;
        }
        userDao.register(userDto);

        return "redirect:/login";
    }

    @PostMapping("/m.register/save")
    public String mSave(UserDto userDto) throws Exception {

        if(userDao.login(userDto.getUser_id()) != null) { // null 이면 사용 가능, 아니면 이미 사용중인 아이디
            String msg = URLEncoder.encode("이미 사용중인 아이디 입니다..", "UTF-8");
            return "redirect:/register/join?msg="+msg;
        }
        userDao.register(userDto);

        return "redirect:/m.login";
    }
}
