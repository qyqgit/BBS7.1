package org.fishcc.bbs.service;

import java.util.List;

import javax.annotation.Resource;

import org.fishcc.bbs.dao.MessageDao;
import org.fishcc.bbs.dao.MyPageDao;
import org.fishcc.bbs.entity.Message;
import org.fishcc.bbs.entity.MyPage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service("messageService")
public class MessageServiceImpl implements MessageService {
    @Resource(name="messageDao")
    private MessageDao messageDao;
    @Resource(name="myPageDao")
    private MyPageDao myPageDao;

    @Transactional
    public boolean sendMessage(Message message) {
        // TODO Auto-generated method stub
        MyPage myPage = myPageDao.selectMyPageById(message.getMyPage().getId());
        message.setFloorNumber(Integer.parseInt(myPage.getMessageNumber()) + 1 + "");
        if(1 == messageDao.insertMessage(message)) {
            myPage.setMessageNumber(message.getFloorNumber());
            myPageDao.updateMyPage(myPage);
            return true;
        }
        return false;
    }

    public List<Message> getMessageListByPageId(String id) {
        // TODO Auto-generated method stub
        return messageDao.selectMessageListByPageId(id);
    }
}
