package com.bitstudy.app.service;

import com.bitstudy.app.dao.ListDao;
import com.bitstudy.app.domain.ListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListService {
    @Autowired
    private ListDao ListDao;

    public List<ListDto> List(int list_cateno) {
        return ListDao.getList(list_cateno);
    }

    public ListDto ListOne(Integer list_seqno) {
        return ListDao.getListOne(list_seqno);
    }

    public List<ListDto> ListSearch(String search) {
        return ListDao.getListSearch(search);
    }
}
