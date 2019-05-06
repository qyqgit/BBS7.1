package org.fishcc.bbs.dao;

import java.util.List;

import org.fishcc.bbs.entity.User;


public interface UserDao {
    public int insertUser(User user);
    public int deleteUser(String id);
    public int updateUser(User user);
    public User selectUserById(String id);
    public User selectUserByName(String name);
    public List<User> selectLastSendMessageUserList();
}
