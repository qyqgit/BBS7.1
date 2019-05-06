package org.fishcc.bbs.dao;

import java.util.List;

import org.fishcc.bbs.entity.Message;

public interface MessageDao {
    public int insertMessage(Message message);
    public int deleteMessage(String id);
    public int updateMessage(Message message);
    public Message selectMessageById(String id);
    public List<Message> selectMessageListByPageId(String id);
}
