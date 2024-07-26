package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CommentDto;

import java.util.List;

public interface CommentDao {
    int delete(Integer cno, String commenter);

    int count(Integer bno);

    List<CommentDto> selectAll(Integer bno);

    int insert(CommentDto commentDto);

    int update(CommentDto commentDto);
}
