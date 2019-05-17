package org.fishcc.bbs.controller;

import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fishcc.bbs.entity.User;
import org.fishcc.bbs.service.UserService;
import org.fishcc.bbs.exception.UserLoginException;
import org.fishcc.bbs.exception.UserRegisterException;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @Resource(name="userService")
    private UserService userService;
    
    @RequestMapping("/register.form")
    public String registerUser(HttpServletRequest request, User user) {
        user.setId(UUID.randomUUID().toString());
        user.setName(request.getParameter("name").trim());
        user.setPassword(DigestUtils.md5DigestAsHex(request.getParameter("password").getBytes()));
        user.setAge(request.getParameter("birthday"));
        user.setSex(request.getParameter("sex"));
        if(userService.registerUser(user)) 
            return "redirect:Login.jsp";
        return "redirect:Register.jsp";
    }
    @RequestMapping("/alreadyRegister.form")
    public void alreadyRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userService.alreadyRegister(request.getParameter("name"));
        response.setContentType("text/html;charset=utf-8");
        if(userService.alreadyRegister(request.getParameter("name")))
            response.getWriter().println("already registered!");
    }
    @RequestMapping("/login.form")
    public String login(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
        user.setName(request.getParameter("name").trim());
        user.setPassword(DigestUtils.md5DigestAsHex(request.getParameter("password").getBytes()));
        if(userService.loginSuccess(user)) {
            user = userService.getUserByName(user.getName());
            request.getSession().setAttribute("user", user);
            return "redirect:index.form";
        }
        return "redirect:Login.jsp";
    }
    @RequestMapping("/logout.form")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("user") != null) {
            request.getSession().removeAttribute("user");
            return "redirect:index.form";
        }
        return "redirect:index.form";
    }
    @RequestMapping("/home.form")
    public String home(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setAttribute("user", userService.getUserById(request.getParameter("id")));
        return "Home.jsp";
    }
    @RequestMapping("/updateUser.form")
    public String updateUser(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
        if(!((User)request.getSession().getAttribute("user")).getId().equalsIgnoreCase(request.getParameter("id")))
            return "redirect:/home.form?id=" + request.getParameter("id");
        user.setId(request.getParameter("id"));
        user.setPassword(DigestUtils.md5DigestAsHex(request.getParameter("password").getBytes()));
        user.setAge(request.getParameter("birthday"));
        user.setSex(request.getParameter("sex"));
        if(userService.modifyUser(user))
            request.getSession().setAttribute("user", userService.getUserById(user.getId()));
        return "redirect:/home.form?id=" + user.getId();
    }
    @ExceptionHandler
    public String exHandle(HttpServletRequest request, Exception ex) {
        request.setAttribute("message", ex.getMessage());
        if(ex instanceof UserRegisterException)
            return "Register.jsp";
        if(ex instanceof UserLoginException)
            return "Login.jsp";
        return "Error.jsp";
    }
}
