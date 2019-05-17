package org.fishcc.bbs.controller;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.fishcc.bbs.entity.Message;
import org.fishcc.bbs.entity.MyPage;
import org.fishcc.bbs.entity.User;
import org.fishcc.bbs.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
    @Resource(name="messageService")
    private MessageService messageService;
    
    @RequestMapping("/sendMessage.form")
    public String sendMessage(HttpServletRequest request, MyPage myPage, Message message) {
        myPage.setId(request.getParameter("id"));
        message.setId(UUID.randomUUID().toString());
        message.setUser((User)request.getSession().getAttribute("user"));
        message.setText(request.getParameter("text").trim());
        message.setMyPage(myPage);
        if(messageService.sendMessage(message))
            return "redirect:/myPage.form?id=" + myPage.getId();
        return "redirect:/myPage.form?id=" + myPage.getId();
    }
}
