package com.bitstudy.app.domain;

public class UserDto {
    private Integer user_seqno;
    private String user_id;
    private String user_pw;
    private String user_name;
    private String user_email;
    private String user_phone;
    private String user_address;

    public UserDto() {
    }

    public UserDto(Integer user_seqno, String user_id, String user_pw, String user_name, String user_email, String user_phone, String user_address) {
        this.user_seqno = user_seqno;
        this.user_id = user_id;
        this.user_pw = user_pw;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.user_address = user_address;
    }

    public Integer getUser_seqno() {
        return user_seqno;
    }

    public void setUser_seqno(Integer user_seqno) {
        this.user_seqno = user_seqno;
    }

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

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "user_seqno=" + user_seqno +
                ", user_id='" + user_id + '\'' +
                ", user_pw='" + user_pw + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_email='" + user_email + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_address='" + user_address + '\'' +
                '}';
    }
}
