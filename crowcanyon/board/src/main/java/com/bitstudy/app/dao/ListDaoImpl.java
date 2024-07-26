package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ListDaoImpl implements ListDao {
    @Autowired
    SqlSession session;
    String namespace = "com.bitstudy.app.dao.ListMapper.";

    @Override
    public List<ListDto> getList(int list_cateno) {
        return session.selectList(namespace + "list", list_cateno);
    }

    @Override
    public ListDto getListOne(Integer list_seqno) {
        return session.selectOne(namespace + "listOne", list_seqno);
    }

    @Override
    public List<ListDto> getListSearch(String search) {
        return session.selectList(namespace + "listSearch", search);
    }
}
