package com.bitstudy.app.service;

import com.bitstudy.app.dao.BoardDao;
import com.bitstudy.app.dao.CommentDao;
import com.bitstudy.app.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentDao commentDao;

    public int remove(Integer cno, String commenter) {
        return commentDao.delete(cno, commenter);
    }


    public int write(CommentDto commentDto) {
        return commentDao.insert(commentDto);
    }

    // 댓글 리스트 불러오기
    public List<CommentDto> getList(Integer bno) {
        return commentDao.selectAll(bno);
    }

    public int count(Integer bno){
        return commentDao.count(bno);
    }

    // 댓글 수정
    public int modify(CommentDto commentDto) {
        return commentDao.update(commentDto);
    }


}
