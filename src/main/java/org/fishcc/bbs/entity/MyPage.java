package org.fishcc.bbs.entity;

import java.io.Serializable;

public class MyPage implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    private String id;
    private String title;
    private String text;
    private User user;
    private String timeStamp;
    private String createDate;
    private String messageNumber;
    private String invalid;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getTimeStamp() {
        return timeStamp;
    }
    public void setTimeStamp(String date) {
        this.timeStamp = date;
    }
    public String getCreateDate() {
        return createDate;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public String getMessageNumber() {
        return messageNumber;
    }
    public void setMessageNumber(String messageNumber) {
        this.messageNumber = messageNumber;
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
        return "MyPage [id=" + id + ", title=" + title + ", text=" + text + ", user=" + user + ", date=" + timeStamp
                + ", createDate=" + createDate + ", messageNumber=" + messageNumber + ", invalid=" + invalid + "]";
    }
    
}
