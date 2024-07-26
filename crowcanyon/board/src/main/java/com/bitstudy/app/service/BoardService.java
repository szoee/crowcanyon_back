package com.bitstudy.app.service;

import com.bitstudy.app.dao.BoardDao;
import com.bitstudy.app.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardDao boardDao;

    public int getCount() {
        return boardDao.count();
    }

    public BoardDto read(Integer bno) {
        BoardDto dto = boardDao.select(bno); // 게시글 1개 가져오기
        boardDao.increaseViewCount(bno);// 조회수 증가

        return dto;
    }

    public List<BoardDto> getList() {
        return boardDao.selectAll();
    }

    public List<BoardDto> getPage(Map map) {
        return boardDao.selectPage(map);
    }

    public int remove(Integer bno, String writer) {
        return boardDao.delete(bno, writer);
    }

    public int write(BoardDto dto) {
        return boardDao.insert(dto);
    }

    public int modify(BoardDto dto) {
        return boardDao.update(dto);
    }
}
