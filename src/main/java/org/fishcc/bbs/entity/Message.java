package org.fishcc.bbs.entity;

import java.io.Serializable;

public class Message implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private String id;
    private String replyId;
    private String date;
    private User user;
    private String text;
    private MyPage myPage;
    private String floorNumber;
    private String read;
    private String invalid;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getReplyId() {
        return replyId;
    }
    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public MyPage getMyPage() {
        return myPage;
    }
    public void setMyPage(MyPage myPage) {
        this.myPage = myPage;
    }
    public String getFloorNumber() {
        return floorNumber;
    }
    public void setFloorNumber(String floorNumber) {
        this.floorNumber = floorNumber;
    }
    public String getRead() {
        return read;
    }
    public void setRead(String read) {
        this.read = read;
    }
    public String getInvalid() {
        return invalid;
    }
    public void setInvalid(String invalid) {
        this.invalid = invalid;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    @Override
    public String toString() {
        return "Message [id=" + id + ", replyId=" + replyId + ", date=" + date + ", user=" + user + ", text=" + text
                + ", myPage=" + myPage + ", floorNumber=" + floorNumber + ", read=" + read + ", invalid=" + invalid
                + "]";
    }
    

}
