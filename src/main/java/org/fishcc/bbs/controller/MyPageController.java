package org.fishcc.bbs.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.fishcc.bbs.entity.Message;
import org.fishcc.bbs.entity.MyPage;
import org.fishcc.bbs.entity.User;
import org.fishcc.bbs.service.MessageService;
import org.fishcc.bbs.service.MyPageService;
import org.fishcc.bbs.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
    @Resource(name="myPage")
    private MyPage myPage;
    @Resource(name="myPageService")
    private MyPageService myPageService;
    @Resource(name="messageService")
    private MessageService messageService;
    @Resource(name="userService")
    private UserService userService;
    
    @RequestMapping("/index.form")
    public String index(HttpServletRequest request) {
        request.setAttribute("myPageList", myPageService.getMyPageList());
        request.setAttribute("lastSendMessageUserList", userService.getLastSendMessageUserList());
        return "index.jsp";
    }
    @RequestMapping("/sendMyPage.form")
    public String sendMyPage(HttpServletRequest request) {
        myPage.setId(UUID.randomUUID().toString());
        myPage.setTitle(request.getParameter("title").trim());
        myPage.setText(request.getParameter("text").trim());
        myPage.setUser((User)request.getSession().getAttribute("user"));
        if(myPageService.sendMyPage(myPage))
            return "redirect:index.form";
        return "redirect:index.form";
    }
    @RequestMapping("/myPage.form")
    public String myPage(HttpServletRequest request) {
        MyPage myPage = myPageService.getMyPageById(request.getParameter("id"));
        List<Message> messageList = messageService.getMessageListByPageId(myPage.getId());
        request.setAttribute("myPage", myPage);
        request.setAttribute("messageList", messageList);
        return "MyPage.jsp";
    }
}
