package com.bitstudy.app.service;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao UserDao;

    public UserDto login(String user_id) {
        return UserDao.login(user_id);
    }

    public int register(UserDto userDto) {
        return UserDao.register(userDto);
    }
}
