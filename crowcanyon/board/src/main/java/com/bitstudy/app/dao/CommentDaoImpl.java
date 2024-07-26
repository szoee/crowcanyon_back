package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommentDaoImpl implements CommentDao {
    @Autowired
    SqlSession session;
    String namespace = "com.bitstudy.app.mapper.CommentMapper.";

    @Override
    public int delete(Integer cno, String commenter) {
        Map map = new HashMap();
        map.put("cno",cno);
        map.put("commenter",commenter);

        return session.delete(namespace+"delete", map);
    }

    @Override
    public int count(Integer bno) {
        return session.selectOne(namespace+"count", bno);
    }

    @Override
    public List<CommentDto> selectAll(Integer bno) {
        return session.selectList(namespace+"selectAll", bno);
    }

    @Override
    public int insert(CommentDto commentDto) {
        return session.insert(namespace+"insert", commentDto);
    }

    @Override
    public int update(CommentDto commentDto) {
        return session.update(namespace+"update", commentDto);
    }

}
