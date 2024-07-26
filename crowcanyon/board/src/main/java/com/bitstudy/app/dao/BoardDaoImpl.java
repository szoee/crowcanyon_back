package com.bitstudy.app.dao;

import com.bitstudy.app.domain.BoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDaoImpl implements BoardDao {
    @Autowired
    SqlSession session;

    String namespace = "com.bitstudy.app.mapper.BoardMapper.";

    @Override
    public int count() {
        return session.selectOne(namespace+"count");
    }

    @Override
    public BoardDto select(int bno) {
        return session.selectOne(namespace+"select", bno);
    }


    @Override
    public List<BoardDto> selectAll() {
        return session.selectList(namespace+"selectAll");
    }


    @Override
    public List<BoardDto> selectPage(Map map) {
        return session.selectList(namespace+"selectPage", map);
    }


    @Override
    public int delete(Integer bno, String writer) {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);

        return session.delete(namespace+"delete", map);
    }

    @Override
    public int deleteForAdmin(Integer bno) {
        return session.delete(namespace+"deleteForAdmin", bno);
    }

    @Override
    public int insert(BoardDto dto) {
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public int update(BoardDto dto) {
        return session.update(namespace+"update", dto);
    }

    @Override
    public int increaseViewCount(Integer bno) {
        return session.update(namespace+"increaseViewCount", bno);
    }


}
