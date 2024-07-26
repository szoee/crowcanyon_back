package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    SqlSession session;
    String namespace = "com.bitstudy.app.mapper.UserMapper.";

    @Override
    public UserDto login(String user_id){return session.selectOne(namespace+"login", user_id);}

    @Override
    public int register(UserDto userDto){return session.insert(namespace+"register", userDto);}
}
