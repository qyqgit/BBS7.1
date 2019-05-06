package org.fishcc.bbs.service;

import java.util.List;

import org.fishcc.bbs.entity.User;

public interface UserService {
    public boolean registerUser(User user);
    public boolean alreadyRegister(String name);
    public boolean loginSuccess(User user);
    public boolean modifyUser(User user);
    public User getUserById(String id);
    public User getUserByName(String name);
    public List<User> getLastSendMessageUserList();
}
