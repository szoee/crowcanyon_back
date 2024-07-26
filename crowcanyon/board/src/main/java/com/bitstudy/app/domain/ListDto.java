package com.bitstudy.app.domain;

public class ListDto {
    private Integer list_seqno;
    private int list_no;
    private String list_img;
    private String list_name;
    private int list_s_price;
    private int list_o_price;
    private String list_desc;
    private String list_ex;
    private int list_cateno;


    public ListDto() {
    }

    public ListDto(Integer list_seqno, int list_no, String list_img, String list_name, int list_s_price, int list_o_price, String list_desc, String list_ex, int list_cateno) {
        this.list_seqno = list_seqno;
        this.list_no = list_no;
        this.list_img = list_img;
        this.list_name = list_name;
        this.list_s_price = list_s_price;
        this.list_o_price = list_o_price;
        this.list_desc = list_desc;
        this.list_ex = list_ex;
        this.list_cateno = list_cateno;
    }

    public Integer getList_seqno() {
        return list_seqno;
    }

    public void setList_seqno(Integer list_seqno) {
        this.list_seqno = list_seqno;
    }

    public int getList_no() {
        return list_no;
    }

    public void setList_no(int list_no) {
        this.list_no = list_no;
    }

    public String getList_img() {
        return list_img;
    }

    public void setList_img(String list_img) {
        this.list_img = list_img;
    }

    public String getList_name() {
        return list_name;
    }

    public void setList_name(String list_name) {
        this.list_name = list_name;
    }

    public int getList_s_price() {
        return list_s_price;
    }

    public void setList_s_price(int list_s_price) {
        this.list_s_price = list_s_price;
    }

    public int getList_o_price() {
        return list_o_price;
    }

    public void setList_o_price(int list_o_price) {
        this.list_o_price = list_o_price;
    }

    public String getList_desc() {
        return list_desc;
    }

    public void setList_desc(String list_desc) {
        this.list_desc = list_desc;
    }

    public String getList_ex() {
        return list_ex;
    }

    public void setList_ex(String list_ex) {
        this.list_ex = list_ex;
    }

    public int getList_cateno() {
        return list_cateno;
    }

    public void setList_cateno(int list_cateno) {
        this.list_cateno = list_cateno;
    }

    @Override
    public String toString() {
        return "ListDto{" +
                "list_seqno=" + list_seqno +
                ", list_no=" + list_no +
                ", list_img='" + list_img + '\'' +
                ", list_name='" + list_name + '\'' +
                ", list_s_price=" + list_s_price +
                ", list_o_price=" + list_o_price +
                ", list_desc='" + list_desc + '\'' +
                ", list_ex='" + list_ex + '\'' +
                ", list_cateno=" + list_cateno +
                '}';
    }
}
