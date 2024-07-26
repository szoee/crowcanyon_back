package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;

public interface UserDao {
    UserDto login(String user_id);

    int register(UserDto userDto);
}
