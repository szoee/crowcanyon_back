package com.bitstudy.app.dao;

import com.bitstudy.app.domain.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    int count();

    BoardDto select(int bno);

    List<BoardDto> selectAll();

    List<BoardDto> selectPage(Map map);

    int delete(Integer bno, String writer);

    int deleteForAdmin(Integer bno);

    int insert(BoardDto dto);

    int update(BoardDto dto);

    int increaseViewCount(Integer bno);
}
