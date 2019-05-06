package org.fishcc.bbs.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.fishcc.bbs.dao.UserDao;
import org.fishcc.bbs.entity.User;
import org.fishcc.bbs.exception.UserLoginException;
import org.fishcc.bbs.exception.UserRegisterException;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
    @Resource(name="userDao")
    private UserDao userDao;
    @Resource(name="formatDate")
    private SimpleDateFormat formatDate;

    public boolean registerUser(User user) {
        // TODO Auto-generated method stub
        boolean haveException = false;
        if(user == null || "".equals(user.getName())) {
            haveException = true;
            throw new UserRegisterException("empty name!");
        }
        if(alreadyRegister(user.getName())) {
            haveException = true;
            throw new UserRegisterException("already registered!");
        }
        if(user == null || "".equalsIgnoreCase(user.getPassword())) {
            haveException = true;
            throw new UserRegisterException("empty password!");
        }
        if("d41d8cd98f00b204e9800998ecf8427e".equalsIgnoreCase(user.getPassword())) {
            haveException = true;
            throw new UserRegisterException("empty password!");
        }
        if(!"".equals(user.getAge())) {
            formatDate.setLenient(false);
            try {
                formatDate.parse(user.getAge());
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                haveException = true;
                throw new UserRegisterException("birthday error!");
            }
        }
        if(haveException)
            return false;
        return 1 == userDao.insertUser(user);
    }
    public boolean alreadyRegister(String name) {
        // TODO Auto-generated method stub
        User user = userDao.selectUserByName(name);
        if(user == null)
            return false;
        return true;
    }
    public boolean loginSuccess(User user) {
        // TODO Auto-generated method stub
        boolean haveException = false;
        if(user == null || "".equals(user.getName())) {
            haveException = true;
            throw new UserLoginException("empty name!");
        }
        if(!alreadyRegister(user.getName())) {
            haveException = true;
            throw new UserLoginException("no such name!");
        }
        if(user == null || "".equalsIgnoreCase(user.getPassword())) {
            haveException = true;
            throw new UserLoginException("empty password!");
        }
        if("d41d8cd98f00b204e9800998ecf8427e".equalsIgnoreCase(user.getPassword())) {
            haveException = true;
            throw new UserLoginException("empty password!");
        }
        User userTmp = userDao.selectUserByName(user.getName());
        if(!userTmp.getPassword().equalsIgnoreCase(user.getPassword())) {
            haveException = true;
            throw new UserLoginException("password error!");
        }
        if(haveException)
            return false;
        return true;
    }
    public User getUserById(String id) {
        // TODO Auto-generated method stub
        return userDao.selectUserById(id);
    }
    public User getUserByName(String name) {
        // TODO Auto-generated method stub
        return userDao.selectUserByName(name);
    }
    @Override
    public List<User> getLastSendMessageUserList() {
        // TODO Auto-generated method stub
        return userDao.selectLastSendMessageUserList();
    }
    @Override
    public boolean modifyUser(User user) {
        // TODO Auto-generated method stub
        return 1 == userDao.updateUser(user);
    }

}
