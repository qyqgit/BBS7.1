package org.fishcc.bbs.service;

import java.util.List;

import org.fishcc.bbs.entity.Message;

public interface MessageService {
    public boolean sendMessage(Message message);
    public List<Message> getMessageListByPageId(String id); 
}
