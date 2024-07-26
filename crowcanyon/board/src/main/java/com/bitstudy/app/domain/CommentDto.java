package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class CommentDto {
    private Integer cno;
    private Integer bno;
    private String comment;
    private String commenter;
    private Date reg_date;

    public CommentDto() {}

    public CommentDto(Integer bno, String comment, String commenter) {
        this.bno = bno;
        this.comment = comment;
        this.commenter = commenter;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommenter() {
        return commenter;
    }

    public void setCommenter(String commenter) {
        this.commenter = commenter;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "Ex15_CommentDto{" +
                "commenter='" + commenter + '\'' +
                ", cno=" + cno +
                ", bno=" + bno +
                ", comment='" + comment + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
