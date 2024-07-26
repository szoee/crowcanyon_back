package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ListDto;

import java.util.List;

public interface ListDao {
    List<ListDto> getList(int list_cateno);

    ListDto getListOne(Integer list_seqno);

    List<ListDto> getListSearch(String search);
}
