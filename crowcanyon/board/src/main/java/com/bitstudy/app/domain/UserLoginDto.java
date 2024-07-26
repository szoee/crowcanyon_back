package com.bitstudy.app.domain;

public class UserLoginDto {
    private String user_id;
    private String user_pw;
    private boolean rememberId;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_pw() {
        return user_pw;
    }

    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }

    public boolean isRememberId() {
        return rememberId;
    }

    public void setRememberId(boolean rememberId) {
        this.rememberId = rememberId;
    }

    @Override
    public String toString() {
        return "UserLoginDto{" +
                "user_id='" + user_id + '\'' +
                ", user_pw='" + user_pw + '\'' +
                ", rememberId=" + rememberId +
                '}';
    }
}
