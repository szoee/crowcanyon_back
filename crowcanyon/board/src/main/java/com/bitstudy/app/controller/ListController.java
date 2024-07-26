package com.bitstudy.app.controller;

import com.bitstudy.app.domain.ListDto;
import com.bitstudy.app.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ListController {
    @Autowired
    ListService listService;

    @GetMapping("/list")
    public String list(@RequestParam("list_cateno") int list_cateno, Model m) {
        List<ListDto> list = listService.List(list_cateno);

        m.addAttribute("list", list);

        return "crowcanyon_2";
    }

    @GetMapping("/m.list")
    public String m(@RequestParam("list_cateno") int list_cateno, Model m) {
        List<ListDto> list = listService.List(list_cateno);
        m.addAttribute("list", list);

        return "m.crowcanyon_2";
    }

    @GetMapping("/list/detail")
    public String detail(@RequestParam("list_seqno") Integer list_seqno, Model m) {
        ListDto ListDto = listService.ListOne(list_seqno);
        m.addAttribute("ListDto", ListDto);

        return "crowcanyon_3";
    }

    @GetMapping("/list/m.detail")
    public String m_detail(@RequestParam("list_seqno") Integer list_seqno, Model m) {
        ListDto ListDto = listService.ListOne(list_seqno);
        m.addAttribute("ListDto", ListDto);

        return "m.crowcanyon_3";
    }

    @GetMapping("/list/search")
    public String search(@RequestParam String search, Model model) {
        List<ListDto> list = listService.ListSearch(search);
        model.addAttribute("list", list);
        return "crowcanyon_2"; // 검색 결과를 표시할 뷰의 이름
    }

    @GetMapping("/list/m.search")
    public String mSearch(@RequestParam String search, Model model) {
        List<ListDto> list = listService.ListSearch(search);
        model.addAttribute("list", list);
        return "m.crowcanyon_2"; // 검색 결과를 표시할 뷰의 이름
    }
}

